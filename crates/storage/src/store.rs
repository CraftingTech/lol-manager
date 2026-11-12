use std::path::Path;

use domain::{
    CalendarDate, Champion, ChampionId, ChampionOnPatch, CoachCompetencies, CoachId, Competencies, DamageSliders,
    FanBase, Finances, HeadCoach, HeadCoachIdentity, InfluencerContract, InfluencerContractId, Jersey,
    League, LeagueId, LeagueSeason, Locaux, ObjectiveEvent, Organisation, OrganisationId, PalmaresEntry,
    Patch, PatchId, PhaseScores, Player, PlayerId, PlayerIdentity, PlayerState, PoolEntry, Presta,
    RoleScores, Roster, SeasonRegistration, SponsorContract, SponsorId, SplitFormat, StaffId,
    StaffMember, TankinessSliders, Team, TeamId,
};
use rusqlite::{params, Connection, OptionalExtension};

use crate::codec::{
    cap_from_sql, cap_to_sql, presence_from_sql, presence_to_sql, role_from_sql, role_to_sql,
    score_from, series_from_sql, series_to_sql, skill_from_sql, skill_kind, skill_score,
    staff_role_from_sql, staff_role_to_sql, tag_from_sql, tag_to_sql, tier_from_sql, tier_to_sql,
    aspiration_effect_from_sql, aspiration_type_from_sql, aspiration_type_to_sql,
};
use crate::error::StoreError;

const SCHEMA: &str = include_str!("../schema.sql");

pub struct Store {
    connection: Connection,
}

impl Store {
    pub fn open(path: impl AsRef<Path>) -> Result<Self, StoreError> {
        Self::from_connection(Connection::open(path)?, true)
    }

    pub fn memory() -> Result<Self, StoreError> {
        Self::from_connection(Connection::open_in_memory()?, false)
    }

    pub fn apply_script(&self, sql: &str) -> Result<(), StoreError> {
        self.connection.execute_batch(sql)?;
        Ok(())
    }

    #[cfg(test)]
    fn count(&self, table: &str) -> Result<i64, StoreError> {
        let sql = format!("SELECT COUNT(*) FROM {table}");
        Ok(self.connection.query_row(&sql, [], |row| row.get(0))?)
    }

    #[cfg(test)]
    fn id_named(&self, table: &str, name: &str) -> Result<uuid::Uuid, StoreError> {
        let sql = format!("SELECT id FROM {table} WHERE name = ?1");
        let value: String = self.connection.query_row(&sql, params![name], |row| row.get(0))?;
        parse_id(value)
    }

    fn from_connection(connection: Connection, on_disk: bool) -> Result<Self, StoreError> {
        if on_disk {
            connection.execute_batch(
                "PRAGMA journal_mode = WAL;
                 PRAGMA synchronous = NORMAL;
                 PRAGMA mmap_size = 268435456;
                 PRAGMA busy_timeout = 2000;",
            )?;
        }
        connection.execute_batch(
            "PRAGMA foreign_keys = ON;
             PRAGMA temp_store = MEMORY;
             PRAGMA cache_size = -65536;",
        )?;
        let version: i64 = connection.query_row("PRAGMA user_version", [], |row| row.get(0))?;
        if version == 0 {
            connection.execute_batch(SCHEMA)?;
            connection.pragma_update(None, "user_version", 1)?;
        }
        Ok(Self { connection })
    }

    pub fn save_champion(&self, champion: &Champion) -> Result<(), StoreError> {
        self.connection.execute(
            "INSERT OR REPLACE INTO champions (id, name, portrait) VALUES (?1, ?2, ?3)",
            params![sql_id(champion.id.0), champion.name, champion.portrait],
        )?;
        Ok(())
    }

