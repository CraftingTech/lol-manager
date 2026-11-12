use crate::champion::{DamageSliders, TankinessSliders};
use crate::ids::{ChampionId, PatchId};
use crate::score::{PhaseScores, Score};

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
    pub phases: Option<PhaseScores>,
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
    pub source_url: Option<String>,
    pub champions: Vec<ChampionOnPatch>,
    pub objectives: Vec<ObjectiveEvent>,
}

impl Patch {
    pub fn champion(&self, id: ChampionId) -> Option<&ChampionOnPatch> {
        self.champions.iter().find(|row| row.champion == id)
    }

    pub fn objective(&self, name: &str) -> Option<&ObjectiveEvent> {
        self.objectives.iter().find(|event| event.name == name)
    }
}

#[cfg(test)]
mod tests {
    use super::{ChampionOnPatch, ObjectiveEvent, Patch, RoleScores};
    use crate::ids::{ChampionId, PatchId};
    use crate::score::Score;

    #[test]
    fn patch_without_sliders() {
        let empty = Patch {
            id: PatchId(uuid::Uuid::from_u128(1)),
            version: "16.1".into(),
            date: "2026-01-08".into(),
            source_url: None,
            champions: vec![],
            objectives: vec![],
        };
        assert!(empty.champions.is_empty());
        assert!(empty.objectives.is_empty());
        assert_eq!(empty.version, "16.1");
        assert_eq!(empty.date, "2026-01-08");

        let garen = ChampionId(uuid::Uuid::from_u128(7));
        let early = Patch {
            id: PatchId(uuid::Uuid::from_u128(2)),
            version: "4.21".into(),
            date: "2014-12-10".into(),
            source_url: Some("https://wiki.leagueoflegends.com/en-us/V4.21".into()),
            champions: vec![ChampionOnPatch {
                champion: garen,
                roles: Some(RoleScores {
                    top: Score::new(90).unwrap(),
                    jungle: Score::new(20).unwrap(),
                    mid: Score::new(10).unwrap(),
                    adc: Score::new(0).unwrap(),
                    support: Score::new(5).unwrap(),
                }),
                damage: None,
                tankiness: None,
                phases: None,
            }],
            objectives: vec![ObjectiveEvent {
                name: "dragon".into(),
                reward: None,
                unlocks: vec![],
            }],
        };
        let later = Patch {
            id: PatchId(uuid::Uuid::from_u128(3)),
            version: "9.12".into(),
            date: "2019-06-12".into(),
            source_url: None,
            champions: vec![ChampionOnPatch {
                champion: garen,
                roles: Some(RoleScores {
                    top: Score::new(40).unwrap(),
                    jungle: Score::new(10).unwrap(),
                    mid: Score::new(15).unwrap(),
                    adc: Score::new(70).unwrap(),
                    support: Score::new(55).unwrap(),
                }),
                damage: None,
                tankiness: None,
                phases: None,
            }],
            objectives: vec![ObjectiveEvent {
                name: "dragon".into(),
                reward: Some("elemental".into()),
                unlocks: vec![],
            }],
        };
        assert!(early.champion(garen).unwrap().roles.is_some());
        assert_ne!(
            early.champion(garen).unwrap().roles.unwrap().adc,
            later.champion(garen).unwrap().roles.unwrap().adc
        );
        assert!(early.objective("dragon").unwrap().reward.is_none());
        assert_eq!(
            later.objective("dragon").unwrap().reward.as_deref(),
            Some("elemental")
        );
    }
}
