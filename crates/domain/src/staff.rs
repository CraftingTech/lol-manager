use crate::head_coach::CoachCompetencies;
use crate::ids::{ChampionId, PlayerId, StaffId};
use crate::role::Role;

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
    pub role: StaffRole,
    pub competencies: CoachCompetencies,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Presta {
    pub player: PlayerId,
    pub champion: ChampionId,
}

#[cfg(test)]
mod tests {
    use super::{Presta, StaffMember, StaffRole};
    use crate::head_coach::CoachCompetencies;
    use crate::ids::{ChampionId, PlayerId, StaffId};
    use crate::score::Score;
    use std::any::TypeId;

    #[test]
    fn presta_is_not_a_staff_member() {
        let member = StaffMember {
            id: StaffId(1),
            name: "Analyst".to_string(),
            role: StaffRole::Analyst,
            competencies: CoachCompetencies {
                draft: Score::new(10).unwrap(),
                training: Score::new(20).unwrap(),
                mental: Score::new(30).unwrap(),
                macro_play: Score::new(40).unwrap(),
                media: Score::new(50).unwrap(),
            },
        };
        let presta = Presta {
            player: PlayerId(4),
            champion: ChampionId(8),
        };

        assert_ne!(TypeId::of::<Presta>(), TypeId::of::<StaffMember>());
        assert_eq!(member.id, StaffId(1));
        assert_eq!(presta.player, PlayerId(4));
        assert_eq!(presta.champion, ChampionId(8));
    }
}