    pub fn load_champion(&self, id: ChampionId) -> Result<Champion, StoreError> {
        let name = self
            .connection
            .query_row(
                "SELECT name, portrait FROM champions WHERE id = ?1",
                params![sql_id(id.0)],
                |row| Ok((row.get::<_, String>(0)?, row.get::<_, Option<String>>(1)?)),
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        Ok(Champion { id, name: name.0, portrait: name.1 })
    }

    pub fn save_league(&self, league: &League) -> Result<(), StoreError> {
        self.connection.execute(
            "INSERT OR REPLACE INTO leagues (id, name, region, tier, presence, portrait) VALUES (?1, ?2, ?3, ?4, ?5, ?6)",
            params![
                sql_id(league.id.0),
                league.name,
                league.region,
                tier_to_sql(league.tier),
                presence_to_sql(league.presence),
                league.portrait,
            ],
        )?;
        Ok(())
    }

    pub fn load_league(&self, id: LeagueId) -> Result<League, StoreError> {
        self.connection
            .query_row(
                "SELECT name, region, tier, presence, portrait FROM leagues WHERE id = ?1",
                params![sql_id(id.0)],
                |row| {
                    Ok(League {
                        id,
                        name: row.get(0)?,
                        region: row.get(1)?,
                        tier: tier_from_sql(&row.get::<_, String>(2)?).map_err(store_to_sql)?,
                        presence: presence_from_sql(&row.get::<_, String>(3)?).map_err(store_to_sql)?,
                        portrait: row.get(4)?,
                    })
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)
    }

    pub fn save_league_season(&self, season: &LeagueSeason) -> Result<(), StoreError> {
        let league_id = sql_id(season.league.0);
        let (cap_kind, cap_amount) = cap_to_sql(season.salary_cap);
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO league_seasons
                (league_id, year, team_count, msi_slots, worlds_slots, salary_cap_kind, salary_cap_amount)
             VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)",
            params![
                league_id,
                season.year,
                season.team_count.map(i64::from),
                i64::from(season.msi_slots),
                season.worlds_slots.map(i64::from),
                cap_kind,
                cap_amount,
            ],
        )?;
        tx.execute(
            "DELETE FROM split_formats WHERE league_id = ?1 AND year = ?2",
            params![league_id, season.year],
        )?;
        for (position, split) in season.splits.iter().enumerate() {
            tx.execute(
                "INSERT INTO split_formats (league_id, year, position, name, series) VALUES (?1, ?2, ?3, ?4, ?5)",
                params![league_id, season.year, position as i64, split.name, series_to_sql(split.series)],
            )?;
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_league_season(&self, league: LeagueId, year: i32) -> Result<LeagueSeason, StoreError> {
        let league_id = sql_id(league.0);
        let (team_count, msi_slots, worlds_slots, cap_kind, cap_amount) = self
            .connection
            .query_row(
                "SELECT team_count, msi_slots, worlds_slots, salary_cap_kind, salary_cap_amount
                 FROM league_seasons WHERE league_id = ?1 AND year = ?2",
                params![league_id, year],
                |row| {
                    Ok((
                        row.get::<_, Option<i64>>(0)?,
                        row.get::<_, i64>(1)?,
                        row.get::<_, Option<i64>>(2)?,
                        row.get::<_, Option<String>>(3)?,
                        row.get::<_, Option<i64>>(4)?,
                    ))
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        let mut splits = Vec::new();
        let mut statement = self.connection.prepare(
            "SELECT name, series FROM split_formats WHERE league_id = ?1 AND year = ?2 ORDER BY position",
        )?;
        let rows = statement.query_map(params![league_id, year], |row| {
            Ok((row.get::<_, String>(0)?, row.get::<_, String>(1)?))
        })?;
        for row in rows {
            let (name, series) = row?;
            splits.push(SplitFormat {
                name,
                series: series_from_sql(&series)?,
            });
        }
        Ok(LeagueSeason {
            league,
            year,
            team_count: optional_u8(team_count)?,
            splits,
            msi_slots: u8_from(msi_slots)?,
            worlds_slots: optional_u8(worlds_slots)?,
            salary_cap: cap_from_sql(cap_kind, cap_amount)?,
        })
    }

    pub fn save_organisation(&self, organisation: &Organisation) -> Result<(), StoreError> {
        let id = sql_id(organisation.id.0);
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO organisations (
                id, name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name,
                budget, wage_bill, fan_count, fan_mood, portrait
             ) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14)",
            params![
                id,
                organisation.name,
                organisation.region,
                organisation.history,
                organisation.staff_seats.map(i64::from),
                organisation.locaux.map(|locaux| bool_to_sql(locaux.scrim_room)),
                organisation.locaux.map(|locaux| bool_to_sql(locaux.gaming_house)),
                organisation.locaux.map(|locaux| bool_to_sql(locaux.chef)),
                organisation.jersey.as_ref().map(|jersey| jersey.name.clone()),
                organisation.finances.budget,
                organisation.finances.wage_bill,
                organisation.fan_base.count.map(sql_count).transpose()?,
                organisation.fan_base.mood.map(|mood| i64::from(mood.value())),
                organisation.portrait,
            ],
        )?;
        tx.execute("DELETE FROM organisation_teams WHERE organisation_id = ?1", params![id])?;
        for (position, team) in organisation.teams.iter().enumerate() {
            tx.execute(
                "INSERT INTO organisation_teams (organisation_id, position, team_id) VALUES (?1, ?2, ?3)",
                params![id, position as i64, sql_id(team.0)],
            )?;
        }
        tx.execute("DELETE FROM sponsors WHERE organisation_id = ?1", params![id])?;
        for sponsor in &organisation.sponsors {
            tx.execute(
                "INSERT INTO sponsors (id, organisation_id, payer, amount, duration_years, takes_jersey_slot)
                 VALUES (?1, ?2, ?3, ?4, ?5, ?6)",
                params![
                    sql_id(sponsor.id.0),
                    id,
                    sponsor.payer,
                    sponsor.amount,
                    sponsor.duration_years.map(i64::from),
                    bool_to_sql(sponsor.takes_jersey_slot),
                ],
            )?;
        }
        tx.execute(
            "DELETE FROM influencer_contracts WHERE organisation_id = ?1",
            params![id],
        )?;
        for contract in &organisation.influencer_contracts {
            tx.execute(
                "INSERT INTO influencer_contracts (id, organisation_id, streamer, duration_years, stream_revenue)
                 VALUES (?1, ?2, ?3, ?4, ?5)",
                params![
                    sql_id(contract.id.0),
                    id,
                    contract.streamer,
                    contract.duration_years.map(i64::from),
                    contract.stream_revenue,
                ],
            )?;
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_organisation(&self, id: OrganisationId) -> Result<Organisation, StoreError> {
        let org_id = sql_id(id.0);
        let row = self
            .connection
            .query_row(
                "SELECT name, region, history, staff_seats, scrim_room, gaming_house, chef, jersey_name,
                        budget, wage_bill, fan_count, fan_mood, portrait
                 FROM organisations WHERE id = ?1",
                params![org_id],
                |row| {
                    Ok((
                        row.get::<_, String>(0)?,
                        row.get::<_, String>(1)?,
                        row.get::<_, String>(2)?,
                        row.get::<_, Option<i64>>(3)?,
                        row.get::<_, Option<i64>>(4)?,
                        row.get::<_, Option<i64>>(5)?,
                        row.get::<_, Option<i64>>(6)?,
                        row.get::<_, Option<String>>(7)?,
                        row.get::<_, Option<i64>>(8)?,
                        row.get::<_, Option<i64>>(9)?,
                        row.get::<_, Option<i64>>(10)?,
                        row.get::<_, Option<i64>>(11)?,
                        row.get::<_, Option<String>>(12)?,
                    ))
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        Ok(Organisation {
            id,
            name: row.0,
            region: row.1,
            history: row.2,
            teams: self.team_ids(
                "SELECT team_id FROM organisation_teams WHERE organisation_id = ?1 ORDER BY position",
                &org_id,
            )?,
            staff_seats: row.3.map(u8_from).transpose()?,
            locaux: match (row.4, row.5, row.6) {
                (None, None, None) => None,
                (Some(scrim_room), Some(gaming_house), Some(chef)) => Some(Locaux {
                    scrim_room: sql_to_bool(scrim_room)?,
                    gaming_house: sql_to_bool(gaming_house)?,
                    chef: sql_to_bool(chef)?,
                }),
                _ => return Err(StoreError::InvalidValue("locaux".into())),
            },
            jersey: row.7.map(|name| Jersey { name }),
            sponsors: self.load_sponsors(&org_id)?,
            influencer_contracts: self.load_influencer_contracts(&org_id)?,
            finances: Finances {
                budget: row.8,
                wage_bill: row.9,
            },
            fan_base: FanBase {
                count: optional_u64(row.10)?,
                mood: row.11.map(score_from).transpose()?,
            },
            portrait: row.12,
        })
    }

    pub fn save_team(&self, team: &Team) -> Result<(), StoreError> {
        let id = sql_id(team.id.0);
        let (league_id, season_year) = match team.registration {
            None => (None, None),
            Some(registration) => (Some(sql_id(registration.league.0)), Some(i64::from(registration.year))),
        };
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO teams (id, name, organisation_id, league_id, season_year, portrait)
             VALUES (?1, ?2, ?3, ?4, ?5, ?6)",
            params![id, team.name, sql_id(team.organisation.0), league_id, season_year, team.portrait],
        )?;
        tx.execute("DELETE FROM roster_players WHERE team_id = ?1", params![id])?;
        for (position, player) in team.roster.players.iter().enumerate() {
            tx.execute(
                "INSERT INTO roster_players (team_id, position, player_id) VALUES (?1, ?2, ?3)",
                params![id, position as i64, sql_id(player.0)],
            )?;
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_team(&self, id: TeamId) -> Result<Team, StoreError> {
        let team_id = sql_id(id.0);
        let (name, organisation, league_id, season_year, portrait) = self
            .connection
            .query_row(
                "SELECT name, organisation_id, league_id, season_year, portrait FROM teams WHERE id = ?1",
                params![team_id],
                |row| {
                    Ok((
                        row.get::<_, String>(0)?,
                        row.get::<_, String>(1)?,
                        row.get::<_, Option<String>>(2)?,
                        row.get::<_, Option<i64>>(3)?,
                        row.get::<_, Option<String>>(4)?,
                    ))
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        let registration = match (league_id, season_year) {
            (None, None) => None,
            (Some(league), Some(year)) => Some(SeasonRegistration {
                league: LeagueId(parse_id(league)?),
                year: i32::try_from(year).map_err(|_| StoreError::InvalidValue("year".into()))?,
            }),
            _ => return Err(StoreError::InvalidValue("registration".into())),
        };
        Ok(Team {
            id,
            name,
            organisation: OrganisationId(parse_id(organisation)?),
            roster: Roster {
                players: self.player_ids(
                    "SELECT player_id FROM roster_players WHERE team_id = ?1 ORDER BY position",
                    &team_id,
                )?,
            },
            registration,
            portrait,
        })
    }

    pub fn save_player(&self, player: &Player) -> Result<(), StoreError> {
        let id = sql_id(player.identity.id.0);
        let competencies = player.competencies.as_ref();
        let (role_skill_kind, role_skill_score) = match competencies {
            None => (None, None),
            Some(sheet) => (
                Some(skill_kind(sheet.role_skill)),
                Some(i64::from(skill_score(sheet.role_skill))),
            ),
        };
        let (form, fatigue) = match player.state {
            None => (None, None),
            Some(state) => (
                Some(i64::from(state.form.value())),
                Some(i64::from(state.fatigue.value())),
            ),
        };
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO players (
                id, name, role, nationality, birth_date,
                mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation,
                phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score,
                form, fatigue, portrait
             ) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15, ?16, ?17, ?18, ?19, ?20, ?21)",
            params![
                id,
                player.identity.name,
                role_to_sql(player.identity.role),
                player.identity.nationality,
                player.identity.birth_date.map(CalendarDate::to_iso),
                competencies.map(|sheet| i64::from(sheet.mechanics.value())),
                competencies.map(|sheet| i64::from(sheet.teamfight.value())),
                competencies.map(|sheet| i64::from(sheet.map_awareness.value())),
                competencies.map(|sheet| i64::from(sheet.objectives.value())),
                competencies.map(|sheet| i64::from(sheet.tempo.value())),
                competencies.map(|sheet| i64::from(sheet.mental.value())),
                competencies.map(|sheet| i64::from(sheet.itemisation.value())),
                competencies.map(|sheet| i64::from(sheet.phases.early.value())),
                competencies.map(|sheet| i64::from(sheet.phases.mid.value())),
                competencies.map(|sheet| i64::from(sheet.phases.late.value())),
                competencies.map(|sheet| i64::from(sheet.shotcalling.value())),
                role_skill_kind,
                role_skill_score,
                form,
                fatigue,
                player.identity.portrait,
            ],
        )?;
        replace_ordered(&tx, "DELETE FROM player_teams WHERE player_id = ?1", &id)?;
        for (position, team) in player.identity.teams.iter().enumerate() {
            tx.execute(
                "INSERT INTO player_teams (player_id, position, team_id) VALUES (?1, ?2, ?3)",
                params![id, position as i64, sql_id(team.0)],
            )?;
        }
        tx.execute("DELETE FROM player_palmares WHERE player_id = ?1", params![id])?;
        for (position, entry) in player.identity.palmares.iter().enumerate() {
            tx.execute(
                "INSERT INTO player_palmares (player_id, position, award, competition, year) VALUES (?1, ?2, ?3, ?4, ?5)",
                params![id, position as i64, entry.award, entry.competition, entry.year],
            )?;
        }
        tx.execute("DELETE FROM player_pool WHERE player_id = ?1", params![id])?;
        for entry in &player.pool {
            tx.execute(
                "INSERT INTO player_pool (player_id, champion_id, mastery) VALUES (?1, ?2, ?3)",
                params![id, sql_id(entry.champion.0), i64::from(entry.mastery.value())],
            )?;
        }
        tx.execute("DELETE FROM player_tags WHERE player_id = ?1", params![id])?;
        for tag in &player.tags {
            tx.execute(
                "INSERT INTO player_tags (player_id, tag) VALUES (?1, ?2)",
                params![id, tag_to_sql(*tag)],
            )?;
        }
        tx.execute("DELETE FROM player_aspirations WHERE player_id = ?1", params![id])?;
        for aspiration in &player.aspirations {
            let (title, age, decision) = match &aspiration.value {
                domain::AspirationValue::Title(title) => (Some(title.clone()), None, None),
                domain::AspirationValue::Age(age) => (None, Some(i64::from(*age)), None),
                domain::AspirationValue::Decision(decision) => (None, None, Some(bool_to_sql(*decision))),
            };
            tx.execute(
                "INSERT INTO player_aspirations (player_id, aspiration_type, title, age, decision)
                 VALUES (?1, ?2, ?3, ?4, ?5)",
                params![id, aspiration_type_to_sql(aspiration.kind), title, age, decision],
            )?;
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_player(&self, id: PlayerId) -> Result<Player, StoreError> {
        let player_id = sql_id(id.0);
        let row = self
            .connection
            .query_row(
                "SELECT name, role, nationality, birth_date,
                        mechanics, teamfight, map_awareness, objectives, tempo, mental, itemisation,
                        phase_early, phase_mid, phase_late, shotcalling, role_skill_kind, role_skill_score,
                        form, fatigue, portrait
                 FROM players WHERE id = ?1",
                params![player_id],
                |row| {
                    Ok((
                        row.get::<_, String>(0)?,
                        row.get::<_, String>(1)?,
                        row.get::<_, Option<String>>(2)?,
                        row.get::<_, Option<String>>(3)?,
                        row.get::<_, Option<i64>>(4)?,
                        row.get::<_, Option<i64>>(5)?,
                        row.get::<_, Option<i64>>(6)?,
                        row.get::<_, Option<i64>>(7)?,
                        row.get::<_, Option<i64>>(8)?,
                        row.get::<_, Option<i64>>(9)?,
                        row.get::<_, Option<i64>>(10)?,
                        row.get::<_, Option<i64>>(11)?,
                        row.get::<_, Option<i64>>(12)?,
                        row.get::<_, Option<i64>>(13)?,
                        row.get::<_, Option<i64>>(14)?,
                        row.get::<_, Option<String>>(15)?,
                        row.get::<_, Option<i64>>(16)?,
                        row.get::<_, Option<i64>>(17)?,
                        row.get::<_, Option<i64>>(18)?,
                        row.get::<_, Option<String>>(19)?,
                    ))
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        let role = role_from_sql(&row.1)?;
        let identity = PlayerIdentity {
            id,
            name: row.0,
            role,
            nationality: row.2,
            birth_date: birth_date_from(row.3)?,
            portrait: row.19,
            teams: self.team_ids(
                "SELECT team_id FROM player_teams WHERE player_id = ?1 ORDER BY position",
                &player_id,
            )?,
            palmares: self.load_palmares(
                "SELECT award, competition, year FROM player_palmares WHERE player_id = ?1 ORDER BY position",
                &player_id,
            )?,
        };
        let pool = self.load_pool(&player_id)?;
        let competencies = match (
            row.4, row.5, row.6, row.7, row.8, row.9, row.10, row.11, row.12, row.13, row.14, row.15,
            row.16,
        ) {
            (
                Some(mechanics),
                Some(teamfight),
                Some(map_awareness),
                Some(objectives),
                Some(tempo),
                Some(mental),
                Some(itemisation),
                Some(early),
                Some(mid),
                Some(late),
                Some(shotcalling),
                Some(role_skill_kind),
                Some(role_skill_score),
            ) => Some(Competencies {
                mechanics: score_from(mechanics)?,
                teamfight: score_from(teamfight)?,
                map_awareness: score_from(map_awareness)?,
                objectives: score_from(objectives)?,
                tempo: score_from(tempo)?,
                mental: score_from(mental)?,
                itemisation: score_from(itemisation)?,
                phases: PhaseScores {
                    early: score_from(early)?,
                    mid: score_from(mid)?,
                    late: score_from(late)?,
                },
                shotcalling: score_from(shotcalling)?,
                role_skill: skill_from_sql(&role_skill_kind, score_from(role_skill_score)?)?,
            }),
            (None, None, None, None, None, None, None, None, None, None, None, None, None) => None,
            _ => return Err(StoreError::InvalidValue("competencies".into())),
        };
        let state = match (row.17, row.18) {
            (Some(form), Some(fatigue)) => Some(PlayerState {
                form: score_from(form)?,
                fatigue: score_from(fatigue)?,
            }),
            (None, None) => None,
            _ => return Err(StoreError::InvalidValue("state".into())),
        };
        let tags = self.load_tags(&player_id)?;
        let aspirations = self.load_aspirations(&player_id)?;
        Ok(Player::try_new(
            identity,
            pool,
            competencies,
            state,
            tags,
            aspirations,
        )?)
    }

    pub fn save_head_coach(&self, coach: &HeadCoach) -> Result<(), StoreError> {
        let id = sql_id(coach.identity.id.0);
        let competencies = &coach.competencies;
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO head_coaches (
                id, name, nationality, age, reputation, draft, training, mental, macro_play, media
             ) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)",
            params![
                id,
                coach.identity.name,
                coach.identity.nationality,
                i64::from(coach.identity.age),
                i64::from(coach.reputation.value()),
                i64::from(competencies.draft.value()),
                i64::from(competencies.training.value()),
                i64::from(competencies.mental.value()),
                i64::from(competencies.macro_play.value()),
                i64::from(competencies.media.value()),
            ],
        )?;
        tx.execute("DELETE FROM coach_teams WHERE coach_id = ?1", params![id])?;
        for (position, team) in coach.identity.teams.iter().enumerate() {
            tx.execute(
                "INSERT INTO coach_teams (coach_id, position, team_id) VALUES (?1, ?2, ?3)",
                params![id, position as i64, sql_id(team.0)],
            )?;
        }
        tx.execute("DELETE FROM coach_palmares WHERE coach_id = ?1", params![id])?;
        for (position, entry) in coach.identity.palmares.iter().enumerate() {
            tx.execute(
                "INSERT INTO coach_palmares (coach_id, position, award, competition, year) VALUES (?1, ?2, ?3, ?4, ?5)",
                params![id, position as i64, entry.award, entry.competition, entry.year],
            )?;
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_head_coach(&self, id: CoachId) -> Result<HeadCoach, StoreError> {
        let coach_id = sql_id(id.0);
        let row = self
            .connection
            .query_row(
                "SELECT name, nationality, age, reputation, draft, training, mental, macro_play, media
                 FROM head_coaches WHERE id = ?1",
                params![coach_id],
                |row| {
                    Ok((
                        row.get::<_, String>(0)?,
                        row.get::<_, String>(1)?,
                        row.get::<_, i64>(2)?,
                        row.get::<_, i64>(3)?,
                        row.get::<_, i64>(4)?,
                        row.get::<_, i64>(5)?,
                        row.get::<_, i64>(6)?,
                        row.get::<_, i64>(7)?,
                        row.get::<_, i64>(8)?,
                    ))
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        Ok(HeadCoach {
            identity: HeadCoachIdentity {
                id,
                name: row.0,
                nationality: row.1,
                age: u8_from(row.2)?,
                teams: self.team_ids(
                    "SELECT team_id FROM coach_teams WHERE coach_id = ?1 ORDER BY position",
                    &coach_id,
                )?,
                palmares: self.load_palmares(
                    "SELECT award, competition, year FROM coach_palmares WHERE coach_id = ?1 ORDER BY position",
                    &coach_id,
                )?,
            },
            competencies: CoachCompetencies {
                draft: score_from(row.4)?,
                training: score_from(row.5)?,
                mental: score_from(row.6)?,
                macro_play: score_from(row.7)?,
                media: score_from(row.8)?,
            },
            reputation: score_from(row.3)?,
        })
    }

    pub fn save_staff(&self, member: &StaffMember) -> Result<(), StoreError> {
        let (role, positional) = staff_role_to_sql(member.role);
        let competencies = &member.competencies;
        self.connection.execute(
            "INSERT OR REPLACE INTO staff_members (
                id, name, role, positional_role, draft, training, mental, macro_play, media
             ) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)",
            params![
                sql_id(member.id.0),
                member.name,
                role,
                positional,
                i64::from(competencies.draft.value()),
                i64::from(competencies.training.value()),
                i64::from(competencies.mental.value()),
                i64::from(competencies.macro_play.value()),
                i64::from(competencies.media.value()),
            ],
        )?;
        Ok(())
    }

    pub fn load_staff(&self, id: StaffId) -> Result<StaffMember, StoreError> {
        self.connection
            .query_row(
                "SELECT name, role, positional_role, draft, training, mental, macro_play, media
                 FROM staff_members WHERE id = ?1",
                params![sql_id(id.0)],
                |row| {
                    let role = staff_role_from_sql(
                        &row.get::<_, String>(1)?,
                        row.get::<_, Option<String>>(2)?,
                    )
                    .map_err(store_to_sql)?;
                    Ok(StaffMember {
                        id,
                        name: row.get(0)?,
                        role,
                        competencies: CoachCompetencies {
                            draft: score_from(row.get(3)?).map_err(store_to_sql)?,
                            training: score_from(row.get(4)?).map_err(store_to_sql)?,
                            mental: score_from(row.get(5)?).map_err(store_to_sql)?,
                            macro_play: score_from(row.get(6)?).map_err(store_to_sql)?,
                            media: score_from(row.get(7)?).map_err(store_to_sql)?,
                        },
                    })
                },
            )
            .optional()?
            .ok_or(StoreError::NotFound)
    }

    pub fn save_presta(&self, presta: &Presta) -> Result<(), StoreError> {
        self.connection.execute(
            "INSERT OR REPLACE INTO prestas (player_id, champion_id) VALUES (?1, ?2)",
            params![sql_id(presta.player.0), sql_id(presta.champion.0)],
        )?;
        Ok(())
    }

    pub fn load_presta(&self, player: domain::PlayerId, champion: ChampionId) -> Result<Presta, StoreError> {
        let found: Option<(String, String)> = self
            .connection
            .query_row(
                "SELECT player_id, champion_id FROM prestas WHERE player_id = ?1 AND champion_id = ?2",
                params![sql_id(player.0), sql_id(champion.0)],
                |row| Ok((row.get(0)?, row.get(1)?)),
            )
            .optional()?;
        let Some((player_id, champion_id)) = found else {
            return Err(StoreError::NotFound);
        };
        Ok(Presta {
            player: domain::PlayerId(parse_id(player_id)?),
            champion: ChampionId(parse_id(champion_id)?),
        })
    }

    pub fn save_patch(&self, patch: &Patch) -> Result<(), StoreError> {
        let id = sql_id(patch.id.0);
        let tx = self.connection.unchecked_transaction()?;
        tx.execute(
            "INSERT OR REPLACE INTO patches (id, version, date) VALUES (?1, ?2, ?3)",
            params![id, patch.version, patch.date],
        )?;
        tx.execute("DELETE FROM objective_unlocks WHERE patch_id = ?1", params![id])?;
        tx.execute("DELETE FROM objective_events WHERE patch_id = ?1", params![id])?;
        tx.execute("DELETE FROM champion_on_patch WHERE patch_id = ?1", params![id])?;
        for champion in &patch.champions {
            let roles = champion.roles;
            let damage = champion.damage;
            let tankiness = champion.tankiness;
            tx.execute(
                "INSERT INTO champion_on_patch (
                    patch_id, champion_id, top, jungle, mid, adc, support,
                    attack, ability, true_damage, health, armor, magic_resist
                 ) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13)",
                params![
                    id,
                    sql_id(champion.champion.0),
                    roles.map(|scores| i64::from(scores.top.value())),
                    roles.map(|scores| i64::from(scores.jungle.value())),
                    roles.map(|scores| i64::from(scores.mid.value())),
                    roles.map(|scores| i64::from(scores.adc.value())),
                    roles.map(|scores| i64::from(scores.support.value())),
                    damage.map(|scores| i64::from(scores.attack.value())),
                    damage.map(|scores| i64::from(scores.ability.value())),
                    damage.map(|scores| i64::from(scores.true_damage.value())),
                    tankiness.map(|scores| i64::from(scores.health.value())),
                    tankiness.map(|scores| i64::from(scores.armor.value())),
                    tankiness.map(|scores| i64::from(scores.magic_resist.value())),
                ],
            )?;
        }
        for (position, objective) in patch.objectives.iter().enumerate() {
            tx.execute(
                "INSERT INTO objective_events (patch_id, position, name, reward) VALUES (?1, ?2, ?3, ?4)",
                params![id, position as i64, objective.name, objective.reward],
            )?;
            for (unlock_position, name) in objective.unlocks.iter().enumerate() {
                tx.execute(
                    "INSERT INTO objective_unlocks (patch_id, objective_position, unlock_position, name)
                     VALUES (?1, ?2, ?3, ?4)",
                    params![id, position as i64, unlock_position as i64, name],
                )?;
            }
        }
        tx.commit()?;
        Ok(())
    }

    pub fn load_patch(&self, id: PatchId) -> Result<Patch, StoreError> {
        let patch_id = sql_id(id.0);
        let (version, date) = self
            .connection
            .query_row(
                "SELECT version, date FROM patches WHERE id = ?1",
                params![patch_id],
                |row| Ok((row.get::<_, String>(0)?, row.get::<_, String>(1)?)),
            )
            .optional()?
            .ok_or(StoreError::NotFound)?;
        Ok(Patch {
            id,
            version,
            date,
            champions: self.load_champions_on_patch(&patch_id)?,
            objectives: self.load_objectives(&patch_id)?,
        })
    }

    fn team_ids(&self, sql: &str, owner: &str) -> Result<Vec<TeamId>, StoreError> {
        let mut statement = self.connection.prepare(sql)?;
        let rows = statement.query_map(params![owner], |row| row.get::<_, String>(0))?;
        rows.map(|row| Ok(TeamId(parse_id(row?)?))).collect()
    }

    fn player_ids(&self, sql: &str, owner: &str) -> Result<Vec<PlayerId>, StoreError> {
        let mut statement = self.connection.prepare(sql)?;
        let rows = statement.query_map(params![owner], |row| row.get::<_, String>(0))?;
        rows.map(|row| Ok(PlayerId(parse_id(row?)?))).collect()
    }

    fn load_palmares(&self, sql: &str, owner: &str) -> Result<Vec<PalmaresEntry>, StoreError> {
        let mut statement = self.connection.prepare(sql)?;
        let rows = statement.query_map(params![owner], |row| {
            Ok(PalmaresEntry {
                award: row.get(0)?,
                competition: row.get(1)?,
                year: row.get(2)?,
            })
        })?;
        rows.collect::<Result<Vec<_>, _>>().map_err(StoreError::from)
    }

    fn load_pool(&self, player_id: &str) -> Result<Vec<PoolEntry>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT champion_id, mastery FROM player_pool WHERE player_id = ?1 ORDER BY champion_id",
        )?;
        let rows = statement.query_map(params![player_id], |row| {
            Ok((row.get::<_, String>(0)?, row.get::<_, i64>(1)?))
        })?;
        let mut pool = Vec::new();
        for row in rows {
            let (champion, mastery) = row?;
            pool.push(PoolEntry {
                champion: ChampionId(parse_id(champion)?),
                mastery: score_from(mastery)?,
            });
        }
        Ok(pool)
    }

    fn load_tags(&self, player_id: &str) -> Result<Vec<domain::Tag>, StoreError> {
        let mut statement = self
            .connection
            .prepare("SELECT tag FROM player_tags WHERE player_id = ?1 ORDER BY tag")?;
        let rows = statement.query_map(params![player_id], |row| row.get::<_, String>(0))?;
        let mut tags = Vec::new();
        for row in rows {
            tags.push(tag_from_sql(&row?)?);
        }
        Ok(tags)
    }

    fn load_aspirations(&self, player_id: &str) -> Result<Vec<domain::PlayerAspiration>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT aspiration_type, title, age, decision
             FROM player_aspirations WHERE player_id = ?1 ORDER BY aspiration_type",
        )?;
        let rows = statement.query_map(params![player_id], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, Option<String>>(1)?,
                row.get::<_, Option<i64>>(2)?,
                row.get::<_, Option<i64>>(3)?,
            ))
        })?;
        let mut aspirations = Vec::new();
        for row in rows {
            let (kind, title, age, decision) = row?;
            let kind = aspiration_type_from_sql(&kind)?;
            let value = match (title, age, decision) {
                (Some(title), None, None) => domain::AspirationValue::Title(title),
                (None, Some(age), None) => domain::AspirationValue::Age(u8_from(age)?),
                (None, None, Some(decision)) => domain::AspirationValue::Decision(sql_to_bool(decision)?),
                _ => return Err(StoreError::InvalidValue("aspiration".into())),
            };
            aspirations.push(domain::PlayerAspiration::new(kind, value)?);
        }
        Ok(aspirations)
    }

    pub fn aspiration_modifiers(
        &self,
    ) -> Result<Vec<(domain::AspirationType, domain::AspirationEffect, String)>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT aspiration_type, effect, impact
             FROM aspiration_modifiers ORDER BY aspiration_type, effect",
        )?;
        let rows = statement.query_map([], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, String>(1)?,
                row.get::<_, String>(2)?,
            ))
        })?;
        let mut modifiers = Vec::new();
        for row in rows {
            let (kind, effect, impact) = row?;
            modifiers.push((
                aspiration_type_from_sql(&kind)?,
                aspiration_effect_from_sql(&effect)?,
                impact,
            ));
        }
        Ok(modifiers)
    }

    fn load_sponsors(&self, organisation_id: &str) -> Result<Vec<SponsorContract>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT id, payer, amount, duration_years, takes_jersey_slot
             FROM sponsors WHERE organisation_id = ?1 ORDER BY id",
        )?;
        let rows = statement.query_map(params![organisation_id], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, String>(1)?,
                row.get::<_, Option<i64>>(2)?,
                row.get::<_, Option<i64>>(3)?,
                row.get::<_, i64>(4)?,
            ))
        })?;
        let mut sponsors = Vec::new();
        for row in rows {
            let (id, payer, amount, duration, slot) = row?;
            sponsors.push(SponsorContract {
                id: SponsorId(parse_id(id)?),
                payer,
                amount,
                duration_years: optional_u8(duration)?,
                takes_jersey_slot: sql_to_bool(slot)?,
            });
        }
        Ok(sponsors)
    }

    fn load_influencer_contracts(&self, organisation_id: &str) -> Result<Vec<InfluencerContract>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT id, streamer, duration_years, stream_revenue
             FROM influencer_contracts WHERE organisation_id = ?1 ORDER BY id",
        )?;
        let rows = statement.query_map(params![organisation_id], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, String>(1)?,
                row.get::<_, Option<i64>>(2)?,
                row.get::<_, Option<i64>>(3)?,
            ))
        })?;
        let mut contracts = Vec::new();
        for row in rows {
            let (id, streamer, duration, revenue) = row?;
            contracts.push(InfluencerContract {
                id: InfluencerContractId(parse_id(id)?),
                streamer,
                duration_years: optional_u8(duration)?,
                stream_revenue: revenue,
            });
        }
        Ok(contracts)
    }

    fn load_champions_on_patch(&self, patch_id: &str) -> Result<Vec<ChampionOnPatch>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist
             FROM champion_on_patch WHERE patch_id = ?1 ORDER BY champion_id",
        )?;
        let rows = statement.query_map(params![patch_id], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, Option<i64>>(1)?,
                row.get::<_, Option<i64>>(2)?,
                row.get::<_, Option<i64>>(3)?,
                row.get::<_, Option<i64>>(4)?,
                row.get::<_, Option<i64>>(5)?,
                row.get::<_, Option<i64>>(6)?,
                row.get::<_, Option<i64>>(7)?,
                row.get::<_, Option<i64>>(8)?,
                row.get::<_, Option<i64>>(9)?,
                row.get::<_, Option<i64>>(10)?,
                row.get::<_, Option<i64>>(11)?,
            ))
        })?;
        let mut champions = Vec::new();
        for row in rows {
            let values = row?;
            champions.push(ChampionOnPatch {
                champion: ChampionId(parse_id(values.0)?),
                roles: role_scores(values.1, values.2, values.3, values.4, values.5)?,
                damage: damage_sliders(values.6, values.7, values.8)?,
                tankiness: tankiness_sliders(values.9, values.10, values.11)?,
            });
        }
        Ok(champions)
    }

    fn load_objectives(&self, patch_id: &str) -> Result<Vec<ObjectiveEvent>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT position, name, reward FROM objective_events WHERE patch_id = ?1 ORDER BY position",
        )?;
        let rows = statement.query_map(params![patch_id], |row| {
            Ok((row.get::<_, i64>(0)?, row.get::<_, String>(1)?, row.get::<_, Option<String>>(2)?))
        })?;
        let mut objectives = Vec::new();
        for row in rows {
            let (position, name, reward) = row?;
            objectives.push(ObjectiveEvent {
                name,
                reward,
                unlocks: self.load_unlocks(patch_id, position)?,
            });
        }
        Ok(objectives)
    }

    fn load_unlocks(&self, patch_id: &str, position: i64) -> Result<Vec<String>, StoreError> {
        let mut statement = self.connection.prepare(
            "SELECT name FROM objective_unlocks
             WHERE patch_id = ?1 AND objective_position = ?2 ORDER BY unlock_position",
        )?;
        let rows = statement.query_map(params![patch_id, position], |row| row.get::<_, String>(0))?;
        rows.collect::<Result<Vec<_>, _>>().map_err(StoreError::from)
    }

    pub fn list_champions(&self) -> Result<Vec<Champion>, StoreError> {
        self.ids_ordered("champions")?
            .into_iter()
            .map(|id| self.load_champion(ChampionId(id)))
            .collect()
    }

    pub fn list_leagues(&self) -> Result<Vec<League>, StoreError> {
        self.ids_ordered("leagues")?
            .into_iter()
            .map(|id| self.load_league(LeagueId(id)))
            .collect()
    }

    pub fn list_organisations(&self) -> Result<Vec<Organisation>, StoreError> {
        self.ids_ordered("organisations")?
            .into_iter()
            .map(|id| self.load_organisation(OrganisationId(id)))
            .collect()
    }

    pub fn list_teams(&self) -> Result<Vec<Team>, StoreError> {
        self.ids_ordered("teams")?
            .into_iter()
            .map(|id| self.load_team(TeamId(id)))
            .collect()
    }

    pub fn list_players(&self) -> Result<Vec<Player>, StoreError> {
        self.ids_ordered("players")?
            .into_iter()
            .map(|id| self.load_player(PlayerId(id)))
            .collect()
    }

    pub fn list_patches(&self) -> Result<Vec<Patch>, StoreError> {
        let mut statement = self
            .connection
            .prepare("SELECT id FROM patches ORDER BY date, version")?;
        let rows = statement.query_map([], |row| row.get::<_, String>(0))?;
        rows.map(|value| self.load_patch(PatchId(parse_id(value?)?))).collect()
    }

    fn ids_ordered(&self, table: &str) -> Result<Vec<uuid::Uuid>, StoreError> {
        let sql = format!("SELECT id FROM {table} ORDER BY name");
        let mut statement = self.connection.prepare(&sql)?;
        let rows = statement.query_map([], |row| row.get::<_, String>(0))?;
        rows.map(|value| parse_id(value?)).collect()
    }
}

