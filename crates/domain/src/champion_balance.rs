//! Places one patch's phase powers on a shared scale.
//!
//! [`crate::rate_patch`] scores each kit against a fixed cap, so several kits
//! land on 100 and the draft can no longer tell them apart. This module keeps
//! that raw sheet for lanes, damage and tankiness, and replaces the three phase
//! scores. The transform is one straight line on `ln(1 + power)`, fitted to the
//! whole roster: the median sits on [`PHASE_CENTER`], one median absolute
//! deviation is [`POINTS_PER_MAD`] points, and the result stays inside
//! [`PHASE_FLOOR`]..=[`PHASE_CEILING`]. Order is kept. A kit whose late power
//! is higher than its early power stays later.

use crate::champion_rating::{phase_powers, OfficialKit, RatedChampion};
use crate::score::{PhaseScores, Score};

pub const PHASE_CENTER: u8 = 55;
pub const PHASE_FLOOR: u8 = 30;
pub const PHASE_CEILING: u8 = 88;
const POINTS_PER_MAD: f64 = 12.0;
const MIN_MAD: f64 = 0.15;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BalanceError {
    LengthMismatch,
}

pub fn balance_roster(
    kits: &[OfficialKit],
    rated: &[RatedChampion],
) -> Result<Vec<RatedChampion>, BalanceError> {
    if kits.len() != rated.len() {
        return Err(BalanceError::LengthMismatch);
    }
    let powers: Vec<[f64; 3]> = kits.iter().map(phase_powers).collect();
    let phases = balance_phase_powers(&powers);
    Ok(rated
        .iter()
        .zip(phases)
        .map(|(row, phases)| RatedChampion { phases, ..*row })
        .collect())
}

pub fn balance_phase_powers(powers: &[[f64; 3]]) -> Vec<PhaseScores> {
    if powers.is_empty() {
        return Vec::new();
    }
    let logs: Vec<f64> = powers.iter().flatten().copied().map(phase_log).collect();
    let center = median(&mut logs.clone());
    let mut deviations: Vec<f64> = logs.iter().map(|value| (value - center).abs()).collect();
    let mad = median(&mut deviations).max(MIN_MAD);
    let slope = POINTS_PER_MAD / mad;
    powers
        .iter()
        .map(|power| PhaseScores {
            early: place(phase_log(power[0]), center, slope),
            mid: place(phase_log(power[1]), center, slope),
            late: place(phase_log(power[2]), center, slope),
        })
        .collect()
}

fn place(log_power: f64, center: f64, slope: f64) -> Score {
    let shifted = f64::from(PHASE_CENTER) + (log_power - center) * slope;
    let rounded = shifted.round();
    let clamped = if rounded <= f64::from(PHASE_FLOOR) {
        PHASE_FLOOR
    } else if rounded >= f64::from(PHASE_CEILING) {
        PHASE_CEILING
    } else {
        rounded as u8
    };
    Score::new(clamped).expect("a balanced phase stays inside 0..=100")
}

fn phase_log(power: f64) -> f64 {
    power.max(0.0).ln_1p()
}

fn median(values: &mut [f64]) -> f64 {
    values.sort_by(|left, right| left.partial_cmp(right).unwrap_or(std::cmp::Ordering::Equal));
    let mid = values.len() / 2;
    if values.len() % 2 == 0 {
        (values[mid - 1] + values[mid]) / 2.0
    } else {
        values[mid]
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::champion_rating::{rate_patch, ChampionClass, OfficialKit, SpellLine};

    fn kit(flat: f64, ratio: f64) -> OfficialKit {
        OfficialKit {
            classes: vec![ChampionClass::Mage],
            info_attack: 2,
            info_magic: 8,
            true_damage_texts: 0,
            spell_count: 1,
            health: 500.0,
            health_per_level: 80.0,
            bonus_health: 0.0,
            armor: 20.0,
            armor_per_level: 3.0,
            magic_resist: 30.0,
            magic_resist_per_level: 0.0,
            attack_damage: 50.0,
            attack_damage_per_level: 3.0,
            attack_speed_offset: 0.0,
            attack_speed_per_level: 0.0,
            spells: vec![SpellLine {
                ultimate: false,
                flat: vec![flat, flat, flat, flat, flat],
                percent_health: vec![],
                ability_power: vec![ratio],
                bonus_attack_damage: vec![],
                total_attack_damage: vec![],
            }],
        }
    }

    #[test]
    fn equal_powers_sit_on_the_center() {
        let powers = [[100.0, 100.0, 100.0], [100.0, 100.0, 100.0]];
        let balanced = balance_phase_powers(&powers);
        assert!(balanced.iter().all(|phases| {
            phases.early.value() == PHASE_CENTER
                && phases.mid.value() == PHASE_CENTER
                && phases.late.value() == PHASE_CENTER
        }));
    }

    #[test]
    fn a_stronger_kit_stays_ahead_without_both_sticking_at_one_hundred() {
        let kits = [kit(40.0, 0.0), kit(400.0, 0.2), kit(4000.0, 1.0)];
        let rated = rate_patch(&kits).unwrap();
        let balanced = balance_roster(&kits, &rated).unwrap();
        let early: Vec<u8> = balanced
            .iter()
            .map(|row| row.phases.early.value())
            .collect();
        assert!(early[2] > early[1] && early[1] > early[0]);
        assert!(early[2] <= PHASE_CEILING);
        assert!(early[2] < 100);
        assert!(early[0] >= PHASE_FLOOR);
        assert_eq!(rated[0].damage.ability.value(), 80);
        assert_eq!(balanced[0].damage, rated[0].damage);
        assert_eq!(balanced[0].roles, rated[0].roles);
        assert_eq!(balanced[0].tankiness, rated[0].tankiness);
    }

    #[test]
    fn a_scaling_kit_stays_stronger_late_than_early() {
        let kits = [kit(200.0, 0.0), kit(20.0, 1.2)];
        let rated = rate_patch(&kits).unwrap();
        let balanced = balance_roster(&kits, &rated).unwrap();
        let scaler = balanced[1].phases;
        assert!(scaler.late.value() > scaler.early.value());
        assert!(scaler.mid.value() >= scaler.early.value());
        assert!(scaler.late.value() >= scaler.mid.value());
    }

    #[test]
    fn an_empty_roster_stays_empty_and_a_short_sheet_is_rejected() {
        assert!(balance_phase_powers(&[]).is_empty());
        let kits = [kit(40.0, 0.0)];
        let rated = rate_patch(&kits).unwrap();
        assert_eq!(
            balance_roster(&kits, &[]).unwrap_err(),
            BalanceError::LengthMismatch
        );
        assert_eq!(
            balance_roster(&[], &rated).unwrap_err(),
            BalanceError::LengthMismatch
        );
    }
}
