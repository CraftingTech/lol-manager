use crate::champion::KitProfile;
use crate::player::{Competencies, PlayerState};
use crate::role::{Role, RoleSkill};
use crate::score::{PhaseScores, Score};
use crate::tag::Tag;

use super::clock::phase_at;

pub const VERY_HIGH_SHOTCALLING: u8 = 80;
const ROOKIE_MENTAL_DROP: u8 = 20;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ReadPlayer {
    pub name_key: u8,
    pub role: Role,
    pub mechanics: u8,
    pub teamfight: u8,
    pub map_awareness: u8,
    pub objectives: u8,
    pub tempo: u8,
    pub mental: u8,
    pub itemisation: u8,
    pub shotcalling: u8,
    pub call_value: u8,
    pub role_skill: u8,
    pub mastery: u8,
    pub phase: u8,
    pub punishment: i16,
    pub oriented: KitProfile,
    pub very_high_shotcalling: bool,
}

pub fn read_player(
    index: u8,
    role: Role,
    competencies: Competencies,
    state: PlayerState,
    tags: &[Tag],
    mastery: Score,
    kit: KitProfile,
    matchup: crate::champion::MatchupPlan,
    minute: u16,
    elimination: bool,
) -> ReadPlayer {
    let phase_score = phase_score(competencies.phases, minute);
    let phase = u8::try_from(u16::from(phase_score.value()) * u16::from(condition(state)) / 100)
        .unwrap_or(0);
    let mut mental = gate(competencies.mental, phase_score, state);
    if elimination && tags.contains(&Tag::Rookie) {
        mental = mental.saturating_sub(ROOKIE_MENTAL_DROP);
    }
    let itemisation = gate(competencies.itemisation, phase_score, state);
    let shotcalling = gate(competencies.shotcalling, phase_score, state);
    ReadPlayer {
        name_key: index,
        role,
        mechanics: gate(competencies.mechanics, phase_score, state),
        teamfight: gate(competencies.teamfight, phase_score, state),
        map_awareness: gate(competencies.map_awareness, phase_score, state),
        objectives: gate(competencies.objectives, phase_score, state),
        tempo: gate(competencies.tempo, phase_score, state),
        mental,
        itemisation,
        shotcalling,
        call_value: call_value(shotcalling, role),
        role_skill: gate(
            role_skill_score(role, competencies.role_skill),
            phase_score,
            state,
        ),
        mastery: gate(mastery, phase_score, state),
        phase,
        punishment: punishment(itemisation),
        oriented: kit.orient(
            Score::new(itemisation).unwrap_or(Score::new(0).unwrap()),
            matchup,
        ),
        very_high_shotcalling: shotcalling >= VERY_HIGH_SHOTCALLING,
    }
}

pub fn phase_score(phases: PhaseScores, minute: u16) -> Score {
    match phase_at(minute) {
        super::clock::Phase::Early => phases.early,
        super::clock::Phase::Mid => phases.mid,
        super::clock::Phase::Late => phases.late,
    }
}

pub fn call_value(shotcalling: u8, role: Role) -> u8 {
    let share = match role {
        Role::Jungle | Role::Support => 100u8,
        Role::Mid => 50,
        Role::Adc => 25,
        Role::Top => 10,
    };
    u8::try_from(u16::from(shotcalling) * u16::from(share) / 100).unwrap_or(0)
}

pub fn team_bonus(players: &[ReadPlayer]) -> u8 {
    let very_high: Vec<u8> = players
        .iter()
        .filter(|player| player.very_high_shotcalling)
        .map(|player| player.call_value)
        .collect();
    if very_high.is_empty() || very_high.len() >= 4 {
        return 0;
    }
    let sum: u16 = very_high.iter().copied().map(u16::from).sum();
    u8::try_from(sum / very_high.len() as u16).unwrap_or(0)
}

pub fn side_strength(players: &[ReadPlayer]) -> u8 {
    if players.is_empty() {
        return 0;
    }
    let body: u16 = players
        .iter()
        .map(|player| {
            u16::from(player.mechanics)
                + u16::from(player.teamfight)
                + u16::from(player.map_awareness)
                + u16::from(player.tempo)
                + u16::from(player.mental)
                + u16::from(player.role_skill)
        })
        .sum();
    let average = body / (players.len() as u16 * 6);
    let punish: i16 = players.iter().map(|player| player.punishment).sum::<i16>()
        / i16::try_from(players.len()).unwrap_or(1);
    let total = i16::try_from(average).unwrap_or(0) + i16::from(team_bonus(players)) / 5 - punish;
    total.clamp(0, 100) as u8
}