fn replace_ordered(connection: &Connection, sql: &str, id: &str) -> Result<(), StoreError> {
    connection.execute(sql, params![id])?;
    Ok(())
}

fn sql_id(value: uuid::Uuid) -> String {
    value.to_string()
}

fn sql_count(value: u64) -> Result<i64, StoreError> {
    i64::try_from(value).map_err(|_| StoreError::InvalidValue("count".into()))
}

fn parse_id(value: String) -> Result<uuid::Uuid, StoreError> {
    uuid::Uuid::parse_str(&value).map_err(|_| StoreError::InvalidValue(value))
}

fn u64_from(value: i64) -> Result<u64, StoreError> {
    u64::try_from(value).map_err(|_| StoreError::InvalidValue("count".into()))
}

fn u8_from(value: i64) -> Result<u8, StoreError> {
    u8::try_from(value).map_err(|_| StoreError::InvalidValue("byte".into()))
}

fn birth_date_from(value: Option<String>) -> Result<Option<CalendarDate>, StoreError> {
    match value {
        None => Ok(None),
        Some(text) => CalendarDate::parse(&text)
            .map(Some)
            .ok_or_else(|| StoreError::InvalidValue(text)),
    }
}

fn optional_u8(value: Option<i64>) -> Result<Option<u8>, StoreError> {
    value.map(u8_from).transpose()
}

