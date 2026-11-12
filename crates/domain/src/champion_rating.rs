//! Turns one Data Dragon champion file into the eleven `champion_on_patch` scores.
//!
//! The file is `championFull.json` for a patch, for example
//! <https://ddragon.leagueoflegends.com/cdn/4.21.5/data/en_US/championFull.json>.
//! The fields used are `tags`, `info.attack`, `info.magic`, the combat stats
//! `hp`, `hpperlevel`, `armor`, `armorperlevel`, `spellblock`, `spellblockperlevel`,
//! and the passive and spell texts.
//!
//! [`LANES`], [`REFERENCE_LEVEL`] and the three caps are the knobs. Change them here,
//! then regenerate the seed with `cargo run -p storage --bin rate_champions`.
//!
//! Armor and magic resist are the stats grown to [`REFERENCE_LEVEL`] with the
//! client curve, then `100 * stat / cap`. Health is the effective health at that
//! level: the grown bar, plus permanent stacked bonus health written in the kit,
//! reduced by an even mix of physical and magic damage. 100 health means
//! [`EFFECTIVE_HEALTH_CAP`] effective health. 100 armor means [`ARMOR_CAP`] armor,
//! and the same for magic resist.

use crate::patch::RoleScores;
use crate::score::{PhaseScores, Score};
use crate::{DamageSliders, TankinessSliders};

/// Data Dragon class tag (`tags` on the champion file).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ChampionClass {
    Fighter,
    Tank,
    Mage,
    Assassin,
    Marksman,
    Support,
}

impl ChampionClass {
    pub fn parse(tag: &str) -> Option<Self> {
        match tag {
            "Fighter" => Some(Self::Fighter),
            "Tank" => Some(Self::Tank),
            "Mage" => Some(Self::Mage),
            "Assassin" => Some(Self::Assassin),
            "Marksman" => Some(Self::Marksman),
            "Support" => Some(Self::Support),
            // Patch 4.21.5 spells Alistar's second tag this way.
            "Suppport" => Some(Self::Support),
            _ => None,
        }
    }
}

/// Stats are grown to this level. 18 is the last level of a game, where health growth
/// has fully arrived.
pub const REFERENCE_LEVEL: u8 = 18;

/// A score of 100 is this much effective health, armor, or magic resist.
pub const EFFECTIVE_HEALTH_CAP: f64 = 5000.0;
pub const ARMOR_CAP: f64 = 100.0;
pub const MAGIC_RESIST_CAP: f64 = 100.0;

/// Client growth curve: `(level - 1) * (0.7025 + 0.0175 * (level - 1))`.
/// At level 18 the coefficient is exactly 17.
const GROWTH_BASE: f64 = 0.7025;
const GROWTH_STEP: f64 = 0.0175;

/// English Data Dragon wording. A passive or a spell counts when its text contains this phrase.
pub const TRUE_DAMAGE_PHRASE: &str = "true damage";

/// Lane scores for one class. Columns are top, jungle, mid, adc, support.
/// Two classes use the mean of their rows, rounded to the nearest integer.
/// A half rounds away from zero, so 82.5 becomes 83.
const LANES: [(ChampionClass, [u8; 5]); 6] = [
    (ChampionClass::Fighter, [80, 65, 25, 5, 15]),
    (ChampionClass::Tank, [85, 55, 10, 0, 45]),
    (ChampionClass::Mage, [20, 15, 85, 10, 40]),
    (ChampionClass::Assassin, [35, 70, 75, 5, 10]),
    (ChampionClass::Marksman, [10, 5, 15, 90, 20]),
    (ChampionClass::Support, [15, 20, 25, 10, 90]),
];

/// One champion, taken from a Data Dragon champion file.
/// `health` and the other combat stats are the level-1 bases (`hp`, `armor`, `spellblock`).
#[derive(Debug, Clone, PartialEq)]
pub struct OfficialKit {
    pub classes: Vec<ChampionClass>,
    pub info_attack: u8,
    pub info_magic: u8,
    pub true_damage_texts: u8,
    pub spell_count: u8,
    pub health: f64,
    pub health_per_level: f64,
    /// Permanent bonus health from a capped stack in the kit, already at max rank.
    pub bonus_health: f64,
    pub armor: f64,
    pub armor_per_level: f64,
    pub magic_resist: f64,
    pub magic_resist_per_level: f64,
    pub attack_damage: f64,
    pub attack_damage_per_level: f64,
    pub attack_speed_offset: f64,
    pub attack_speed_per_level: f64,
    pub spells: Vec<SpellLine>,
}