fn role_skill_score(role: Role, skill: RoleSkill) -> Score {
    match (role, skill) {
        (Role::Jungle, RoleSkill::Pathing(score)) => score,
        (Role::Top | Role::Mid | Role::Adc | Role::Support, RoleSkill::Laning(score)) => score,
        _ => Score::new(0).unwrap(),
    }
}

fn gate(stat: Score, phase: Score, state: PlayerState) -> u8 {
    let phased = u16::from(stat.value()) * u16::from(phase.value()) / 100;
    u8::try_from(phased * u16::from(condition(state)) / 100).unwrap_or(0)
}

fn condition(state: PlayerState) -> u8 {
    let form = u16::from(state.form.value());
    let fresh = u16::from(100 - state.fatigue.value());
    u8::try_from((form + fresh) / 2).unwrap_or(0)
}

fn punishment(itemisation: u8) -> i16 {
    if itemisation >= 50 {
        0
    } else {
        i16::from(50 - itemisation) / 5
    }
}

#[cfg(test)]
mod tests {
    use super::{call_value, read_player, team_bonus, VERY_HIGH_SHOTCALLING};
    use crate::champion::{DamageSliders, KitProfile, MatchupPlan, TankinessSliders};
    use crate::player::{Competencies, PlayerState};
    use crate::role::{Role, RoleSkill};
    use crate::score::{PhaseScores, Score};
    use crate::tag::Tag;

    fn score(value: u8) -> Score {
        Score::new(value).unwrap()
    }

    fn sheet(stat: u8, early: u8, mid: u8, late: u8, role: Role) -> Competencies {
        let value = score(stat);
        Competencies {
            mechanics: value,
            teamfight: value,
            map_awareness: value,
            objectives: value,
            tempo: value,
            mental: value,
            itemisation: value,
            phases: PhaseScores {
                early: score(early),
                mid: score(mid),
                late: score(late),
            },
            shotcalling: value,
            role_skill: RoleSkill::for_role(role, value),
        }
    }

    fn calm() -> PlayerState {
        PlayerState {
            form: score(100),
            fatigue: score(0),
        }
    }

    fn kit(ability: u8) -> KitProfile {
        let value = score(40);
        KitProfile {
            damage: DamageSliders {
                attack: value,
                ability: score(ability),
                true_damage: score(0),
            },
            tankiness: TankinessSliders {
                health: value,
                armor: value,
                magic_resist: value,
            },
        }
    }

    fn read_at(
        role: Role,
        minute: u16,
        competencies: Competencies,
        tags: &[Tag],
    ) -> super::ReadPlayer {
        read_player(
            0,
            role,
            competencies,
            calm(),
            tags,
            score(70),
            kit(40),
            MatchupPlan::Ability,
            minute,
            false,
        )
    }

    #[test]
    fn early_opens_the_sheet_at_ten_and_late_opens_it_at_thirty_five() {
        let competencies = sheet(100, 80, 40, 10, Role::Mid);
        let early = read_at(Role::Mid, 10, competencies, &[]);
        let late = read_at(Role::Mid, 35, competencies, &[]);
        assert_eq!(early.mechanics, 80);
        assert_eq!(late.mechanics, 10);
        assert_eq!(early.phase, 80);
        assert_eq!(late.phase, 10);
    }

    #[test]
    fn mid_uses_the_middle_score() {
        let competencies = sheet(100, 10, 70, 20, Role::Mid);
        assert_eq!(read_at(Role::Mid, 20, competencies, &[]).mechanics, 70);
    }

    #[test]
    fn jungle_is_read_on_pathing_and_the_lanes_on_laning() {
        let jungle = sheet(80, 100, 100, 100, Role::Jungle);
        let mid = sheet(80, 100, 100, 100, Role::Mid);
        assert_eq!(read_at(Role::Jungle, 10, jungle, &[]).role_skill, 80);
        assert_eq!(read_at(Role::Mid, 10, mid, &[]).role_skill, 80);
        let mismatched = Competencies {
            role_skill: RoleSkill::Laning(score(80)),
            ..sheet(80, 100, 100, 100, Role::Top)
        };
        let jungle_sheet = Competencies {
            role_skill: RoleSkill::Laning(score(80)),
            shotcalling: score(80),
            ..sheet(80, 100, 100, 100, Role::Jungle)
        };
        assert_eq!(read_at(Role::Jungle, 10, jungle_sheet, &[]).role_skill, 0);
        assert_eq!(read_at(Role::Mid, 10, mismatched, &[]).role_skill, 80);
    }