fn optional_u64(value: Option<i64>) -> Result<Option<u64>, StoreError> {
    value.map(u64_from).transpose()
}

fn bool_to_sql(value: bool) -> i64 {
    i64::from(value)
}

fn sql_to_bool(value: i64) -> Result<bool, StoreError> {
    match value {
        0 => Ok(false),
        1 => Ok(true),
        _ => Err(StoreError::InvalidValue("bool".into())),
    }
}

fn store_to_sql(error: StoreError) -> rusqlite::Error {
    rusqlite::Error::ToSqlConversionFailure(Box::new(StoreErrorMessage(error)))
}

#[derive(Debug)]
struct StoreErrorMessage(StoreError);

impl std::fmt::Display for StoreErrorMessage {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(formatter, "{:?}", self.0)
    }
}

impl std::error::Error for StoreErrorMessage {}

fn role_scores(
    top: Option<i64>,
    jungle: Option<i64>,
    mid: Option<i64>,
    adc: Option<i64>,
    support: Option<i64>,
) -> Result<Option<RoleScores>, StoreError> {
    match (top, jungle, mid, adc, support) {
        (None, None, None, None, None) => Ok(None),
        (Some(top), Some(jungle), Some(mid), Some(adc), Some(support)) => Ok(Some(RoleScores {
            top: score_from(top)?,
            jungle: score_from(jungle)?,
            mid: score_from(mid)?,
            adc: score_from(adc)?,
            support: score_from(support)?,
        })),
        _ => Err(StoreError::InvalidValue("role scores".into())),
    }
}

