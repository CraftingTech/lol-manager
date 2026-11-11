use crate::ids::LeagueId;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum LeagueTier {
    Primary,
    Secondary,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SeasonPresence {
    InWorld,
    Playable,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SeriesLength {
    SingleGame,
    TwoGames,
    FirstToThree,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct SplitFormat {
    pub name: String,
    pub series: SeriesLength,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SalaryCap {
    Hard { amount: Option<i64> },
    Soft { amount: Option<i64> },
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct League {
    pub id: LeagueId,
    pub name: String,
    pub region: String,
    pub tier: LeagueTier,
    pub presence: SeasonPresence,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct LeagueSeason {
    pub league: LeagueId,
    pub year: i32,
    pub team_count: Option<u8>,
    pub splits: Vec<SplitFormat>,
    pub msi_slots: u8,
    pub worlds_slots: Option<u8>,
    pub salary_cap: Option<SalaryCap>,
}

#[cfg(test)]
mod tests {
    use super::LeagueSeason;
    use crate::ids::LeagueId;

    #[test]
    fn season_allows_unknown_team_count_and_salary_cap() {
        let season = LeagueSeason {
            league: LeagueId(uuid::Uuid::from_u128(1)),
            year: 2014,
            team_count: None,
            splits: Vec::new(),
            msi_slots: 0,
            worlds_slots: None,
            salary_cap: None,
        };

        assert!(season.team_count.is_none());
        assert!(season.salary_cap.is_none());
        assert_eq!(season.msi_slots, 0);
        assert_eq!(season.year, 2014);
    }
}
