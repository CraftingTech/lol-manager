use crate::champion::{DamageSliders, KitProfile, MatchupPlan, TankinessSliders};
use crate::player::{Competencies, PlayerState};
use crate::role::{Role, RoleSkill};
use crate::score::{PhaseScores, Score};

use super::input::{GamePlan, PlayerInput, SideInput};

pub fn score(value: u8) -> Score {
    Score::new(value).unwrap()
}

pub fn player(name: &str, role: Role, stat: u8) -> PlayerInput {
    let value = score(stat);
    PlayerInput {
        name: name.into(),
        role,
        competencies: Competencies {
            mechanics: value,
            teamfight: value,
            map_awareness: value,
            objectives: value,
            tempo: value,
            mental: value,
            itemisation: value,
            phases: PhaseScores {
                early: value,
                mid: value,
                late: value,
            },
            shotcalling: value,
            role_skill: RoleSkill::for_role(role, value),
        },
        state: PlayerState {
            form: score(100),
            fatigue: score(0),
        },
        tags: Vec::new(),
        mastery: value,
        kit: KitProfile {
            damage: DamageSliders {
                attack: score(40),
                ability: score(40),
                true_damage: score(0),
            },
            tankiness: TankinessSliders {
                health: score(40),
                armor: score(40),
                magic_resist: score(40),
            },
        },
        matchup: MatchupPlan::Ability,
    }
}

pub fn roster(stat: u8) -> [PlayerInput; 5] {
    [
        player("Top", Role::Top, stat),
        player("Jungle", Role::Jungle, stat),
        player("Mid", Role::Mid, stat),
        player("Adc", Role::Adc, stat),
        player("Support", Role::Support, stat),
    ]
}

pub fn side(stat: u8, plan: GamePlan) -> SideInput {
    SideInput::new(roster(stat), plan).unwrap()
}
