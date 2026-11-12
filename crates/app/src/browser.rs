use std::collections::HashMap;
use std::path::PathBuf;

use domain::{
    CalendarDate, Champion, ChampionOnPatch, League, LeagueId, LeagueSeason, LeagueTier, Organisation,
    OrganisationId, Patch, Player, Role, RoleSkill, Score, SeasonPresence, Team, TeamId,
};
use std::ops::Range;

use gpui::{
    div, img, point, prelude::*, px, rgb, uniform_list, ListHorizontalSizingBehavior, MouseButton,
    UniformListScrollHandle, Window,
};

const CANVAS: u32 = 0x12141a;
const SIDEBAR: u32 = 0x1b1e27;
const PANEL: u32 = 0x161922;
const ROW: u32 = 0x1e2430;
const SELECTED: u32 = 0x2c4060;
const LINE: u32 = 0x2e3544;
const TEXT: u32 = 0xe8e6e3;
const MUTED: u32 = 0x8b93a7;
const GOLD: u32 = 0xc8a15a;

#[derive(Clone)]
pub struct Catalog {
    pub champions: Vec<Champion>,
    pub leagues: Vec<League>,
    pub organisations: Vec<Organisation>,
    pub teams: Vec<Team>,
    pub players: Vec<Player>,
    pub patches: Vec<Patch>,
    pub seasons: HashMap<LeagueId, LeagueSeason>,
    pub team_names: HashMap<TeamId, String>,
    pub organisation_names: HashMap<OrganisationId, String>,
    pub league_names: HashMap<LeagueId, String>,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Section {
    Champions,
    Teams,
    Players,
    Leagues,
    Organisations,
}

impl Section {
    fn label(self) -> &'static str {
        match self {
            Self::Champions => "Champions",
            Self::Teams => "Équipes",
            Self::Players => "Joueurs",
            Self::Leagues => "Ligues",
            Self::Organisations => "Organisations",
        }
    }

    fn headers(self) -> &'static [(&'static str, f32)] {
        match self {
            Self::Champions => &[
                ("Nom", 188.0),
                ("Top", 52.0),
                ("Jungle", 64.0),
                ("Mid", 48.0),
                ("ADC", 48.0),
                ("Support", 72.0),
                ("AD", 44.0),
                ("AP", 44.0),
                ("Brut", 52.0),
                ("PV", 44.0),
                ("Armure", 64.0),
                ("RM", 44.0),
            ],
            Self::Teams => &[
                ("Nom", 200.0),
                ("Organisation", 160.0),
                ("Région", 70.0),
                ("Ligue", 120.0),
                ("Effectif", 70.0),
            ],
            Self::Players => &[
                ("Nom", 188.0),
                ("Rôle", 72.0),
                ("Nat.", 48.0),
                ("Âge", 40.0),
                ("Équipe", 140.0),
                ("Mécanique", 88.0),
                ("Teamfight", 80.0),
                ("Map", 48.0),
                ("Objectifs", 80.0),
                ("Tempo", 60.0),
                ("Mental", 64.0),
                ("Items", 56.0),
                ("Early", 52.0),
                ("Mid", 44.0),
                ("Late", 48.0),
                ("Shotcall", 76.0),
                ("Lane/path", 80.0),
            ],
            Self::Leagues => &[
                ("Nom", 180.0),
                ("Région", 70.0),
                ("Niveau", 110.0),
                ("Présence", 120.0),
            ],
            Self::Organisations => &[("Nom", 200.0), ("Région", 70.0), ("Équipes", 70.0)],
        }
    }

    fn all() -> [Self; 5] {
        [
            Self::Champions,
            Self::Teams,
            Self::Players,
            Self::Leagues,
            Self::Organisations,
        ]
    }

    fn index(self) -> usize {
        match self {
            Self::Champions => 0,
            Self::Teams => 1,
            Self::Players => 2,
            Self::Leagues => 3,
            Self::Organisations => 4,
        }
    }
}

pub struct Browser {
    catalog: Result<Catalog, String>,
    assets: PathBuf,
    section: Section,
    selected: Option<usize>,
    scroll: UniformListScrollHandle,
}

impl Browser {
    pub fn new(catalog: Result<Catalog, String>, assets: PathBuf) -> Self {
        Self {
            catalog,
            assets,
            section: Section::Players,
            selected: None,
            scroll: UniformListScrollHandle::new(),
        }
    }