/// One spell's flat damage, percent-health damage, and ratios, one entry per rank.
/// A single ratio entry applies at every rank.
#[derive(Debug, Clone, PartialEq)]
pub struct SpellLine {
    pub ultimate: bool,
    pub flat: Vec<f64>,
    pub percent_health: Vec<f64>,
    pub ability_power: Vec<f64>,
    pub bonus_attack_damage: Vec<f64>,
    pub total_attack_damage: Vec<f64>,
}

/// One moment of the game. Basic spells share a rank because the file does not
/// say which spell is maxed. The ultimate is the spell whose max rank is 3.
#[derive(Debug, Clone, Copy)]
pub struct PhaseSnapshot {
    pub level: u8,
    pub basic_rank: u8,
    pub ultimate_rank: u8,
    pub bonus_attack_damage: f64,
    pub ability_power: f64,
    pub target_health: f64,
    pub cap: f64,
}

pub const PHASES: [PhaseSnapshot; 3] = [
    PhaseSnapshot {
        level: 6,
        basic_rank: 2,
        ultimate_rank: 1,
        bonus_attack_damage: 0.0,
        ability_power: 0.0,
        target_health: 1400.0,
        cap: 1600.0,
    },
    PhaseSnapshot {
        level: 11,
        basic_rank: 3,
        ultimate_rank: 2,
        bonus_attack_damage: 50.0,
        ability_power: 100.0,
        target_health: 1800.0,
        cap: 2600.0,
    },
    PhaseSnapshot {
        level: 18,
        basic_rank: 5,
        ultimate_rank: 3,
        bonus_attack_damage: 150.0,
        ability_power: 300.0,
        target_health: 2300.0,
        cap: 4200.0,
    },
];