fn damage_sliders(
    attack: Option<i64>,
    ability: Option<i64>,
    true_damage: Option<i64>,
) -> Result<Option<DamageSliders>, StoreError> {
    match (attack, ability, true_damage) {
        (None, None, None) => Ok(None),
        (Some(attack), Some(ability), Some(true_damage)) => Ok(Some(DamageSliders {
            attack: score_from(attack)?,
            ability: score_from(ability)?,
            true_damage: score_from(true_damage)?,
        })),
        _ => Err(StoreError::InvalidValue("damage".into())),
    }
}

fn tankiness_sliders(
    health: Option<i64>,
    armor: Option<i64>,
    magic_resist: Option<i64>,
) -> Result<Option<TankinessSliders>, StoreError> {
    match (health, armor, magic_resist) {
        (None, None, None) => Ok(None),
        (Some(health), Some(armor), Some(magic_resist)) => Ok(Some(TankinessSliders {
            health: score_from(health)?,
            armor: score_from(armor)?,
            magic_resist: score_from(magic_resist)?,
        })),
        _ => Err(StoreError::InvalidValue("tankiness".into())),
    }
}

#[cfg(test)]
mod tests {
    use super::Store;
    use domain::{
        CalendarDate, Champion, ChampionId, ChampionOnPatch, CoachCompetencies, CoachId, Competencies,
        DamageSliders, FanBase, Finances, HeadCoach, HeadCoachIdentity, InfluencerContract,
        InfluencerContractId, Jersey, League, LeagueId, LeagueSeason, LeagueTier, Locaux,
        ObjectiveEvent, Organisation, OrganisationId, PalmaresEntry, Patch, PatchId, PhaseScores,
        Player, PlayerId, PlayerIdentity, PlayerState, PoolEntry, Presta, Role, RoleScores, RoleSkill,
        Roster, SalaryCap, Score, SeasonPresence, SeasonRegistration, SeriesLength, SponsorContract,
        SponsorId, SplitFormat, StaffId, StaffMember, StaffRole, Tag, Team, TeamId,
    };

