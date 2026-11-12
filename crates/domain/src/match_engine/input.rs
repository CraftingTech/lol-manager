use crate::champion::{KitProfile, MatchupPlan};
use crate::player::{Competencies, PlayerState};
use crate::role::Role;
use crate::score::Score;
use crate::tag::Tag;

pub const ROSTER_ORDER: [Role; 5] = [Role::Top, Role::Jungle, Role::Mid, Role::Adc, Role::Support];

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlayerInput {
    pub name: String,
    pub role: Role,
    pub competencies: Competencies,
    pub state: PlayerState,
    pub tags: Vec<Tag>,
    pub mastery: Score,
    pub kit: KitProfile,
    pub matchup: MatchupPlan,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct GamePlan {
    pub invade: bool,
    pub invade_with: [bool; 5],
    pub contest_objectives: bool,
    pub push_with: [bool; 5],
}

impl GamePlan {
    pub fn aggressive() -> Self {
        Self {
            invade: true,
            invade_with: [true; 5],
            contest_objectives: true,
            push_with: [true; 5],
        }
    }

    pub fn quiet() -> Self {
        Self {
            invade: false,
            invade_with: [false; 5],
            contest_objectives: false,
            push_with: [true; 5],
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SideInput {
    pub players: [PlayerInput; 5],
    pub plan: GamePlan,
}

impl SideInput {
    pub fn new(players: [PlayerInput; 5], plan: GamePlan) -> Result<Self, MatchError> {
        if players
            .iter()
            .enumerate()
            .any(|(index, player)| player.role != ROSTER_ORDER[index])
        {
            return Err(MatchError::Roster);
        }
        Ok(Self { players, plan })
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PatchObjective {
    pub name: String,
    pub reward: Option<String>,
    pub unlocks: Vec<String>,
    pub source_url: Option<String>,
}

impl PatchObjective {
    pub fn reported_reward(&self) -> Option<String> {
        self.source_url.as_ref()?;
        self.reward.clone()
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MatchInput {
    pub elimination: bool,
    pub objectives: Vec<PatchObjective>,
    pub inhibitor_respawn_seconds: Option<u16>,
    pub blue: SideInput,
    pub red: SideInput,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MatchError {
    Roster,
}

#[cfg(test)]
mod tests {
    use super::PatchObjective;

    #[test]
    fn a_reward_without_a_source_url_stays_empty() {
        let unsourced = PatchObjective {
            name: "dragon".into(),
            reward: Some("or".into()),
            unlocks: vec!["dragon aîné".into()],
            source_url: None,
        };
        let sourced = PatchObjective {
            name: "dragon infernal".into(),
            reward: Some("âme".into()),
            unlocks: vec!["dragon aîné".into()],
            source_url: Some("https://leagueoflegends.fandom.com/wiki/Season_Six".into()),
        };
        assert_eq!(unsourced.reported_reward(), None);
        assert_eq!(sourced.reported_reward().as_deref(), Some("âme"));
    }
}
