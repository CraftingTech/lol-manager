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

impl Organisation {
    pub fn evolve_jersey(&mut self, name: impl Into<String>) {
        self.jersey = Some(Jersey { name: name.into() });
    }

    pub fn sign_sponsor(&mut self, contract: SponsorContract) {
        self.sponsors.push(contract);
    }

    pub fn drop_sponsor(&mut self, id: SponsorId) {
        self.sponsors.retain(|sponsor| sponsor.id != id);
    }

    /// Sales move with the size and the mood of the fan base.
    pub fn merchandise_revenue(&self) -> u64 {
        let count = self.fan_base.count.unwrap_or(0);
        let mood = self
            .fan_base
            .mood
            .map(|score| u64::from(score.value()))
            .unwrap_or(0);
        count.saturating_mul(mood) / 100
    }

    pub fn can_hire_permanent(&self, filled_seats: usize) -> bool {
        self.staff_seats
            .is_some_and(|seats| filled_seats < usize::from(seats))
    }
}

#[cfg(test)]
mod tests {
    use super::{FanBase, Finances, Jersey, Locaux, Organisation, SponsorContract};
    use crate::ids::{OrganisationId, SponsorId, TeamId};
    use crate::score::Score;

    #[test]
    fn organisation_accepts_two_teams() {
        let mut organisation = Organisation {
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
        assert!(!organisation.can_hire_permanent(3));
        organisation.evolve_jersey("Away");
        assert_eq!(organisation.jersey.unwrap().name, "Away");
    }

    #[test]
    fn sponsors_and_merchandise_follow_the_fan_base() {
        let mut installed = sample_organisation();
        installed.staff_seats = Some(4);
        installed.locaux = Some(Locaux {
            scrim_room: true,
            gaming_house: true,
            chef: true,
        });
        installed.sign_sponsor(SponsorContract {
            id: SponsorId(uuid::Uuid::from_u128(9)),
            payer: "Brand".into(),
            amount: None,
            duration_years: Some(1),
            takes_jersey_slot: true,
        });
        let quiet = FanBase {
            count: Some(1_000),
            mood: Some(Score::new(20).unwrap()),
        };
        let loud = FanBase {
            count: Some(10_000),
            mood: Some(Score::new(80).unwrap()),
        };
        installed.fan_base = quiet;
        let quiet_sales = installed.merchandise_revenue();
        installed.fan_base = loud;
        assert!(installed.merchandise_revenue() > quiet_sales);
        assert!(installed.can_hire_permanent(3));
        assert!(!installed.can_hire_permanent(4));
        installed.drop_sponsor(SponsorId(uuid::Uuid::from_u128(9)));
        assert!(installed.sponsors.is_empty());
        assert!(installed.locaux.unwrap().scrim_room);

        let mut fresh = sample_organisation();
        fresh.staff_seats = Some(1);
        fresh.locaux = Some(Locaux {
            scrim_room: false,
            gaming_house: false,
            chef: false,
        });
        fresh.sponsors.clear();
        assert!(fresh.can_hire_permanent(0));
        assert!(!fresh.can_hire_permanent(1));
        assert!(fresh.sponsors.is_empty());
        assert!(!fresh.locaux.unwrap().scrim_room);
    }

    fn sample_organisation() -> Organisation {
        Organisation {
            id: OrganisationId(uuid::Uuid::from_u128(1)),
            name: "Org".to_string(),
            region: "EU".to_string(),
            history: String::new(),
            portrait: None,
            teams: vec![TeamId(uuid::Uuid::from_u128(1))],
            staff_seats: Some(1),
            locaux: None,
            jersey: None,
            sponsors: Vec::new(),
            influencer_contracts: Vec::new(),
            finances: Finances {
                budget: None,
                wage_bill: None,
            },
            fan_base: FanBase {
                count: None,
                mood: None,
            },
        }
    }
}