    fn score(value: u8) -> Score {
        Score::new(value).unwrap()
    }

    #[test]
    fn roundtrip_keeps_the_world() {
        let store = Store::memory().unwrap();
        let champion = Champion {
            id: ChampionId(uuid::Uuid::from_u128(7)),
            name: "Ahri".into(),
            portrait: Some("portraits/champions/Ahri.png".into()),
        };
        let league = League {
            id: LeagueId(uuid::Uuid::from_u128(1)),
            name: "EU LCS".into(),
            region: "EU".into(),
            tier: LeagueTier::Primary,
            presence: SeasonPresence::Playable,
            portrait: Some("portraits/wiki/LCS_Europe_Logo.png".into()),
        };
        let season = LeagueSeason {
            league: league.id,
            year: 2014,
            team_count: None,
            splits: vec![SplitFormat {
                name: "Spring".into(),
                series: SeriesLength::SingleGame,
            }],
            msi_slots: 0,
            worlds_slots: Some(3),
            salary_cap: Some(SalaryCap::Soft { amount: None }),
        };
        let organisation = Organisation {
            id: OrganisationId(uuid::Uuid::from_u128(1)),
            name: "Org".into(),
            region: "EU".into(),
            history: String::new(),
            portrait: Some("portraits/wiki/Fnatic_original_logo.png".into()),
            teams: vec![TeamId(uuid::Uuid::from_u128(1))],
            staff_seats: Some(1),
            locaux: Some(Locaux {
                scrim_room: false,
                gaming_house: true,
                chef: false,
            }),
            jersey: Some(Jersey { name: "Home".into() }),
            sponsors: vec![SponsorContract {
                id: SponsorId(uuid::Uuid::from_u128(1)),
                payer: "Partner".into(),
                amount: None,
                duration_years: Some(1),
                takes_jersey_slot: true,
            }],
            influencer_contracts: vec![InfluencerContract {
                id: InfluencerContractId(uuid::Uuid::from_u128(1)),
                streamer: "Streamer".into(),
                duration_years: None,
                stream_revenue: None,
            }],
            finances: Finances {
                budget: None,
                wage_bill: None,
            },
            fan_base: FanBase {
                count: None,
                mood: Some(score(40)),
            },
        };
        let player = Player::try_new(
            PlayerIdentity {
                id: PlayerId(uuid::Uuid::from_u128(4)),
                name: "Mid".into(),
                role: Role::Mid,
                nationality: Some("FR".into()),
                birth_date: CalendarDate::parse("1993-04-24"),
                portrait: None,
                teams: vec![TeamId(uuid::Uuid::from_u128(1))],
                palmares: vec![PalmaresEntry {
                    award: "MVP".into(),
                    competition: "Split".into(),
                    year: 2014,
                }],
            },
            vec![PoolEntry {
                champion: champion.id,
                mastery: score(80),
            }],
            Some(Competencies {
                mechanics: score(50),
                teamfight: score(50),
                map_awareness: score(50),
                objectives: score(50),
                tempo: score(50),
                mental: score(50),
                itemisation: score(50),
                phases: PhaseScores {
                    early: score(40),
                    mid: score(60),
                    late: score(55),
                },
                shotcalling: score(30),
                role_skill: RoleSkill::Laning(score(70)),
            }),
            Some(PlayerState {
                form: score(60),
                fatigue: score(10),
            }),
            vec![Tag::Leader],
            vec![domain::PlayerAspiration::new(
                domain::AspirationType::RetirementAge,
                domain::AspirationValue::Age(28),
            )
            .unwrap()],
        )
        .unwrap();
        let team = Team {
            id: TeamId(uuid::Uuid::from_u128(1)),
            name: "Main".into(),
            organisation: organisation.id,
            roster: Roster {
                players: vec![player.identity.id],
            },
            registration: Some(SeasonRegistration {
                league: league.id,
                year: 2014,
            }),
            portrait: Some("portraits/wiki/Fnatic_original_logo.png".into()),
        };
        let coach = HeadCoach {
            identity: HeadCoachIdentity {
                id: CoachId(uuid::Uuid::from_u128(1)),
                name: "Coach".into(),
                nationality: "FR".into(),
                age: 35,
                teams: vec![team.id],
                palmares: vec![],
            },
            competencies: CoachCompetencies {
                draft: score(40),
                training: score(50),
                mental: score(60),
                macro_play: score(55),
                media: score(30),
            },
            reputation: score(20),
        };
        let staff = StaffMember {
            id: StaffId(uuid::Uuid::from_u128(1)),
            name: "Analyst".into(),
            role: StaffRole::Positional(domain::PositionalCoach { role: Role::Mid }),
            competencies: coach.competencies,
        };
        let presta = Presta {
            player: player.identity.id,
            champion: champion.id,
        };
        let patch = Patch {
            id: PatchId(uuid::Uuid::from_u128(1)),
            version: "4.1".into(),
            date: "2014-01-15".into(),
            champions: vec![ChampionOnPatch {
                champion: champion.id,
                roles: Some(RoleScores {
                    top: score(10),
                    jungle: score(5),
                    mid: score(90),
                    adc: score(0),
                    support: score(0),
                }),
                damage: Some(DamageSliders {
                    attack: score(20),
                    ability: score(80),
                    true_damage: score(0),
                }),
                tankiness: None,
            }],
            objectives: vec![ObjectiveEvent {
                name: "dragon".into(),
                reward: None,
                unlocks: vec![],
            }],
        };

        let mut organisation_without_teams = organisation.clone();
        organisation_without_teams.teams.clear();
        let mut team_without_roster = team.clone();
        team_without_roster.roster.players.clear();

        store.save_champion(&champion).unwrap();
        store.save_league(&league).unwrap();
        store.save_league_season(&season).unwrap();
        store.save_organisation(&organisation_without_teams).unwrap();
        store.save_team(&team_without_roster).unwrap();
        store.save_player(&player).unwrap();
        store.save_team(&team).unwrap();
        store.save_organisation(&organisation).unwrap();
        store.save_head_coach(&coach).unwrap();
        store.save_staff(&staff).unwrap();
        store.save_presta(&presta).unwrap();
        store.save_patch(&patch).unwrap();

        assert_eq!(store.load_champion(champion.id).unwrap(), champion);
        assert_eq!(store.load_league(league.id).unwrap(), league);
        assert_eq!(store.load_league_season(league.id, 2014).unwrap(), season);
        assert_eq!(store.load_organisation(organisation.id).unwrap(), organisation);
        assert_eq!(store.load_player(player.identity.id).unwrap(), player);
        assert_eq!(store.load_team(team.id).unwrap(), team);
        assert_eq!(store.load_head_coach(coach.identity.id).unwrap(), coach);
        assert_eq!(store.load_staff(staff.id).unwrap(), staff);
        assert_eq!(store.load_presta(presta.player, presta.champion).unwrap(), presta);
        assert_eq!(store.load_patch(patch.id).unwrap(), patch);
        let modifiers = store.aspiration_modifiers().unwrap();
        for kind in [
            domain::AspirationType::SatisfyingTitle,
            domain::AspirationType::RetirementAge,
            domain::AspirationType::WantsAgent,
        ] {
            let stored: Vec<_> = modifiers
                .iter()
                .filter(|modifier| modifier.0 == kind)
                .map(|modifier| (modifier.1, modifier.2.as_str()))
                .collect();
            let expected: Vec<_> = kind
                .effects()
                .iter()
                .copied()
                .map(|effect| (effect, effect.impact()))
                .collect();
            assert_eq!(stored, expected);
        }
    }

