#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct Score(u8);

impl Score {
    pub fn new(value: u8) -> Option<Self> {
        if value <= 100 {
            Some(Self(value))
        } else {
            None
        }
    }

    pub fn value(self) -> u8 {
        self.0
    }

    pub fn saturating_add(self, delta: i16) -> Self {
        let next = i16::from(self.0) + delta;
        Self(next.clamp(0, 100) as u8)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct PhaseScores {
    pub early: Score,
    pub mid: Score,
    pub late: Score,
}

#[cfg(test)]
mod tests {
    use super::Score;

    #[test]
    fn score_stops_at_one_hundred() {
        assert!(Score::new(0).is_some());
        assert!(Score::new(100).is_some());
        assert!(Score::new(101).is_none());
    }
}
