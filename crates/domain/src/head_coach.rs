use crate::ids::{CoachId, TeamId};
use crate::player::PalmaresEntry;
use crate::score::Score;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct CoachCompetencies {
    pub draft: Score,
    pub training: Score,
    pub mental: Score,
    pub macro_play: Score,
    pub media: Score,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct HeadCoachIdentity {
    pub id: CoachId,
    pub name: String,
    pub nationality: String,
    pub age: u8,
    pub teams: Vec<TeamId>,
    pub palmares: Vec<PalmaresEntry>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct HeadCoach {
    pub identity: HeadCoachIdentity,
    pub competencies: CoachCompetencies,
    pub reputation: Score,
}

#[cfg(test)]
mod tests {
    use super::{CoachCompetencies, HeadCoach, HeadCoachIdentity};
    use crate::ids::{CoachId, TeamId};
    use crate::score::Score;

    #[test]
    fn head_coach_builds_without_staff_seats() {
        let coach = HeadCoach {
            identity: HeadCoachIdentity {
                id: CoachId(1),
                name: "Coach".to_string(),
                nationality: "KR".to_string(),
                age: 35,
                teams: vec![TeamId(7)],
                palmares: Vec::new(),
            },
            competencies: CoachCompetencies {
                draft: Score::new(80).unwrap(),
                training: Score::new(70).unwrap(),
                mental: Score::new(60).unwrap(),
                macro_play: Score::new(75).unwrap(),
                media: Score::new(50).unwrap(),
            },
            reputation: Score::new(65).unwrap(),
        };

        assert_eq!(coach.identity.id, CoachId(1));
        assert_eq!(coach.identity.teams, vec![TeamId(7)]);
        assert!(coach.identity.palmares.is_empty());
    }
}