    fn count(&self, section: Section) -> usize {
        let Ok(catalog) = &self.catalog else {
            return 0;
        };
        match section {
            Section::Champions => catalog.champions.len(),
            Section::Teams => catalog.teams.len(),
            Section::Players => catalog.players.len(),
            Section::Leagues => catalog.leagues.len(),
            Section::Organisations => catalog.organisations.len(),
        }
    }
}

impl Render for Browser {
    fn render(&mut self, _window: &mut Window, cx: &mut Context<Self>) -> impl IntoElement {
        let mut sidebar = div()
            .w(px(220.0))
            .flex_none()
            .h_full()
            .flex()
            .flex_col()
            .bg(rgb(SIDEBAR))
            .border_r_1()
            .border_color(rgb(LINE))
            .px_3()
            .py_4()
            .gap_1()
            .child(label("LoL Manager", GOLD, true))
            .child(label("Saison 2014", MUTED, false));

        for section in Section::all() {
            let active = self.section == section;
            let count = self.count(section);
            sidebar = sidebar.child(
                div()
                    .mt_1()
                    .px_2()
                    .py_1()
                    .rounded_md()
                    .bg(rgb(if active { SELECTED } else { SIDEBAR }))
                    .flex()
                    .justify_between()
                    .items_center()
                    .child(label(section.label(), if active { TEXT } else { MUTED }, active))
                    .child(label(count.to_string(), MUTED, false))
                    .on_mouse_down(
                        MouseButton::Left,
                        cx.listener(move |this, _, _, cx| {
                            this.section = section;
                            this.selected = None;
                            this.scroll
                                .0
                                .borrow()
                                .base_handle
                                .set_offset(point(px(0.0), px(0.0)));
                            cx.notify();
                        }),
                    ),
            );
        }

        let mut screen = div()
            .relative()
            .size_full()
            .overflow_hidden()
            .flex()
            .bg(rgb(CANVAS))
            .text_color(rgb(TEXT))
            .child(sidebar)
            .child(self.table(cx));
        if self.selected.is_some() {
            screen = screen.child(self.detail(cx));
        }
        screen
    }
}

impl Browser {
    fn table(&self, cx: &mut Context<Self>) -> impl IntoElement {
        let section = self.section;
        let width = sheet_width(section.headers());
        let scroll_x = self.scroll.0.borrow().base_handle.offset().x;
        let mut frame = div()
            .flex_1()
            .min_w_0()
            .min_h_0()
            .h_full()
            .overflow_hidden()
            .flex()
            .flex_col();
        if self.selected.is_some() {
            frame = frame.pr(px(340.0));
        }
        frame
            .child(
                div()
                    .h(px(36.0))
                    .w_full()
                    .flex_shrink_0()
                    .overflow_hidden()
                    .bg(rgb(PANEL))
                    .border_b_1()
                    .border_color(rgb(LINE))
                    .child(
                        div()
                            .ml(scroll_x)
                            .h_full()
                            .w_full()
                            .min_w(px(width))
                            .px(px(16.0))
                            .flex()
                            .items_center()
                            .child(headed(section.headers())),
                    ),
            )
            .child(match &self.catalog {
                Err(error) => div().p_4().child(label(error, MUTED, false)).into_any_element(),
                Ok(_) => uniform_list(
                    ("roster", section.index()),
                    self.count(section),
                    cx.processor(|this, range: Range<usize>, _, cx| {
                        range.map(|index| this.line(index, cx)).collect::<Vec<_>>()
                    }),
                )
                .track_scroll(self.scroll.clone())
                .with_horizontal_sizing_behavior(ListHorizontalSizingBehavior::Unconstrained)
                .flex_1()
                .w_full()
                .into_any_element(),
            })
    }