    #[test]
    fn file_store_reopens_the_same_champion() {
        let path = std::env::temp_dir().join(format!(
            "lol-manager-store-{}-{}.sqlite",
            std::process::id(),
            score(1).value()
        ));
        let _ = std::fs::remove_file(&path);
        let champion = Champion {
            id: ChampionId(uuid::Uuid::from_u128(1)),
            name: "Ahri".into(),
            portrait: None,
        };
        {
            let store = Store::open(&path).unwrap();
            store.save_champion(&champion).unwrap();
        }
        let store = Store::open(&path).unwrap();
        assert_eq!(store.load_champion(champion.id).unwrap(), champion);
        drop(store);
        let _ = std::fs::remove_file(&path);
        let _ = std::fs::remove_file(format!("{}-wal", path.display()));
        let _ = std::fs::remove_file(format!("{}-shm", path.display()));
    }

    #[test]
    fn seed_2014_leaves_unknown_sheets_empty() {
        let store = Store::memory().unwrap();
        store.apply_script(include_str!("../seed/2014.sql")).unwrap();
        assert_eq!(store.count("champions").unwrap(), 123);
        assert_eq!(store.list_champions().unwrap().len(), 123);
        assert_eq!(store.list_players().unwrap().len(), 761);
        assert_eq!(store.list_teams().unwrap().len(), 142);
        assert_eq!(store.list_leagues().unwrap().len(), 13);
        assert_eq!(store.list_organisations().unwrap().len(), 140);
        assert!(store.list_patches().unwrap().is_empty());
        let yasuo = ChampionId(store.id_named("champions", "Yasuo").unwrap());
        assert_eq!(store.load_champion(yasuo).unwrap().name, "Yasuo");
        assert_eq!(
            store.load_champion(yasuo).unwrap().portrait.as_deref(),
            Some("portraits/champions/Yasuo.png")
        );
        let eu = LeagueId(store.id_named("leagues", "EU LCS").unwrap());
        assert_eq!(
            store.load_league(eu).unwrap().portrait.as_deref(),
            Some("portraits/wiki/LCS_Europe_Logo.png")
        );
        assert_eq!(
            store.load_organisation(OrganisationId(store.id_named("organisations", "Edward Gaming").unwrap())).unwrap().region,
            "CN"
        );
        assert_eq!(
            store.load_organisation(OrganisationId(store.id_named("organisations", "SK Telecom T1 K").unwrap())).unwrap().region,
            "KR"
        );
        let fnatic = store.load_team(TeamId(store.id_named("teams", "Fnatic").unwrap())).unwrap();
        assert_eq!(fnatic.portrait.as_deref(), Some("portraits/wiki/Fnatic_original_logo.png"));
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "Faker").unwrap())).unwrap().identity.portrait.as_deref(),
            Some("portraits/wiki/Faker2014.jpg")
        );

        let sneaky = store.load_player(PlayerId(store.id_named("players", "Sneaky").unwrap())).unwrap();
        assert_eq!(sneaky.identity.name, "Sneaky");
        assert_eq!(sneaky.identity.role, Role::Adc);
        assert_eq!(sneaky.identity.nationality.as_deref(), Some("US"));
        assert_eq!(sneaky.identity.birth_date, CalendarDate::parse("1994-03-19"));
        assert_eq!(sneaky.identity.age_on(CalendarDate::CAREER_OPENING), Some(19));
        assert!(sneaky.competencies.is_none());
        assert!(sneaky.state.is_none());
        assert!(sneaky.aspirations.is_empty());

        let faker = store.load_player(PlayerId(store.id_named("players", "Faker").unwrap())).unwrap();
        assert_eq!(faker.identity.nationality.as_deref(), Some("KR"));
        assert_eq!(faker.identity.birth_date, CalendarDate::parse("1996-05-07"));
        assert_eq!(faker.identity.age_on(CalendarDate::CAREER_OPENING), Some(17));
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "FZZF").unwrap())).unwrap().identity.nationality.as_deref(),
            Some("CN")
        );
        assert_eq!(faker.identity.role, Role::Mid);
        assert_eq!(
            faker.identity.teams,
            vec![TeamId(store.id_named("teams", "SK Telecom T1 K").unwrap())]
        );

        let lpl = store.load_league(LeagueId(store.id_named("leagues", "LPL").unwrap())).unwrap();
        assert_eq!(lpl.region, "CN");
        assert_eq!(lpl.tier, LeagueTier::Primary);
        assert_eq!(lpl.presence, SeasonPresence::Playable);
        assert_eq!(store.load_league_season(lpl.id, 2014).unwrap().team_count, Some(8));
        assert_eq!(store.load_league_season(lpl.id, 2014).unwrap().worlds_slots, Some(3));
        let champions = store.load_league(LeagueId(store.id_named("leagues", "Champions").unwrap())).unwrap();
        assert_eq!(champions.region, "KR");
        assert_eq!(champions.presence, SeasonPresence::Playable);
        assert_eq!(store.load_league_season(champions.id, 2014).unwrap().team_count, Some(16));
        assert_eq!(store.load_league_season(champions.id, 2014).unwrap().worlds_slots, Some(3));
        let challenger = store.load_league(LeagueId(store.id_named("leagues", "EU Challenger Series").unwrap())).unwrap();
        assert_eq!(challenger.region, "EU");
        assert_eq!(challenger.tier, LeagueTier::Secondary);
        assert_eq!(challenger.presence, SeasonPresence::InWorld);
        assert_eq!(challenger.portrait.as_deref(), Some("portraits/wiki/CS_EU_logo.png"));
        let gpl = store.load_league(LeagueId(store.id_named("leagues", "GPL").unwrap())).unwrap();
        assert_eq!(gpl.region, "SEA");
        assert_eq!(gpl.presence, SeasonPresence::InWorld);
        let gpl_season = store.load_league_season(gpl.id, 2014).unwrap();
        assert_eq!(gpl_season.team_count, Some(12));
        assert_eq!(gpl_season.worlds_slots, Some(2));
        assert_eq!(gpl_season.msi_slots, 0);
        assert_eq!(
            store.load_team(TeamId(store.id_named("teams", "Edward Gaming").unwrap())).unwrap().registration,
            Some(SeasonRegistration { league: lpl.id, year: 2014 })
        );
        assert_eq!(
            store.load_team(TeamId(store.id_named("teams", "SK Telecom T1 K").unwrap())).unwrap().registration,
            Some(SeasonRegistration { league: champions.id, year: 2014 })
        );
        let bjergsen = store.load_player(PlayerId(store.id_named("players", "Bjergsen").unwrap())).unwrap();
        assert_eq!(bjergsen.identity.role, Role::Mid);
        assert_eq!(bjergsen.identity.nationality.as_deref(), Some("DK"));
        assert_eq!(bjergsen.identity.birth_date, CalendarDate::parse("1996-02-21"));
        assert_eq!(bjergsen.identity.age_on(CalendarDate::CAREER_OPENING), Some(17));
        assert!(bjergsen.competencies.is_none());
        let ahq = store.load_team(TeamId(store.id_named("teams", "ahq eSports Club").unwrap())).unwrap();
        assert_eq!(ahq.registration, Some(SeasonRegistration { league: gpl.id, year: 2014 }));
        assert_eq!(store.load_organisation(ahq.organisation).unwrap().region, "SEA");
        let odoamne = store.load_player(PlayerId(store.id_named("players", "Odoamne").unwrap())).unwrap();
        assert_eq!(odoamne.identity.role, Role::Top);
        assert_eq!(odoamne.identity.nationality.as_deref(), Some("RO"));
        assert_eq!(odoamne.identity.birth_date, CalendarDate::parse("1995-01-18"));
        assert_eq!(odoamne.identity.age_on(CalendarDate::CAREER_OPENING), Some(18));
        assert!(odoamne.competencies.is_none());
        assert_eq!(odoamne.identity.portrait.as_deref(), Some("portraits/wiki/H2K-Odaomne-2015spring.jpg"));
        assert_eq!(
            store.load_team(TeamId(store.id_named("teams", "Cloud9 Eclipse").unwrap())).unwrap().portrait.as_deref(),
            Some("portraits/wiki/Cloud9_Eclipselogo_profile.png")
        );
        let complexity = OrganisationId(store.id_named("organisations", "compLexity Gaming").unwrap());
        for name in ["compLexity.Black", "compLexity.Red", "compLexity Academy"] {
            assert_eq!(
                store.load_team(TeamId(store.id_named("teams", name).unwrap())).unwrap().organisation,
                complexity
            );
        }
        assert_eq!(
            store.load_team(TeamId(store.id_named("teams", "compLexity.Black").unwrap())).unwrap().portrait.as_deref(),
            Some("portraits/wiki/CoLBlack.png")
        );
        let vvv = OrganisationId(store.id_named("organisations", "vVv Gaming").unwrap());
        let white = store.load_team(TeamId(store.id_named("teams", "vVv Gaming White").unwrap())).unwrap();
        assert_eq!(white.organisation, vvv);
        assert_eq!(white.portrait.as_deref(), Some("portraits/wiki/VVv_Gaminglogo_square.png"));
        let ndd = store.load_player(PlayerId(store.id_named("players", "NdD").unwrap())).unwrap();
        assert_eq!(ndd.identity.role, Role::Jungle);
        assert_eq!(ndd.identity.teams, vec![TeamId(store.id_named("teams", "Bangkok Titans").unwrap())]);
        let robert = store.load_player(PlayerId(store.id_named("players", "RobertxLee").unwrap())).unwrap();
        assert_eq!(robert.identity.role, Role::Adc);
        assert_eq!(robert.identity.teams, vec![TeamId(store.id_named("teams", "compLexity.Black").unwrap())]);
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "Porky").unwrap())).unwrap().identity.teams,
            vec![TeamId(store.id_named("teams", "Lyon Gaming").unwrap())]
        );
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "nukeduck").unwrap())).unwrap().identity.teams,
            vec![TeamId(store.id_named("teams", "Ninjas in Pyjamas").unwrap())]
        );
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "goldenglue").unwrap())).unwrap().identity.teams,
            vec![TeamId(store.id_named("teams", "compLexity.Red").unwrap())]
        );
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "4zeer0").unwrap())).unwrap().identity.teams,
            vec![TeamId(store.id_named("teams", "BrawL eSports").unwrap())]
        );
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "BunnyFuFuu").unwrap())).unwrap().identity.teams,
            vec![TeamId(store.id_named("teams", "Challenger8").unwrap())]
        );
        let koukin = store.load_player(PlayerId(store.id_named("players", "Koukin").unwrap())).unwrap();
        assert_eq!(koukin.identity.role, Role::Adc);
        assert_eq!(koukin.identity.nationality.as_deref(), Some("EC"));
        assert_eq!(koukin.identity.birth_date, None);
        assert_eq!(koukin.identity.teams, vec![TeamId(store.id_named("teams", "Tesla Gaming").unwrap())]);
        assert_ne!(
            store.id_named("players", "NaMei").unwrap(),
            store.id_named("players", "NaMe1").unwrap()
        );
        assert_eq!(
            store.load_league(lpl.id).unwrap().portrait.as_deref(),
            Some("portraits/wiki/LPL.jpg")
        );
        assert_eq!(
            store.load_organisation(OrganisationId(store.id_named("organisations", "Alliance").unwrap())).unwrap().portrait.as_deref(),
            Some("portraits/wiki/AllianceOldlogo_square.png")
        );
        assert_eq!(
            store.load_player(PlayerId(store.id_named("players", "Froggen").unwrap())).unwrap().identity.portrait.as_deref(),
            Some("portraits/wiki/FroggenALL2014.png")
        );
    }
}