    #[test]
    fn one_to_three_very_high_shotcallers_help_and_the_fourth_cancels_it() {
        let support = read_at(
            Role::Support,
            10,
            sheet(80, 100, 100, 100, Role::Support),
            &[],
        );
        let top = read_at(Role::Top, 10, sheet(80, 100, 100, 100, Role::Top), &[]);
        assert!(support.very_high_shotcalling);
        assert!(top.very_high_shotcalling);
        assert_eq!(support.call_value, 80);
        assert_eq!(top.call_value, 8);
        assert!(top.call_value < support.call_value);
        assert_eq!(team_bonus(&[support]), 80);
        assert_eq!(team_bonus(&[support, support, support]), 80);
        assert_eq!(team_bonus(&[support, support, support, top]), 0);
        assert_eq!(team_bonus(&[top]), 8);
        let quiet = read_at(
            Role::Support,
            10,
            sheet(79, 100, 100, 100, Role::Support),
            &[],
        );
        assert!(!quiet.very_high_shotcalling);
        assert_eq!(quiet.shotcalling, 79);
        assert!(VERY_HIGH_SHOTCALLING > quiet.shotcalling);
    }

    #[test]
    fn fatigue_closes_the_same_stat() {
        let tired = PlayerState {
            form: score(40),
            fatigue: score(80),
        };
        let fresh = read_player(
            0,
            Role::Mid,
            sheet(100, 100, 100, 100, Role::Mid),
            calm(),
            &[],
            score(50),
            kit(40),
            MatchupPlan::Ability,
            10,
            false,
        );
        let drained = read_player(
            0,
            Role::Mid,
            sheet(100, 100, 100, 100, Role::Mid),
            tired,
            &[],
            score(50),
            kit(40),
            MatchupPlan::Ability,
            10,
            false,
        );
        assert!(drained.mechanics < fresh.mechanics);
    }

    #[test]
    fn a_rookie_loses_mental_only_in_an_elimination_match() {
        let competencies = sheet(60, 100, 100, 100, Role::Mid);
        let base = kit(40);
        let elimination = read_player(
            0,
            Role::Mid,
            competencies,
            calm(),
            &[Tag::Rookie],
            score(50),
            base,
            MatchupPlan::Ability,
            10,
            true,
        );
        let regular = read_player(
            0,
            Role::Mid,
            competencies,
            calm(),
            &[Tag::Rookie],
            score(50),
            base,
            MatchupPlan::Ability,
            10,
            false,
        );
        assert_eq!(regular.mental, 60);
        assert_eq!(elimination.mental, 40);
        assert_eq!(elimination.mechanics, regular.mechanics);
    }

    #[test]
    fn the_other_tags_do_not_change_the_reading() {
        let competencies = sheet(70, 100, 100, 100, Role::Adc);
        let plain = read_at(Role::Adc, 35, competencies, &[]);
        for tag in [
            Tag::Leader,
            Tag::Regulier,
            Tag::Potentiel,
            Tag::TeteDaffiche,
        ] {
            let tagged = read_player(
                0,
                Role::Adc,
                competencies,
                calm(),
                &[tag],
                score(70),
                kit(40),
                MatchupPlan::Ability,
                35,
                true,
            );
            assert_eq!(tagged.mental, plain.mental);
            assert_eq!(tagged.mechanics, plain.mechanics);
            assert_eq!(tagged.shotcalling, plain.shotcalling);
        }
    }

    #[test]
    fn high_itemisation_leans_the_kit_and_low_itemisation_is_punished() {
        let high = read_player(
            0,
            Role::Mid,
            sheet(100, 100, 100, 100, Role::Mid),
            calm(),
            &[],
            score(50),
            kit(40),
            MatchupPlan::Ability,
            10,
            false,
        );
        let mut low_sheet = sheet(100, 100, 100, 100, Role::Mid);
        low_sheet.itemisation = score(0);
        let low = read_player(
            0,
            Role::Mid,
            low_sheet,
            calm(),
            &[],
            score(50),
            kit(40),
            MatchupPlan::Ability,
            10,
            false,
        );
        assert_eq!(low.oriented.damage.ability.value(), 40);
        assert_eq!(high.oriented.damage.ability.value(), 60);
        assert!(low.punishment > high.punishment);
        assert_eq!(high.punishment, 0);
    }

    #[test]
    fn call_value_follows_the_role() {
        assert_eq!(call_value(80, Role::Support), 80);
        assert_eq!(call_value(80, Role::Jungle), 80);
        assert_eq!(call_value(80, Role::Mid), 40);
        assert_eq!(call_value(80, Role::Adc), 20);
        assert_eq!(call_value(80, Role::Top), 8);
    }
}