    fn line(&self, index: usize, cx: &mut Context<Self>) -> impl IntoElement {
        let selected = self.selected == Some(index);
        let cells = self.line_cells(index);
        div()
            .id(("row", index))
            .h(px(32.0))
            .w_full()
            .min_w(px(sheet_width(self.section.headers())))
            .px(px(16.0))
            .flex()
            .flex_shrink_0()
            .items_center()
            .bg(rgb(if selected { SELECTED } else if index % 2 == 0 { ROW } else { CANVAS }))
            .children(cells.into_iter().enumerate().zip(self.section.headers()).map(
                |(cell, (_, width))| {
                    let (cell_index, value) = cell;
                    let mut slot = div()
                        .w(px(*width))
                        .flex_shrink_0()
                        .h(px(28.0))
                        .overflow_hidden()
                        .flex()
                        .items_center()
                        .gap(px(8.0));
                    if cell_index == 0 {
                        if let Some(path) = self.portrait_file(index) {
                            slot = slot.child(img(path).w(px(24.0)).h(px(24.0)));
                        }
                    }
                    if cell_index + 1 < self.section.headers().len() {
                        slot = slot.mr(px(16.0));
                    }
                    slot.child(cell_text(value))
                },
            ))
            .on_mouse_down(
                MouseButton::Left,
                cx.listener(move |this, _, _, cx| {
                    this.selected = Some(index);
                    cx.notify();
                }),
            )
    }

    fn line_cells(&self, index: usize) -> Vec<String> {
        let Ok(catalog) = &self.catalog else {
            return Vec::new();
        };
        match self.section {
            Section::Champions => {
                let Some(champion) = catalog.champions.get(index) else {
                    return Vec::new();
                };
                let mut cells = vec![champion.name.clone()];
                cells.extend(champion_sliders(kit(catalog, champion.id)));
                cells
            }
            Section::Teams => {
                let Some(team) = catalog.teams.get(index) else {
                    return Vec::new();
                };
                let organisation = catalog
                    .organisation_names
                    .get(&team.organisation)
                    .cloned()
                    .unwrap_or_else(|| "—".into());
                let league = team
                    .registration
                    .and_then(|registration| catalog.league_names.get(&registration.league))
                    .cloned()
                    .unwrap_or_else(|| "—".into());
                vec![
                    team.name.clone(),
                    organisation,
                    organisation_region(catalog, team.organisation),
                    league,
                    players_of(catalog, team.id).len().to_string(),
                ]
            }
            Section::Players => {
                let Some(player) = catalog.players.get(index) else {
                    return Vec::new();
                };
                let team = player
                    .identity
                    .teams
                    .first()
                    .and_then(|id| catalog.team_names.get(id))
                    .cloned()
                    .unwrap_or_else(|| "—".into());
                vec![
                    player.identity.name.clone(),
                    role_label(player.identity.role).into(),
                    blank(player.identity.nationality.as_deref()),
                    shown_age(player),
                    team,
                ]
                .into_iter()
                .chain(player_sliders(player))
                .collect()
            }
            Section::Leagues => {
                let Some(league) = catalog.leagues.get(index) else {
                    return Vec::new();
                };
                vec![
                    league.name.clone(),
                    blank(some_text(&league.region)),
                    match league.tier {
                        LeagueTier::Primary => "Principale".into(),
                        LeagueTier::Secondary => "Secondaire".into(),
                    },
                    match league.presence {
                        SeasonPresence::Playable => "Jouable".into(),
                        SeasonPresence::InWorld => "Dans le monde".into(),
                    },
                ]
            }
            Section::Organisations => {
                let Some(org) = catalog.organisations.get(index) else {
                    return Vec::new();
                };
                vec![
                    org.name.clone(),
                    blank(some_text(&org.region)),
                    org.teams.len().to_string(),
                ]
            }
        }
    }

    fn detail(&self, cx: &mut Context<Self>) -> impl IntoElement {
        let lines = self.detail_lines();
        let mut panel = div()
            .absolute()
            .top_0()
            .right_0()
            .bottom_0()
            .w(px(340.0))
            .max_w_full()
            .flex_none()
            .flex()
            .flex_col()
            .bg(rgb(PANEL))
            .border_l_1()
            .border_color(rgb(LINE))
            .px_4()
            .py_4()
            .gap_2()
            .id("fiche")
            .overflow_y_scroll()
            .child(
                div()
                    .flex()
                    .justify_between()
                    .items_center()
                    .child(label("Fiche", GOLD, true))
                    .child(
                        div()
                            .id("close-fiche")
                            .px_2()
                            .py_1()
                            .cursor_pointer()
                            .child(label("Fermer", MUTED, false))
                            .on_mouse_down(
                                MouseButton::Left,
                                cx.listener(|this, _, _, cx| {
                                    this.selected = None;
                                    cx.notify();
                                }),
                            ),
                    ),
            );
        if let Some(path) = self.selected.and_then(|index| self.portrait_file(index)) {
            panel = panel.child(img(path).w(px(72.0)).h(px(72.0)));
        }
        for (title, value) in lines {
            panel = panel.child(
                div()
                    .flex()
                    .flex_col()
                    .gap_0()
                    .child(label(title, MUTED, false))
                    .child(label(value, TEXT, false)),
            );
        }
        panel
    }

