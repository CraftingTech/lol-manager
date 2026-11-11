PRAGMA foreign_keys = ON;

CREATE TABLE champions (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE leagues (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL,
    tier TEXT NOT NULL,
    presence TEXT NOT NULL
);

CREATE TABLE league_seasons (
    league_id INTEGER NOT NULL,
    year INTEGER NOT NULL,
    team_count INTEGER,
    msi_slots INTEGER NOT NULL,
    worlds_slots INTEGER,
    salary_cap_kind TEXT,
    salary_cap_amount INTEGER,
    PRIMARY KEY (league_id, year),
    FOREIGN KEY (league_id) REFERENCES leagues (id)
);

CREATE TABLE split_formats (
    league_id INTEGER NOT NULL,
    year INTEGER NOT NULL,
    position INTEGER NOT NULL,
    name TEXT NOT NULL,
    series TEXT NOT NULL,
    PRIMARY KEY (league_id, year, position),
    FOREIGN KEY (league_id, year) REFERENCES league_seasons (league_id, year)
);

CREATE TABLE organisations (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL,
    history TEXT NOT NULL,
    staff_seats INTEGER NOT NULL,
    scrim_room INTEGER NOT NULL,
    gaming_house INTEGER NOT NULL,
    chef INTEGER NOT NULL,
    jersey_name TEXT NOT NULL,
    budget INTEGER,
    wage_bill INTEGER,
    fan_count INTEGER,
    fan_mood INTEGER NOT NULL
);

CREATE TABLE teams (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    organisation_id INTEGER NOT NULL,
    league_id INTEGER,
    season_year INTEGER,
    FOREIGN KEY (organisation_id) REFERENCES organisations (id)
);

CREATE TABLE organisation_teams (
    organisation_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    PRIMARY KEY (organisation_id, position),
    FOREIGN KEY (organisation_id) REFERENCES organisations (id),
    FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE players (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    nationality TEXT NOT NULL,
    age INTEGER NOT NULL,
    mechanics INTEGER NOT NULL,
    teamfight INTEGER NOT NULL,
    map_awareness INTEGER NOT NULL,
    objectives INTEGER NOT NULL,
    tempo INTEGER NOT NULL,
    mental INTEGER NOT NULL,
    itemisation INTEGER NOT NULL,
    phase_early INTEGER NOT NULL,
    phase_mid INTEGER NOT NULL,
    phase_late INTEGER NOT NULL,
    shotcalling INTEGER NOT NULL,
    role_skill_kind TEXT NOT NULL,
    role_skill_score INTEGER NOT NULL,
    form INTEGER NOT NULL,
    fatigue INTEGER NOT NULL
);

CREATE TABLE aspiration_types (
    code TEXT PRIMARY KEY
);

INSERT INTO aspiration_types (code) VALUES
    ('satisfying_title'),
    ('retirement_age'),
    ('wants_agent');

CREATE TABLE aspiration_modifiers (
    aspiration_type TEXT NOT NULL,
    effect TEXT NOT NULL,
    impact TEXT NOT NULL CHECK (length(impact) > 0),
    PRIMARY KEY (aspiration_type, effect),
    FOREIGN KEY (aspiration_type) REFERENCES aspiration_types (code)
);

INSERT INTO aspiration_modifiers (aspiration_type, effect, impact) VALUES
    (
        'satisfying_title',
        'compares_to_palmares',
        'Se compare au palmarès. Un titre déjà obtenu satisfait l''aspiration. Aucun bonus de match.'
    ),
    (
        'satisfying_title',
        'weighs_on_signing',
        'Pèse sur l''envie de signer ou de renouveler. N''écrit pas le montant.'
    ),
    (
        'retirement_age',
        'closes_contract',
        'Quand l''âge du joueur atteint cette valeur, le contrat se ferme et il redevient libre.'
    ),
    (
        'retirement_age',
        'weighs_on_signing',
        'Pèse sur l''envie de signer ou de renouveler. N''écrit pas le montant.'
    ),
    (
        'wants_agent',
        'talk_through_agent',
        'La discussion de contrat passe par un agent. Aucun personnage d''agent n''est créé.'
    ),
    (
        'wants_agent',
        'weighs_on_signing',
        'Pèse sur l''envie de signer ou de renouveler. N''écrit pas le montant.'
    );

CREATE TABLE player_aspirations (
    player_id INTEGER NOT NULL,
    aspiration_type TEXT NOT NULL,
    title TEXT,
    age INTEGER,
    decision INTEGER,
    PRIMARY KEY (player_id, aspiration_type),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (aspiration_type) REFERENCES aspiration_types (code),
    CHECK (
        (aspiration_type = 'satisfying_title' AND title IS NOT NULL AND age IS NULL AND decision IS NULL)
        OR (aspiration_type = 'retirement_age' AND age IS NOT NULL AND title IS NULL AND decision IS NULL)
        OR (aspiration_type = 'wants_agent' AND decision IS NOT NULL AND title IS NULL AND age IS NULL)
    )
);

CREATE TABLE player_teams (
    player_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    PRIMARY KEY (player_id, position),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE player_palmares (
    player_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    award TEXT NOT NULL,
    competition TEXT NOT NULL,
    year INTEGER NOT NULL,
    PRIMARY KEY (player_id, position),
    FOREIGN KEY (player_id) REFERENCES players (id)
);

CREATE TABLE player_pool (
    player_id INTEGER NOT NULL,
    champion_id INTEGER NOT NULL,
    mastery INTEGER NOT NULL,
    PRIMARY KEY (player_id, champion_id),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (champion_id) REFERENCES champions (id)
);

CREATE TABLE player_tags (
    player_id INTEGER NOT NULL,
    tag TEXT NOT NULL,
    PRIMARY KEY (player_id, tag),
    FOREIGN KEY (player_id) REFERENCES players (id)
);

CREATE TABLE roster_players (
    team_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    player_id INTEGER NOT NULL,
    PRIMARY KEY (team_id, position),
    FOREIGN KEY (team_id) REFERENCES teams (id),
    FOREIGN KEY (player_id) REFERENCES players (id)
);

CREATE TABLE head_coaches (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    nationality TEXT NOT NULL,
    age INTEGER NOT NULL,
    reputation INTEGER NOT NULL,
    draft INTEGER NOT NULL,
    training INTEGER NOT NULL,
    mental INTEGER NOT NULL,
    macro_play INTEGER NOT NULL,
    media INTEGER NOT NULL
);

CREATE TABLE coach_teams (
    coach_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    PRIMARY KEY (coach_id, position),
    FOREIGN KEY (coach_id) REFERENCES head_coaches (id),
    FOREIGN KEY (team_id) REFERENCES teams (id)
);

CREATE TABLE coach_palmares (
    coach_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    award TEXT NOT NULL,
    competition TEXT NOT NULL,
    year INTEGER NOT NULL,
    PRIMARY KEY (coach_id, position),
    FOREIGN KEY (coach_id) REFERENCES head_coaches (id)
);

CREATE TABLE sponsors (
    id INTEGER PRIMARY KEY,
    organisation_id INTEGER NOT NULL,
    payer TEXT NOT NULL,
    amount INTEGER,
    duration_years INTEGER,
    takes_jersey_slot INTEGER NOT NULL,
    FOREIGN KEY (organisation_id) REFERENCES organisations (id)
);

CREATE TABLE influencer_contracts (
    id INTEGER PRIMARY KEY,
    organisation_id INTEGER NOT NULL,
    streamer TEXT NOT NULL,
    duration_years INTEGER,
    stream_revenue INTEGER,
    FOREIGN KEY (organisation_id) REFERENCES organisations (id)
);

CREATE TABLE staff_members (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    positional_role TEXT,
    draft INTEGER NOT NULL,
    training INTEGER NOT NULL,
    mental INTEGER NOT NULL,
    macro_play INTEGER NOT NULL,
    media INTEGER NOT NULL
);

CREATE TABLE prestas (
    player_id INTEGER NOT NULL,
    champion_id INTEGER NOT NULL,
    PRIMARY KEY (player_id, champion_id),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (champion_id) REFERENCES champions (id)
);

CREATE TABLE patches (
    id INTEGER PRIMARY KEY,
    version TEXT NOT NULL,
    date TEXT NOT NULL
);

CREATE TABLE champion_on_patch (
    patch_id INTEGER NOT NULL,
    champion_id INTEGER NOT NULL,
    top INTEGER,
    jungle INTEGER,
    mid INTEGER,
    adc INTEGER,
    support INTEGER,
    attack INTEGER,
    ability INTEGER,
    true_damage INTEGER,
    health INTEGER,
    armor INTEGER,
    magic_resist INTEGER,
    PRIMARY KEY (patch_id, champion_id),
    FOREIGN KEY (patch_id) REFERENCES patches (id),
    FOREIGN KEY (champion_id) REFERENCES champions (id)
);

CREATE TABLE objective_events (
    patch_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    name TEXT NOT NULL,
    reward TEXT,
    PRIMARY KEY (patch_id, position),
    FOREIGN KEY (patch_id) REFERENCES patches (id)
);

CREATE TABLE objective_unlocks (
    patch_id INTEGER NOT NULL,
    objective_position INTEGER NOT NULL,
    unlock_position INTEGER NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (patch_id, objective_position, unlock_position),
    FOREIGN KEY (patch_id, objective_position) REFERENCES objective_events (patch_id, position)
);

CREATE INDEX teams_organisation ON teams (organisation_id);
CREATE INDEX teams_registration ON teams (league_id, season_year);
CREATE INDEX organisation_teams_team ON organisation_teams (team_id);
CREATE INDEX player_teams_team ON player_teams (team_id);
CREATE INDEX player_pool_champion ON player_pool (champion_id);
CREATE INDEX roster_players_player ON roster_players (player_id);
CREATE INDEX coach_teams_team ON coach_teams (team_id);
CREATE INDEX sponsors_organisation ON sponsors (organisation_id);
CREATE INDEX influencer_contracts_organisation ON influencer_contracts (organisation_id);
CREATE INDEX prestas_champion ON prestas (champion_id);
CREATE INDEX champion_on_patch_champion ON champion_on_patch (champion_id);
