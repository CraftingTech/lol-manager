macro_rules! identifier {
    ($name:ident) => {
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
        pub struct $name(pub u64);
    };
}

identifier!(PlayerId);
identifier!(CoachId);
identifier!(OrganisationId);
identifier!(TeamId);
identifier!(StaffId);
identifier!(ChampionId);
identifier!(PatchId);
identifier!(LeagueId);
identifier!(SponsorId);
identifier!(InfluencerContractId);