const AUTO_SECONDS: f64 = 2.0;
const BASE_ATTACK_INTERVAL: f64 = 0.625;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct RatedChampion {
    pub roles: RoleScores,
    pub damage: DamageSliders,
    pub tankiness: TankinessSliders,
    pub phases: PhaseScores,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RatingError {
    NoClass,
}

pub fn counts_as_true_damage(text: &str) -> bool {
    text.to_ascii_lowercase().contains(TRUE_DAMAGE_PHRASE)
}

/// Rates every kit on one patch. Each champion is scored on its own sheet.
pub fn rate_patch(kits: &[OfficialKit]) -> Result<Vec<RatedChampion>, RatingError> {
    kits.iter()
        .map(|kit| {
            if kit.classes.is_empty() {
                return Err(RatingError::NoClass);
            }
            Ok(RatedChampion {
                roles: lanes(&kit.classes)?,
                damage: DamageSliders {
                    attack: bar(kit.info_attack),
                    ability: bar(kit.info_magic),
                    true_damage: true_damage(kit.true_damage_texts, kit.spell_count),
                },
                tankiness: TankinessSliders {
                    health: score(nearest(
                        100.0 * effective_health(kit) / EFFECTIVE_HEALTH_CAP,
                    )),
                    armor: along(kit.armor, kit.armor_per_level, ARMOR_CAP),
                    magic_resist: along(
                        kit.magic_resist,
                        kit.magic_resist_per_level,
                        MAGIC_RESIST_CAP,
                    ),
                },
                phases: phase_scores(kit),
            })
        })
        .collect()
}

fn lanes(classes: &[ChampionClass]) -> Result<RoleScores, RatingError> {
    if classes.is_empty() {
        return Err(RatingError::NoClass);
    }
    let mut sums = [0u16; 5];
    for class in classes {
        let row = LANES
            .iter()
            .find(|(candidate, _)| candidate == class)
            .map(|(_, row)| *row)
            .expect("every class has a lane row");
        for (sum, value) in sums.iter_mut().zip(row) {
            *sum += u16::from(value);
        }
    }
    let count = classes.len() as f64;
    let values = sums.map(|sum| nearest(f64::from(sum) / count));
    Ok(RoleScores {
        top: score(values[0]),
        jungle: score(values[1]),
        mid: score(values[2]),
        adc: score(values[3]),
        support: score(values[4]),
    })
}

fn bar(info: u8) -> Score {
    score(info.saturating_mul(10).min(100))
}

fn true_damage(texts: u8, spells: u8) -> Score {
    if texts == 0 {
        return score(0);
    }
    score(nearest(
        100.0 * f64::from(texts) / (1.0 + f64::from(spells)),
    ))
}

/// Bonus health from a line such as `gaining {{ e3 }} maximum Health (maximum 6 stacks)`.
/// `effect` receives the effect index and returns that effect at its maximum rank.
pub fn stacked_maximum_health(text: &str, effect: impl Fn(usize) -> Option<f64>) -> f64 {
    let marker = "gaining {{ e";
    let mut total = 0.0;
    let mut rest = text;
    while let Some(start) = rest.find(marker) {
        let after = &rest[start + marker.len()..];
        let Some((index_text, after_index)) = after.split_once(" }} maximum Health (maximum ")
        else {
            break;
        };
        let Some((stacks_text, after_stacks)) = after_index.split_once(" stacks)") else {
            break;
        };
        if let (Ok(index), Ok(stacks)) = (index_text.parse::<usize>(), stacks_text.parse::<u32>()) {
            if let Some(per_stack) = effect(index) {
                total += per_stack * f64::from(stacks);
            }
        }
        rest = after_stacks;
    }
    total
}

fn growth_levels(level: u8) -> f64 {
    let steps = f64::from(level - 1);
    steps * (GROWTH_BASE + GROWTH_STEP * steps)
}

fn along(base: f64, per_level: f64, cap: f64) -> Score {
    let grown = base + per_level * growth_levels(REFERENCE_LEVEL);
    score(nearest(100.0 * grown / cap))
}

fn phase_scores(kit: &OfficialKit) -> PhaseScores {
    let scores: Vec<u8> = PHASES
        .iter()
        .map(|snapshot| nearest(100.0 * phase_power(kit, snapshot) / snapshot.cap))
        .collect();
    PhaseScores {
        early: score(scores[0]),
        mid: score(scores[1]),
        late: score(scores[2]),
    }
}

fn phase_power(kit: &OfficialKit, snapshot: &PhaseSnapshot) -> f64 {
    let steps = growth_levels(snapshot.level);
    let attack_damage =
        kit.attack_damage + kit.attack_damage_per_level * steps + snapshot.bonus_attack_damage;
    let denominator = 1.0 + kit.attack_speed_offset;
    let base_speed = if denominator.abs() < f64::EPSILON {
        BASE_ATTACK_INTERVAL
    } else {
        BASE_ATTACK_INTERVAL / denominator
    };
    let attacks = base_speed * (1.0 + kit.attack_speed_per_level * steps / 100.0);
    let mut total = attack_damage * attacks * AUTO_SECONDS;
    for spell in &kit.spells {
        let rank = if spell.ultimate {
            snapshot.ultimate_rank
        } else {
            snapshot.basic_rank
        };
        total += at(&spell.flat, rank);
        total += at(&spell.percent_health, rank) / 100.0 * snapshot.target_health;
        total += at(&spell.ability_power, rank) * snapshot.ability_power;
        total += at(&spell.bonus_attack_damage, rank) * snapshot.bonus_attack_damage;
        total += at(&spell.total_attack_damage, rank) * attack_damage;
    }
    total
}

fn at(values: &[f64], rank: u8) -> f64 {
    if values.is_empty() || rank == 0 {
        return 0.0;
    }
    values[(rank as usize - 1).min(values.len() - 1)]
}

fn effective_health(kit: &OfficialKit) -> f64 {
    let steps = growth_levels(REFERENCE_LEVEL);
    let health = kit.health + kit.health_per_level * steps + kit.bonus_health;
    let armor = 1.0 + (kit.armor + kit.armor_per_level * steps) / 100.0;
    let magic_resist = 1.0 + (kit.magic_resist + kit.magic_resist_per_level * steps) / 100.0;
    2.0 * health * armor * magic_resist / (armor + magic_resist)
}

fn nearest(value: f64) -> u8 {
    let rounded = value.round();
    if rounded <= 0.0 {
        0
    } else if rounded >= 100.0 {
        100
    } else {
        rounded as u8
    }
}

fn score(value: u8) -> Score {
    Score::new(value).expect("a rating is clamped to 0..=100")
}

#[cfg(test)]
mod tests {
    use super::*;

    fn kit(classes: Vec<ChampionClass>) -> OfficialKit {
        OfficialKit {
            classes,
            info_attack: 3,
            info_magic: 8,
            true_damage_texts: 0,
            spell_count: 4,
            health: 380.0,
            health_per_level: 80.0,
            bonus_health: 0.0,
            armor: 11.0,
            armor_per_level: 3.5,
            magic_resist: 30.0,
            magic_resist_per_level: 0.0,
            attack_damage: 0.0,
            attack_damage_per_level: 0.0,
            attack_speed_offset: 0.0,
            attack_speed_per_level: 0.0,
            spells: Vec::new(),
        }
    }

    #[test]
    fn a_mage_keeps_its_lane_row() {
        let rated = rate_patch(&[kit(vec![ChampionClass::Mage])]).unwrap();
        let roles = rated[0].roles;
        assert_eq!(
            (
                roles.top.value(),
                roles.jungle.value(),
                roles.mid.value(),
                roles.adc.value(),
                roles.support.value()
            ),
            (20, 15, 85, 10, 40)
        );
    }

    #[test]
    fn two_classes_average_and_round_halves_away_from_zero() {
        let rated = rate_patch(&[kit(vec![ChampionClass::Fighter, ChampionClass::Tank])]).unwrap();
        let roles = rated[0].roles;
        assert_eq!(
            (
                roles.top.value(),
                roles.jungle.value(),
                roles.mid.value(),
                roles.adc.value(),
                roles.support.value()
            ),
            (83, 60, 18, 3, 30)
        );
    }

    #[test]
    fn damage_bars_are_the_info_values_times_ten() {
        let mut source = kit(vec![ChampionClass::Mage]);
        source.true_damage_texts = 1;
        let rated = rate_patch(&[source]).unwrap();
        let damage = rated[0].damage;
        assert_eq!(damage.attack.value(), 30);
        assert_eq!(damage.ability.value(), 80);
        assert_eq!(damage.true_damage.value(), 20);
    }

    #[test]
    fn an_info_bar_above_ten_stays_inside_the_score() {
        let mut source = kit(vec![ChampionClass::Mage]);
        source.info_attack = 12;
        let rated = rate_patch(&[source]).unwrap();
        assert_eq!(rated[0].damage.attack.value(), 100);
    }

    #[test]
    fn magic_resist_keeps_a_small_gap_instead_of_stretching_it() {
        let mut ordinary = kit(vec![ChampionClass::Mage]);
        ordinary.magic_resist = 30.0;
        ordinary.magic_resist_per_level = 0.0;
        let mut melee = kit(vec![ChampionClass::Fighter]);
        melee.magic_resist = 32.1;
        melee.magic_resist_per_level = 1.25;
        let rated = rate_patch(&[ordinary, melee]).unwrap();
        assert_eq!(rated[0].tankiness.magic_resist.value(), 30);
        assert_eq!(rated[1].tankiness.magic_resist.value(), 53);
    }

    #[test]
    fn the_4_21_sheet_gives_hecarim_the_larger_health_bar() {
        let mundo = OfficialKit {
            classes: vec![ChampionClass::Fighter],
            info_attack: 5,
            info_magic: 6,
            true_damage_texts: 0,
            spell_count: 4,
            health: 582.52,
            health_per_level: 89.0,
            bonus_health: 0.0,
            armor: 26.88,
            armor_per_level: 3.5,
            magic_resist: 32.1,
            magic_resist_per_level: 1.25,
            attack_damage: 0.0,
            attack_damage_per_level: 0.0,
            attack_speed_offset: 0.0,
            attack_speed_per_level: 0.0,
            spells: Vec::new(),
        };
        let mut hecarim = mundo.clone();
        hecarim.health = 599.6;
        hecarim.health_per_level = 95.0;
        hecarim.armor = 26.72;
        hecarim.armor_per_level = 4.0;
        let rated = rate_patch(&[mundo, hecarim]).unwrap();
        assert_eq!(rated[0].tankiness.health.value(), 71);
        assert_eq!(rated[1].tankiness.health.value(), 76);
    }

    #[test]
    fn feast_stacks_make_chogath_harder_to_kill_than_corki() {
        let corki = OfficialKit {
            classes: vec![ChampionClass::Marksman],
            info_attack: 8,
            info_magic: 6,
            true_damage_texts: 0,
            spell_count: 4,
            health: 512.76,
            health_per_level: 82.0,
            bonus_health: 0.0,
            armor: 23.38,
            armor_per_level: 3.5,
            magic_resist: 30.0,
            magic_resist_per_level: 0.0,
            attack_damage: 0.0,
            attack_damage_per_level: 0.0,
            attack_speed_offset: 0.0,
            attack_speed_per_level: 0.0,
            spells: Vec::new(),
        };
        let chogath = OfficialKit {
            classes: vec![ChampionClass::Tank, ChampionClass::Mage],
            info_attack: 3,
            info_magic: 7,
            true_damage_texts: 1,
            spell_count: 4,
            health: 574.4,
            health_per_level: 80.0,
            bonus_health: 150.0 * 6.0,
            armor: 28.88,
            armor_per_level: 3.5,
            magic_resist: 32.1,
            magic_resist_per_level: 1.25,
            attack_damage: 0.0,
            attack_damage_per_level: 0.0,
            attack_speed_offset: 0.0,
            attack_speed_per_level: 0.0,
            spells: Vec::new(),
        };
        let rated = rate_patch(&[corki, chogath]).unwrap();
        assert_eq!(rated[0].tankiness.health.value(), 58);
        assert_eq!(rated[1].tankiness.health.value(), 96);
    }

    #[test]
    fn feast_reads_the_maximum_stacks_at_the_last_rank() {
        let text = "gaining {{ e3 }} maximum Health (maximum 6 stacks).";
        let bonus = stacked_maximum_health(text, |index| match index {
            3 => Some(150.0),
            _ => None,
        });
        assert_eq!(bonus, 900.0);
        assert_eq!(
            stacked_maximum_health("deals magic damage", |_| Some(1.0)),
            0.0
        );
    }

    #[test]
    fn flat_base_damage_leads_early_and_a_ratio_leads_late() {
        let mut early_spell = kit(vec![ChampionClass::Fighter]);
        early_spell.spells = vec![SpellLine {
            ultimate: false,
            flat: vec![200.0, 200.0, 200.0, 200.0, 200.0],
            percent_health: vec![],
            ability_power: vec![],
            bonus_attack_damage: vec![],
            total_attack_damage: vec![],
        }];
        let mut scaling_spell = kit(vec![ChampionClass::Mage]);
        scaling_spell.spells = vec![SpellLine {
            ultimate: false,
            flat: vec![80.0, 115.0, 150.0, 185.0, 220.0],
            percent_health: vec![],
            ability_power: vec![0.8],
            bonus_attack_damage: vec![],
            total_attack_damage: vec![],
        }];
        let rated = rate_patch(&[early_spell, scaling_spell]).unwrap();
        assert!(rated[0].phases.early.value() > rated[1].phases.early.value());
        assert!(rated[1].phases.late.value() > rated[0].phases.late.value());
        assert_eq!(
            (
                rated[1].phases.early.value(),
                rated[1].phases.mid.value(),
                rated[1].phases.late.value()
            ),
            (7, 11, 15)
        );
    }

    #[test]
    fn the_client_curve_is_exact_at_level_eighteen() {
        assert!((growth_levels(6) - 3.95).abs() < 1e-9);
        assert!((growth_levels(18) - 17.0).abs() < 1e-9);
    }

    #[test]
    fn a_champion_without_a_class_is_rejected() {
        assert_eq!(
            rate_patch(&[kit(vec![])]).unwrap_err(),
            RatingError::NoClass
        );
    }

    #[test]
    fn the_4_21_alistar_tag_is_support() {
        assert_eq!(
            ChampionClass::parse("Suppport"),
            Some(ChampionClass::Support)
        );
    }

    #[test]
    fn the_true_damage_phrase_is_case_insensitive() {
        assert!(counts_as_true_damage("deals True Damage to champions"));
        assert!(!counts_as_true_damage("deals magic damage"));
    }
}
