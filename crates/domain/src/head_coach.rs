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
    pub nationality: Option<String>,
    pub age: Option<u8>,
    pub portrait: Option<String>,
    pub source_url: Option<String>,
    pub teams: Vec<TeamId>,
    pub palmares: Vec<PalmaresEntry>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct HeadCoach {
    pub identity: HeadCoachIdentity,
    pub competencies: Option<CoachCompetencies>,
    pub reputation: Option<Score>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Address {
    Reassure,
    Pressure,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct AddressEffect {
    pub form: Score,
    pub fan_mood: Score,
}

impl HeadCoach {
    /// An ambitious player joins when a known reputation meets the aspiration.
    pub fn attracts(&self, aspiration: Score) -> bool {
        self.reputation
            .is_some_and(|reputation| reputation.value() >= aspiration.value())
    }
}

impl Address {
    pub fn apply(self, form: Score, fan_mood: Score) -> AddressEffect {
        let (form_delta, mood_delta) = match self {
            Self::Reassure => (8, 5),
            Self::Pressure => (-8, 4),
        };
        AddressEffect {
            form: form.saturating_add(form_delta),
            fan_mood: fan_mood.saturating_add(mood_delta),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{Address, CoachCompetencies, HeadCoach, HeadCoachIdentity};
    use crate::ids::{CoachId, TeamId};
    use crate::score::Score;

    #[test]
    fn head_coach_builds_without_staff_seats() {
        let coach = HeadCoach {
            identity: HeadCoachIdentity {
                id: CoachId(uuid::Uuid::from_u128(1)),
                name: "Coach".to_string(),
                nationality: Some("KR".to_string()),
                age: Some(35),
                portrait: None,
                source_url: None,
                teams: vec![TeamId(uuid::Uuid::from_u128(7))],
                palmares: Vec::new(),
            },
            competencies: Some(CoachCompetencies {
                draft: Score::new(80).unwrap(),
                training: Score::new(70).unwrap(),
                mental: Score::new(60).unwrap(),
                macro_play: Score::new(75).unwrap(),
                media: Score::new(50).unwrap(),
            }),
            reputation: Some(Score::new(65).unwrap()),
        };

        assert_eq!(coach.identity.id, CoachId(uuid::Uuid::from_u128(1)));
        assert_eq!(coach.identity.teams, vec![TeamId(uuid::Uuid::from_u128(7))]);
        assert!(coach.identity.palmares.is_empty());
        assert!(coach.attracts(Score::new(65).unwrap()));
        assert!(!coach.attracts(Score::new(80).unwrap()));
    }

    #[test]
    fn a_speech_moves_form_and_fan_mood() {
        let form = Score::new(50).unwrap();
        let mood = Score::new(40).unwrap();
        let reassure = Address::Reassure.apply(form, mood);
        let pressure = Address::Pressure.apply(form, mood);
        assert!(reassure.form > form);
        assert!(reassure.fan_mood > mood);
        assert!(pressure.form < form);
        assert!(pressure.fan_mood > mood);
    }
}
