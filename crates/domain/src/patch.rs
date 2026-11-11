use crate::champion::{DamageSliders, TankinessSliders};
use crate::ids::{ChampionId, PatchId};
use crate::score::Score;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct RoleScores {
    pub top: Score,
    pub jungle: Score,
    pub mid: Score,
    pub adc: Score,
    pub support: Score,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ChampionOnPatch {
    pub champion: ChampionId,
    pub roles: Option<RoleScores>,
    pub damage: Option<DamageSliders>,
    pub tankiness: Option<TankinessSliders>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ObjectiveEvent {
    pub name: String,
    pub reward: Option<String>,
    pub unlocks: Vec<String>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Patch {
    pub id: PatchId,
    pub version: String,
    pub date: String,
    pub champions: Vec<ChampionOnPatch>,
    pub objectives: Vec<ObjectiveEvent>,
}

#[cfg(test)]
mod tests {
    use super::{ChampionOnPatch, ObjectiveEvent, Patch};
    use crate::ids::{ChampionId, PatchId};

    #[test]
    fn patch_without_sliders() {
        let empty = Patch {
            id: PatchId(uuid::Uuid::from_u128(1)),
            version: "16.1".into(),
            date: "2026-01-08".into(),
            champions: vec![],
            objectives: vec![],
        };
        assert!(empty.champions.is_empty());
        assert!(empty.objectives.is_empty());
        assert_eq!(empty.version, "16.1");
        assert_eq!(empty.date, "2026-01-08");

        let patch = Patch {
            id: PatchId(uuid::Uuid::from_u128(2)),
            version: "16.2".into(),
            date: "2026-01-22".into(),
            champions: vec![ChampionOnPatch {
                champion: ChampionId(uuid::Uuid::from_u128(7)),
                roles: None,
                damage: None,
                tankiness: None,
            }],
            objectives: vec![ObjectiveEvent {
                name: "drake".into(),
                reward: None,
                unlocks: vec![],
            }],
        };
        assert!(patch.champions[0].roles.is_none());
        assert!(patch.champions[0].damage.is_none());
        assert!(patch.champions[0].tankiness.is_none());
        assert!(patch.objectives[0].reward.is_none());
    }
}
