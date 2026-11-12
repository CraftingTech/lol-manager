use crate::head_coach::CoachCompetencies;
use crate::ids::{ChampionId, OrganisationId, PlayerId, StaffId};
use crate::role::Role;
use crate::score::Score;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct PositionalCoach {
    pub role: Role,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum StaffRole {
    AssistantCoach,
    Analyst,
    MentalCoach,
    Positional(PositionalCoach),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct StaffMember {
    pub id: StaffId,
    pub name: String,
    pub nationality: Option<String>,
    pub age: Option<u8>,
    pub organisations: Vec<OrganisationId>,
    pub role: StaffRole,
    pub competencies: CoachCompetencies,
}

impl StaffRole {
    pub fn takes_seat(self) -> bool {
        matches!(
            self,
            Self::AssistantCoach | Self::Analyst | Self::MentalCoach | Self::Positional(_)
        )
    }
}

impl StaffMember {
    /// A positional coach moves only their lane. The other seats train every lane the same way.
    pub fn progression_for(&self, role: Role) -> Score {
        match self.role {
            StaffRole::Positional(coach) if coach.role == role => self.competencies.training,
            StaffRole::Positional(_) => Score::new(0).unwrap(),
            StaffRole::AssistantCoach | StaffRole::Analyst | StaffRole::MentalCoach => {
                self.competencies.training
            }
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Presta {
    pub player: PlayerId,
    pub champion: ChampionId,
}

impl Presta {
    pub fn takes_seat(self) -> bool {
        false
    }

    /// Raises mastery of this champion for this player. Every other pool entry stays put.
    pub fn train(self, player: PlayerId, champion: ChampionId, mastery: Score) -> Score {
        if player == self.player && champion == self.champion {
            mastery.saturating_add(10)
        } else {
            mastery
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{Presta, StaffMember, StaffRole};
    use crate::head_coach::CoachCompetencies;
    use crate::ids::{ChampionId, OrganisationId, PlayerId, StaffId};
    use crate::role::Role;
    use crate::score::Score;
    use std::any::TypeId;

    #[test]
    fn presta_is_not_a_staff_member() {
        let member = StaffMember {
            id: StaffId(uuid::Uuid::from_u128(1)),
            name: "Analyst".to_string(),
            nationality: Some("KR".into()),
            age: Some(30),
            organisations: vec![OrganisationId(uuid::Uuid::from_u128(3))],
            role: StaffRole::Analyst,
            competencies: CoachCompetencies {
                draft: Score::new(10).unwrap(),
                training: Score::new(20).unwrap(),
                mental: Score::new(30).unwrap(),
                macro_play: Score::new(40).unwrap(),
                media: Score::new(50).unwrap(),
            },
        };
        let mid_coach = StaffMember {
            id: StaffId(uuid::Uuid::from_u128(2)),
            name: "Mid".to_string(),
            nationality: None,
            age: None,
            organisations: Vec::new(),
            role: StaffRole::Positional(super::PositionalCoach { role: Role::Mid }),
            competencies: member.competencies,
        };
        let presta = Presta {
            player: PlayerId(uuid::Uuid::from_u128(4)),
            champion: ChampionId(uuid::Uuid::from_u128(8)),
        };

        assert_ne!(TypeId::of::<Presta>(), TypeId::of::<StaffMember>());
        assert_eq!(member.id, StaffId(uuid::Uuid::from_u128(1)));
        assert!(member.role.takes_seat());
        assert!(!presta.takes_seat());
        assert_eq!(
            mid_coach.progression_for(Role::Mid),
            member.competencies.training
        );
        assert_eq!(mid_coach.progression_for(Role::Adc).value(), 0);
        let mastery = Score::new(40).unwrap();
        assert_eq!(
            presta.train(presta.player, presta.champion, mastery),
            mastery.saturating_add(10)
        );
        assert_eq!(
            presta.train(presta.player, ChampionId(uuid::Uuid::from_u128(9)), mastery),
            mastery
        );
        assert_eq!(presta.player, PlayerId(uuid::Uuid::from_u128(4)));
        assert_eq!(presta.champion, ChampionId(uuid::Uuid::from_u128(8)));
    }
}