    fn portrait_file(&self, index: usize) -> Option<PathBuf> {
        let catalog = self.catalog.as_ref().ok()?;
        let relative = match self.section {
            Section::Champions => catalog.champions.get(index)?.portrait.clone(),
            Section::Players => catalog.players.get(index)?.identity.portrait.clone(),
            Section::Teams => catalog.teams.get(index)?.portrait.clone(),
            Section::Leagues => catalog.leagues.get(index)?.portrait.clone(),
            Section::Organisations => catalog.organisations.get(index)?.portrait.clone(),
        }?;
        let path = self.assets.join(relative);
        path.is_file().then_some(path)
    }

    fn detail_lines(&self) -> Vec<(&'static str, String)> {
        let Ok(catalog) = &self.catalog else {
            return vec![("Base", "illisible".into())];
        };
        let Some(index) = self.selected else {
            return vec![("Sélection", "Choisis une ligne.".into())];
        };
        match self.section {
            Section::Champions => {
                let Some(champion) = catalog.champions.get(index) else {
                    return Vec::new();
                };
                let mut lines = vec![
                    ("Nom", champion.name.clone()),
                    ("Photo", photo_label(champion.portrait.as_deref())),
                    ("Identifiant", champion.id.0.to_string()),
                    ("Patch", patch_label(catalog, champion.id)),
                ];
                lines.extend(named_sliders(&CHAMPION_SLIDERS, &champion_sliders(kit(catalog, champion.id))));
                lines
            }
            Section::Players => {
                let Some(player) = catalog.players.get(index) else {
                    return Vec::new();
                };
                let team = player
                    .identity
                    .teams
                    .first()
                    .and_then(|id| catalog.team_names.get(id))
                    .cloned()
                    .unwrap_or_else(|| "—".into());
                let mut lines = vec![
                    ("Nom", player.identity.name.clone()),
                    ("Rôle", role_label(player.identity.role).into()),
                    ("Nationalité", blank(player.identity.nationality.as_deref())),
                    ("Naissance", shown_birth(player)),
                    ("Âge", shown_age(player)),
                    ("Équipe", team),
                    ("Photo", photo_label(player.identity.portrait.as_deref())),
                ];
                lines.extend(named_sliders(&PLAYER_SLIDERS, &player_sliders(player)));
                lines.extend([
                    ("Forme", score_text(player.state.map(|state| state.form))),
                    ("Fatigue", score_text(player.state.map(|state| state.fatigue))),
                    ("Pool", count_or_empty(player.pool.len())),
                    ("Tags", count_or_empty(player.tags.len())),
                    ("Aspirations", count_or_empty(player.aspirations.len())),
                    ("Identifiant", player.identity.id.0.to_string()),
                ]);
                lines
            }
            Section::Teams => {
                let Some(team) = catalog.teams.get(index) else {
                    return Vec::new();
                };
                let organisation = catalog
                    .organisation_names
                    .get(&team.organisation)
                    .cloned()
                    .unwrap_or_else(|| "—".into());
                let league = team
                    .registration
                    .map(|registration| {
                        let name = catalog
                            .league_names
                            .get(&registration.league)
                            .cloned()
                            .unwrap_or_else(|| "—".into());
                        format!("{name} {}", registration.year)
                    })
                    .unwrap_or_else(|| "non renseigné".into());
                let roster = players_of(catalog, team.id)
                    .into_iter()
                    .map(|player| player.identity.name.clone())
                    .collect::<Vec<_>>()
                    .join(", ");
                vec![
                    ("Nom", team.name.clone()),
                    ("Photo", photo_label(team.portrait.as_deref())),
                    ("Organisation", organisation),
                    ("Région", organisation_region(catalog, team.organisation)),
                    ("Inscription", league),
                    ("Effectif", if roster.is_empty() { "vide".into() } else { roster }),
                    ("Identifiant", team.id.0.to_string()),
                ]
            }
            Section::Leagues => {
                let Some(league) = catalog.leagues.get(index) else {
                    return Vec::new();
                };
                let season = catalog.seasons.get(&league.id);
                vec![
                    ("Nom", league.name.clone()),
                    ("Photo", photo_label(league.portrait.as_deref())),
                    ("Région", blank(some_text(&league.region))),
                    (
                        "Équipes 2014",
                        season
                            .and_then(|season| season.team_count)
                            .map(|count| count.to_string())
                            .unwrap_or_else(|| "—".into()),
                    ),
                    (
                        "Places MSI",
                        season.map(|season| season.msi_slots.to_string()).unwrap_or_else(|| "—".into()),
                    ),
                    (
                        "Places Worlds",
                        season
                            .and_then(|season| season.worlds_slots)
                            .map(|slots| slots.to_string())
                            .unwrap_or_else(|| "non renseigné".into()),
                    ),
                    ("Identifiant", league.id.0.to_string()),
                ]
            }
            Section::Organisations => {
                let Some(org) = catalog.organisations.get(index) else {
                    return Vec::new();
                };
                vec![
                    ("Nom", org.name.clone()),
                    ("Photo", photo_label(org.portrait.as_deref())),
                    ("Région", blank(some_text(&org.region))),
                    ("Sièges staff", shown(org.staff_seats)),
                    ("Locaux", presence(org.locaux.is_some())),
                    ("Maillot", org.jersey.as_ref().map(|jersey| jersey.name.clone()).unwrap_or_else(|| "non renseigné".into())),
                    ("Budget", shown(org.finances.budget)),
                    ("Masse salariale", shown(org.finances.wage_bill)),
                    ("Fans", shown(org.fan_base.count)),
                    ("Identifiant", org.id.0.to_string()),
                ]
            }
        }
    }
}

