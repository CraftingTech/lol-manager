use crate::ids::{InfluencerContractId, OrganisationId, SponsorId, TeamId};
use crate::score::Score;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Locaux {
    pub scrim_room: bool,
    pub gaming_house: bool,
    pub chef: bool,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct Jersey {
    pub name: String,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct SponsorContract {
    pub id: SponsorId,
    pub payer: String,
    pub amount: Option<i64>,
    pub duration_years: Option<u8>,
    pub takes_jersey_slot: bool,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct InfluencerContract {
    pub id: InfluencerContractId,
    pub streamer: String,
    pub duration_years: Option<u8>,
    pub stream_revenue: Option<i64>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Finances {
    pub budget: Option<i64>,
    pub wage_bill: Option<i64>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct FanBase {
    pub count: Option<u64>,
    pub mood: Option<Score>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Organisation {
    pub id: OrganisationId,
    pub name: String,
    pub region: String,
    pub history: String,
    pub portrait: Option<String>,
    pub teams: Vec<TeamId>,
    pub staff_seats: Option<u8>,
    pub locaux: Option<Locaux>,
    pub jersey: Option<Jersey>,
    pub sponsors: Vec<SponsorContract>,
    pub influencer_contracts: Vec<InfluencerContract>,
    pub finances: Finances,
    pub fan_base: FanBase,
}

#[cfg(test)]
mod tests {
    use super::{FanBase, Finances, Jersey, Locaux, Organisation};
    use crate::ids::{OrganisationId, TeamId};
    use crate::score::Score;

    #[test]
    fn organisation_accepts_two_teams() {
        let organisation = Organisation {
            id: OrganisationId(uuid::Uuid::from_u128(1)),
            name: "Org".to_string(),
            region: "EU".to_string(),
            history: String::new(),
            portrait: None,
            teams: vec![
                TeamId(uuid::Uuid::from_u128(1)),
                TeamId(uuid::Uuid::from_u128(2)),
            ],
            staff_seats: Some(3),
            locaux: Some(Locaux {
                scrim_room: false,
                gaming_house: false,
                chef: false,
            }),
            jersey: Some(Jersey {
                name: "Home".to_string(),
            }),
            sponsors: Vec::new(),
            influencer_contracts: Vec::new(),
            finances: Finances {
                budget: None,
                wage_bill: None,
            },
            fan_base: FanBase {
                count: None,
                mood: Some(Score::new(40).unwrap()),
            },
        };

        assert_eq!(
            organisation.teams,
            vec![
                TeamId(uuid::Uuid::from_u128(1)),
                TeamId(uuid::Uuid::from_u128(2))
            ]
        );
        assert!(organisation.finances.budget.is_none());
        assert!(organisation.sponsors.is_empty());
    }
}
