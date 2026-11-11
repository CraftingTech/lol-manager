use crate::ids::{ChampionId, PlayerId, TeamId};
use crate::role::{Role, RoleSkill};
use crate::score::{PhaseScores, Score};
use crate::tag::Tag;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PalmaresEntry {
    pub award: String,
    pub competition: String,
    pub year: i32,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum AspirationType {
    SatisfyingTitle,
    RetirementAge,
    WantsAgent,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum AspirationEffect {
    ComparesToPalmares,
    WeighsOnSigning,
    ClosesContract,
    TalkThroughAgent,
}

impl AspirationType {
    pub fn effects(self) -> &'static [AspirationEffect] {
        match self {
            Self::SatisfyingTitle => &[
                AspirationEffect::ComparesToPalmares,
                AspirationEffect::WeighsOnSigning,
            ],
            Self::RetirementAge => &[
                AspirationEffect::ClosesContract,
                AspirationEffect::WeighsOnSigning,
            ],
            Self::WantsAgent => &[
                AspirationEffect::TalkThroughAgent,
                AspirationEffect::WeighsOnSigning,
            ],
        }
    }
}

impl AspirationEffect {
    pub fn impact(self) -> &'static str {
        match self {
            Self::ComparesToPalmares => {
                "Se compare au palmarès. Un titre déjà obtenu satisfait l'aspiration. Aucun bonus de match."
            }
            Self::WeighsOnSigning => {
                "Pèse sur l'envie de signer ou de renouveler. N'écrit pas le montant."
            }
            Self::ClosesContract => {
                "Quand l'âge du joueur atteint cette valeur, le contrat se ferme et il redevient libre."
            }
            Self::TalkThroughAgent => {
                "La discussion de contrat passe par un agent. Aucun personnage d'agent n'est créé."
            }
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum AspirationValue {
    Title(String),
    Age(u8),
    Decision(bool),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlayerAspiration {
    pub kind: AspirationType,
    pub value: AspirationValue,
}

impl PlayerAspiration {
    pub fn new(kind: AspirationType, value: AspirationValue) -> Result<Self, PlayerError> {
        let fits = matches!(
            (&kind, &value),
            (AspirationType::SatisfyingTitle, AspirationValue::Title(_))
                | (AspirationType::RetirementAge, AspirationValue::Age(_))
                | (AspirationType::WantsAgent, AspirationValue::Decision(_))
        );
        if fits {
            Ok(Self { kind, value })
        } else {
            Err(PlayerError::AspirationMismatch)
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlayerIdentity {
    pub id: PlayerId,
    pub name: String,
    pub role: Role,
    pub nationality: String,
    pub age: u8,
    pub teams: Vec<TeamId>,
    pub palmares: Vec<PalmaresEntry>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct PoolEntry {
    pub champion: ChampionId,
    pub mastery: Score,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Competencies {
    pub mechanics: Score,
    pub teamfight: Score,
    pub map_awareness: Score,
    pub objectives: Score,
    pub tempo: Score,
    pub mental: Score,
    pub itemisation: Score,
    pub phases: PhaseScores,
    pub shotcalling: Score,
    pub role_skill: RoleSkill,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct PlayerState {
    pub form: Score,
    pub fatigue: Score,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Player {
    pub identity: PlayerIdentity,
    pub pool: Vec<PoolEntry>,
    pub competencies: Competencies,
    pub state: PlayerState,
    pub tags: Vec<Tag>,
    pub aspirations: Vec<PlayerAspiration>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PlayerError {
    RoleSkillMismatch,
    AspirationMismatch,
    DuplicateAspiration,
}

impl Player {
    pub fn try_new(
        identity: PlayerIdentity,
        pool: Vec<PoolEntry>,
        competencies: Competencies,
        state: PlayerState,
        tags: Vec<Tag>,
        aspirations: Vec<PlayerAspiration>,
    ) -> Result<Self, PlayerError> {
        if !competencies.role_skill.fits(identity.role) {
            return Err(PlayerError::RoleSkillMismatch);
        }
        let mut seen = Vec::new();
        for aspiration in &aspirations {
            if seen.contains(&aspiration.kind) {
                return Err(PlayerError::DuplicateAspiration);
            }
            seen.push(aspiration.kind);
        }
        Ok(Self {
            identity,
            pool,
            competencies,
            state,
            tags,
            aspirations,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::{
        AspirationEffect, AspirationType, AspirationValue, Competencies, PalmaresEntry, Player,
        PlayerAspiration,
        PlayerError, PlayerIdentity, PlayerState, PoolEntry,
    };
    use crate::ids::{ChampionId, PlayerId, TeamId};
    use crate::role::{Role, RoleSkill};
    use crate::score::{PhaseScores, Score};
    use crate::tag::Tag;

    fn score(value: u8) -> Score {
        Score::new(value).unwrap()
    }

    fn identity(role: Role) -> PlayerIdentity {
        PlayerIdentity {
            id: PlayerId(1),
            name: "Jungler".into(),
            role,
            nationality: "KR".into(),
            age: 20,
            teams: vec![TeamId(1)],
            palmares: vec![PalmaresEntry {
                award: "MVP".into(),
                competition: "Split".into(),
                year: 2026,
            }],
        }
    }

    fn competencies(role_skill: RoleSkill) -> Competencies {
        let value = score(50);
        Competencies {
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
            role_skill,
        }
    }

    fn state() -> PlayerState {
        PlayerState {
            form: score(60),
            fatigue: score(20),
        }
    }

    #[test]
    fn jungle_laning_is_refused_and_pathing_is_accepted() {
        let refused = Player::try_new(
            identity(Role::Jungle),
            vec![],
            competencies(RoleSkill::Laning(score(40))),
            state(),
            vec![],
            vec![],
        );
        assert_eq!(refused, Err(PlayerError::RoleSkillMismatch));

        let accepted = Player::try_new(
            identity(Role::Jungle),
            vec![PoolEntry {
                champion: ChampionId(9),
                mastery: score(70),
            }],
            competencies(RoleSkill::Pathing(score(40))),
            state(),
            vec![Tag::Rookie],
            vec![
                PlayerAspiration::new(
                    AspirationType::RetirementAge,
                    AspirationValue::Age(28),
                )
                .unwrap(),
                PlayerAspiration::new(
                    AspirationType::SatisfyingTitle,
                    AspirationValue::Title("Worlds".into()),
                )
                .unwrap(),
            ],
        )
        .unwrap();
        assert!(accepted.competencies.role_skill.fits(Role::Jungle));
        assert_eq!(accepted.pool.len(), 1);
        assert_eq!(accepted.tags, vec![Tag::Rookie]);
    }

    #[test]
    fn mid_pathing_is_refused() {
        let refused = Player::try_new(
            identity(Role::Mid),
            vec![],
            competencies(RoleSkill::Pathing(score(55))),
            state(),
            vec![],
            vec![],
        );
        assert_eq!(refused, Err(PlayerError::RoleSkillMismatch));
    }

    #[test]
    fn retirement_is_an_aspiration_not_a_player_column() {
        let mismatch = PlayerAspiration::new(
            AspirationType::RetirementAge,
            AspirationValue::Title("Worlds".into()),
        );
        assert_eq!(mismatch, Err(PlayerError::AspirationMismatch));

        let player = Player::try_new(
            identity(Role::Mid),
            vec![],
            competencies(RoleSkill::Laning(score(40))),
            state(),
            vec![],
            vec![PlayerAspiration::new(AspirationType::RetirementAge, AspirationValue::Age(28)).unwrap()],
        )
        .unwrap();
        assert!(matches!(
            player.aspirations[0].value,
            AspirationValue::Age(28)
        ));
        assert!(player.aspirations[0]
            .kind
            .effects()
            .contains(&AspirationEffect::ClosesContract));
    }

    #[test]
    fn every_aspiration_type_has_a_game_effect() {
        let types = [
            AspirationType::SatisfyingTitle,
            AspirationType::RetirementAge,
            AspirationType::WantsAgent,
        ];
        for kind in types {
            assert!(!kind.effects().is_empty());
            for effect in kind.effects() {
                assert!(!effect.impact().is_empty());
            }
        }
        assert!(AspirationType::SatisfyingTitle
            .effects()
            .contains(&AspirationEffect::ComparesToPalmares));
        assert!(AspirationType::WantsAgent
            .effects()
            .contains(&AspirationEffect::TalkThroughAgent));
    }
}
