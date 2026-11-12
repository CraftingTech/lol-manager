use crate::ids::{LeagueId, OrganisationId, PlayerId, TeamId};

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct Roster {
    pub players: Vec<PlayerId>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct SeasonRegistration {
    pub league: LeagueId,
    pub year: i32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Team {
    pub id: TeamId,
    pub name: String,
    pub organisation: OrganisationId,
    pub roster: Roster,
    pub registration: Option<SeasonRegistration>,
    pub portrait: Option<String>,
}