fn sheet_width(headers: &[(&str, f32)]) -> f32 {
    let columns: f32 = headers.iter().map(|(_, width)| *width).sum();
    32.0 + columns + 16.0 * headers.len().saturating_sub(1) as f32
}

fn headed(titles: &[(&str, f32)]) -> impl IntoElement {
    div().flex().flex_shrink_0().children(titles.iter().copied().enumerate().map(|(index, (title, width))| {
        let mut cell = div().w(px(width)).flex_shrink_0().overflow_hidden();
        if index + 1 < titles.len() {
            cell = cell.mr(px(16.0));
        }
        cell.child(label(title, MUTED, false))
    }))
}

fn cell_text(value: String) -> impl IntoElement {
    label(value, TEXT, false)
}

fn label(value: impl AsRef<str>, color: u32, strong: bool) -> impl IntoElement {
    let text = div().text_color(rgb(color)).child(value.as_ref().to_string());
    if strong { text.text_sm() } else { text.text_xs() }
}

fn photo_label(path: Option<&str>) -> String {
    path.map(str::to_string).unwrap_or_else(|| "sans photo".into())
}

fn players_of(catalog: &Catalog, team: TeamId) -> Vec<&Player> {
    catalog
        .players
        .iter()
        .filter(|player| player.identity.teams.contains(&team))
        .collect()
}

const PLAYER_SLIDERS: [&str; 12] = [
    "Mécanique",
    "Teamfight",
    "Map awareness",
    "Objectifs",
    "Tempo",
    "Mental",
    "Itemisation",
    "Early",
    "Mid",
    "Late",
    "Shotcalling",
    "Lane / path",
];

const CHAMPION_SLIDERS: [&str; 11] = [
    "Top",
    "Jungle",
    "Mid",
    "ADC",
    "Support",
    "AD",
    "AP",
    "Brut",
    "PV",
    "Armure",
    "Résist. magique",
];

