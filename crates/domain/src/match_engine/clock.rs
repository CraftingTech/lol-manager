#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Phase {
    Early,
    Mid,
    Late,
}

impl Phase {
    pub fn label(self) -> &'static str {
        match self {
            Self::Early => "early",
            Self::Mid => "mid",
            Self::Late => "late",
        }
    }
}

pub fn phase_at(minute: u16) -> Phase {
    if minute <= 10 {
        Phase::Early
    } else if minute >= 35 {
        Phase::Late
    } else {
        Phase::Mid
    }
}

#[cfg(test)]
mod tests {
    use super::{phase_at, Phase};

    #[test]
    fn ten_is_early_thirty_five_is_late_and_the_middle_is_mid() {
        assert_eq!(phase_at(0), Phase::Early);
        assert_eq!(phase_at(10), Phase::Early);
        assert_eq!(phase_at(11), Phase::Mid);
        assert_eq!(phase_at(34), Phase::Mid);
        assert_eq!(phase_at(35), Phase::Late);
        assert_eq!(phase_at(48), Phase::Late);
    }
}