fn player_sliders(player: &Player) -> Vec<String> {
    let sheet = player.competencies;
    vec![
        score_text(sheet.map(|sheet| sheet.mechanics)),
        score_text(sheet.map(|sheet| sheet.teamfight)),
        score_text(sheet.map(|sheet| sheet.map_awareness)),
        score_text(sheet.map(|sheet| sheet.objectives)),
        score_text(sheet.map(|sheet| sheet.tempo)),
        score_text(sheet.map(|sheet| sheet.mental)),
        score_text(sheet.map(|sheet| sheet.itemisation)),
        score_text(sheet.map(|sheet| sheet.phases.early)),
        score_text(sheet.map(|sheet| sheet.phases.mid)),
        score_text(sheet.map(|sheet| sheet.phases.late)),
        score_text(sheet.map(|sheet| sheet.shotcalling)),
        score_text(sheet.map(|sheet| role_skill_score(sheet.role_skill))),
    ]
}

fn champion_sliders(on_patch: Option<&ChampionOnPatch>) -> Vec<String> {
    let roles = on_patch.and_then(|row| row.roles);
    let damage = on_patch.and_then(|row| row.damage);
    let tankiness = on_patch.and_then(|row| row.tankiness);
    vec![
        score_text(roles.map(|roles| roles.top)),
        score_text(roles.map(|roles| roles.jungle)),
        score_text(roles.map(|roles| roles.mid)),
        score_text(roles.map(|roles| roles.adc)),
        score_text(roles.map(|roles| roles.support)),
        score_text(damage.map(|damage| damage.attack)),
        score_text(damage.map(|damage| damage.ability)),
        score_text(damage.map(|damage| damage.true_damage)),
        score_text(tankiness.map(|tankiness| tankiness.health)),
        score_text(tankiness.map(|tankiness| tankiness.armor)),
        score_text(tankiness.map(|tankiness| tankiness.magic_resist)),
    ]
}

fn kit<'a>(catalog: &'a Catalog, champion: domain::ChampionId) -> Option<&'a ChampionOnPatch> {
    catalog.patches.iter().rev().find_map(|patch| {
        patch.champions.iter().find(|row| row.champion == champion)
    })
}

fn patch_label(catalog: &Catalog, champion: domain::ChampionId) -> String {
    catalog
        .patches
        .iter()
        .rev()
        .find(|patch| patch.champions.iter().any(|row| row.champion == champion))
        .map(|patch| format!("{} ({})", patch.version, patch.date))
        .unwrap_or_else(|| "aucun".into())
}

fn named_sliders(names: &'static [&'static str], values: &[String]) -> Vec<(&'static str, String)> {
    names.iter().copied().zip(values.iter().cloned()).collect()
}

fn role_skill_score(skill: RoleSkill) -> Score {
    match skill {
        RoleSkill::Laning(score) | RoleSkill::Pathing(score) => score,
    }
}

fn score_text(score: Option<Score>) -> String {
    score.map(|score| score.value().to_string()).unwrap_or_else(|| "—".into())
}

fn role_label(role: Role) -> &'static str {
    match role {
        Role::Top => "Top",
        Role::Jungle => "Jungle",
        Role::Mid => "Mid",
        Role::Adc => "ADC",
        Role::Support => "Support",
    }
}

fn organisation_region(catalog: &Catalog, id: OrganisationId) -> String {
    catalog
        .organisations
        .iter()
        .find(|organisation| organisation.id == id)
        .map(|organisation| blank(some_text(&organisation.region)))
        .unwrap_or_else(|| "—".into())
}

fn shown_birth(player: &Player) -> String {
    player
        .identity
        .birth_date
        .map(|date| date.to_iso())
        .unwrap_or_else(|| "—".into())
}

fn shown_age(player: &Player) -> String {
    player
        .identity
        .age_on(CalendarDate::CAREER_OPENING)
        .map(|age| age.to_string())
        .unwrap_or_else(|| "—".into())
}

fn blank(value: Option<&str>) -> String {
    value.filter(|text| !text.is_empty()).unwrap_or("—").to_string()
}

fn some_text(value: &str) -> Option<&str> {
    if value.is_empty() { None } else { Some(value) }
}

fn presence(present: bool) -> String {
    if present { "renseigné".into() } else { "non renseigné".into() }
}

fn count_or_empty(count: usize) -> String {
    if count == 0 { "vide".into() } else { count.to_string() }
}

fn shown<T: ToString>(value: Option<T>) -> String {
    value.map(|item| item.to_string()).unwrap_or_else(|| "non renseigné".into())
}
