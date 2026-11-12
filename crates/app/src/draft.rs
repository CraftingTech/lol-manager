use std::time::Instant;

use domain::{
    play, Building, ChampionId, ChampionOnPatch, Competencies, DamageSliders, EventKind, GamePlan,
    KitProfile, Lane, MatchInput, MatchupPlan, PhaseScores, PlayedMatch, Player, PlayerAction,
    PlayerInput, PlayerState, ReportLine, Role, RoleScores, RoleSkill, Score, Side, SideInput,
    TankinessSliders,
};
use gpui::Window;

pub const SCRIPT: [Turn; 16] = [
    Turn::Ban(DraftSide::Blue),
    Turn::Ban(DraftSide::Red),
    Turn::Ban(DraftSide::Blue),
    Turn::Ban(DraftSide::Red),
    Turn::Ban(DraftSide::Blue),
    Turn::Ban(DraftSide::Red),
    Turn::Pick(DraftSide::Blue, Role::Top),
    Turn::Pick(DraftSide::Red, Role::Top),
    Turn::Pick(DraftSide::Red, Role::Jungle),
    Turn::Pick(DraftSide::Blue, Role::Jungle),
    Turn::Pick(DraftSide::Blue, Role::Mid),
    Turn::Pick(DraftSide::Red, Role::Mid),
    Turn::Pick(DraftSide::Red, Role::Adc),
    Turn::Pick(DraftSide::Blue, Role::Adc),
    Turn::Pick(DraftSide::Blue, Role::Support),
    Turn::Pick(DraftSide::Red, Role::Support),
];

pub const ROSTER: [Role; 5] = [Role::Top, Role::Jungle, Role::Mid, Role::Adc, Role::Support];

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DraftSide {
    Blue,
    Red,
}

impl DraftSide {
    pub fn name(self) -> &'static str {
        match self {
            Self::Blue => "bleu",
            Self::Red => "rouge",
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Turn {
    Ban(DraftSide),
    Pick(DraftSide, Role),
}

impl Turn {
    pub fn side(self) -> DraftSide {
        match self {
            Self::Ban(side) | Self::Pick(side, _) => side,
        }
    }
}

#[derive(Clone, Copy, Debug)]
pub struct Offer {
    pub id: ChampionId,
    pub phase: u8,
    pub roles: [u8; 5],
}

pub fn opponent_choice(turn: Turn, offers: &[Offer]) -> Option<ChampionId> {
    let mut best: Option<(u16, ChampionId)> = None;
    for offer in offers {
        let score = match turn {
            Turn::Ban(_) => {
                u16::from(offer.roles.iter().copied().max().unwrap_or(0)) * 2
                    + u16::from(offer.phase)
            }
            Turn::Pick(_, role) => {
                let index = ROSTER.iter().position(|item| *item == role).unwrap_or(0);
                u16::from(offer.roles[index]) * 4 + u16::from(offer.phase)
            }
        };
        let replace = match best {
            None => true,
            Some((best_score, best_id)) => {
                score > best_score || (score == best_score && offer.id.0 < best_id.0)
            }
        };
        if replace {
            best = Some((score, offer.id));
        }
    }
    best.map(|(_, id)| id)
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DraftStep {
    Ban {
        side: DraftSide,
        champion: ChampionId,
    },
    Pick {
        side: DraftSide,
        role: Role,
        champion: ChampionId,
    },
}

impl DraftStep {
    pub fn champion(self) -> ChampionId {
        match self {
            Self::Ban { champion, .. } | Self::Pick { champion, .. } => champion,
        }
    }

    pub fn side(self) -> DraftSide {
        match self {
            Self::Ban { side, .. } | Self::Pick { side, .. } => side,
        }
    }

    fn from_turn(turn: Turn, champion: ChampionId) -> Self {
        match turn {
            Turn::Ban(side) => Self::Ban { side, champion },
            Turn::Pick(side, role) => Self::Pick {
                side,
                role,
                champion,
            },
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Stage {
    Teams,
    Draft,
    Report,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct LoggedLine {
    pub brief: String,
    pub full: String,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MapZone {
    Top,
    Mid,
    Bot,
    Dragon,
    Baron,
    BlueJungle,
    RedJungle,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct MapUnit {
    pub side: DraftSide,
    pub role: Role,
    pub name: String,
    pub champion: String,
    pub label: String,
    pub portrait: Option<std::path::PathBuf>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct MapFrame {
    pub minute: u16,
    pub zone: MapZone,
    pub movers: Vec<(DraftSide, Role)>,
    pub fallen: Vec<(DraftSide, Building)>,
}

#[derive(Clone, Debug)]
pub struct MatchDesk {
    pub blue: Option<domain::TeamId>,
    pub red: Option<domain::TeamId>,
    pub steps: Vec<DraftStep>,
    pub stage: Stage,
    pub notice: Option<String>,
    pub headline: Option<String>,
    pub lines: Vec<LoggedLine>,
    pub selected_line: Option<usize>,
    pub blue_lineup: [Option<ChampionId>; 5],
    pub red_lineup: [Option<ChampionId>; 5],
    pub swap_from: Option<(DraftSide, Role)>,
    pub human: Option<DraftSide>,
    pub frames: Vec<MapFrame>,
    pub units: Vec<MapUnit>,
    pub playback_frame: usize,
    pub playback_travel: f32,
    pub playback_playing: bool,
    playback_clock: Option<Instant>,
}

impl MatchDesk {
    pub fn new() -> Self {
        Self {
            blue: None,
            red: None,
            steps: Vec::new(),
            stage: Stage::Teams,
            notice: None,
            headline: None,
            lines: Vec::new(),
            selected_line: None,
            blue_lineup: [None; 5],
            red_lineup: [None; 5],
            swap_from: None,
            human: None,
            frames: Vec::new(),
            units: Vec::new(),
            playback_frame: 0,
            playback_travel: 0.0,
            playback_playing: false,
            playback_clock: None,
        }
    }

    pub fn champions(&self, side: DraftSide) -> [Option<ChampionId>; 5] {
        let stored = self.stored_lineup(side);
        if stored.iter().any(|champion| champion.is_some()) {
            stored
        } else {
            self.picks_from_steps(side)
        }
    }

    pub fn arm_swap(&mut self, side: DraftSide, role: Role) {
        if self.stage != Stage::Draft || self.next_turn().is_some() {
            return;
        }
        self.materialize(side);
        match self.swap_from {
            Some((armed_side, armed_role)) if armed_side == side && armed_role == role => {
                self.swap_from = None;
                self.notice = None;
            }
            Some((armed_side, armed_role)) if armed_side == side => {
                self.exchange(side, armed_role, role);
                self.swap_from = None;
                self.notice = None;
            }
            _ => {
                self.swap_from = Some((side, role));
                self.notice = Some("Choisis le rôle du même côté qui reçoit ce champion.".into());
            }
        }
    }

    pub fn show_frame(&mut self, index: usize) {
        if index < self.frames.len() {
            self.playback_frame = index;
            self.playback_travel = 1.0;
            self.playback_playing = false;
            self.selected_line = Some(index);
        }
    }

    pub fn replay(&mut self) {
        self.playback_frame = 0;
        self.playback_travel = 0.0;
        self.playback_playing = !self.frames.is_empty();
        self.playback_clock = None;
        self.selected_line = Some(0);
    }

    pub fn tick(&mut self, window: &mut Window) {
        if !self.playback_playing || self.frames.is_empty() {
            return;
        }
        let now = Instant::now();
        let dt = self
            .playback_clock
            .map(|then| now.duration_since(then).as_secs_f32().min(0.05))
            .unwrap_or(0.0);
        self.playback_clock = Some(now);
        self.playback_travel += dt;
        if self.playback_travel >= 1.7 {
            self.playback_travel = 0.0;
            if self.playback_frame + 1 >= self.frames.len() {
                self.playback_playing = false;
                self.playback_travel = 1.0;
                self.playback_frame = self.frames.len() - 1;
            } else {
                self.playback_frame += 1;
            }
            self.selected_line = Some(self.playback_frame);
        }
        window.request_animation_frame();
    }

    pub fn teams_differ(&self) -> bool {
        match (self.blue, self.red) {
            (Some(blue), Some(red)) => blue != red,
            _ => false,
        }
    }

    pub fn next_turn(&self) -> Option<Turn> {
        SCRIPT.get(self.steps.len()).copied()
    }

    pub fn begin(&mut self) {
        self.steps.clear();
        self.clear_board();
        self.notice = None;
        self.stage = Stage::Draft;
    }

    pub fn change_teams(&mut self) {
        self.steps.clear();
        self.clear_board();
        self.notice = None;
        self.stage = Stage::Teams;
    }

    pub fn choose(&mut self, champion: ChampionId) {
        let Some(turn) = self.next_turn() else {
            self.notice = Some("Le draft est terminé.".into());
            return;
        };
        if self.human.is_some_and(|human| turn.side() != human) {
            self.notice = Some("C'est au tour de l'adversaire.".into());
            return;
        }
        self.commit(champion);
    }

    pub fn answer(&mut self, champion: ChampionId) {
        let Some(turn) = self.next_turn() else {
            return;
        };
        if self.human.is_some_and(|human| turn.side() == human) {
            return;
        }
        self.commit(champion);
    }

    fn commit(&mut self, champion: ChampionId) {
        if self.stage != Stage::Draft {
            return;
        }
        let Some(turn) = self.next_turn() else {
            self.notice = Some("Le draft est terminé.".into());
            return;
        };
        if self.steps.iter().any(|step| step.champion() == champion) {
            self.notice = Some("Ce champion est déjà banni ou choisi.".into());
            return;
        }
        self.steps.push(DraftStep::from_turn(turn, champion));
        self.notice = None;
    }

    pub fn undo(&mut self) {
        if self.stage != Stage::Draft {
            return;
        }
        while self
            .steps
            .last()
            .is_some_and(|step| self.human.is_some_and(|human| step.side() != human))
        {
            self.steps.pop();
        }
        if self
            .steps
            .last()
            .is_some_and(|step| self.human.is_none_or(|human| step.side() == human))
        {
            self.steps.pop();
        }
        self.blue_lineup = [None; 5];
        self.red_lineup = [None; 5];
        self.swap_from = None;
        self.notice = None;
    }

    pub fn store(
        &mut self,
        headline: String,
        lines: Vec<LoggedLine>,
        frames: Vec<MapFrame>,
        units: Vec<MapUnit>,
    ) {
        self.selected_line = if frames.is_empty() { None } else { Some(0) };
        self.headline = Some(headline);
        self.lines = lines;
        self.frames = frames;
        self.units = units;
        self.playback_frame = 0;
        self.playback_travel = 0.0;
        self.playback_playing = !self.frames.is_empty();
        self.playback_clock = None;
        self.stage = Stage::Report;
        self.notice = None;
    }

    fn clear_board(&mut self) {
        self.lines.clear();
        self.headline = None;
        self.selected_line = None;
        self.blue_lineup = [None; 5];
        self.red_lineup = [None; 5];
        self.swap_from = None;
        self.frames.clear();
        self.units.clear();
        self.playback_frame = 0;
        self.playback_travel = 0.0;
        self.playback_playing = false;
        self.playback_clock = None;
    }

    fn stored_lineup(&self, side: DraftSide) -> [Option<ChampionId>; 5] {
        match side {
            DraftSide::Blue => self.blue_lineup,
            DraftSide::Red => self.red_lineup,
        }
    }

    fn picks_from_steps(&self, side: DraftSide) -> [Option<ChampionId>; 5] {
        let mut lineup = [None; 5];
        for step in &self.steps {
            if let DraftStep::Pick {
                side: picked,
                role,
                champion,
            } = step
            {
                if *picked == side {
                    let Some(index) = ROSTER.iter().position(|item| item == role) else {
                        continue;
                    };
                    lineup[index] = Some(*champion);
                }
            }
        }
        lineup
    }

    fn materialize(&mut self, side: DraftSide) {
        if self
            .stored_lineup(side)
            .iter()
            .all(|champion| champion.is_none())
        {
            let lineup = self.picks_from_steps(side);
            match side {
                DraftSide::Blue => self.blue_lineup = lineup,
                DraftSide::Red => self.red_lineup = lineup,
            }
        }
    }

    fn exchange(&mut self, side: DraftSide, left: Role, right: Role) {
        let Some(left_index) = ROSTER.iter().position(|role| *role == left) else {
            return;
        };
        let Some(right_index) = ROSTER.iter().position(|role| *role == right) else {
            return;
        };
        match side {
            DraftSide::Blue => self.blue_lineup.swap(left_index, right_index),
            DraftSide::Red => self.red_lineup.swap(left_index, right_index),
        }
    }
}

pub fn concrete_lineup(slots: [Option<ChampionId>; 5]) -> Option<[ChampionId; 5]> {
    if slots.iter().any(|slot| slot.is_none()) {
        None
    } else {
        Some(slots.map(|slot| slot.unwrap_or_else(|| unreachable!("every slot is filled"))))
    }
}

pub fn role_name(role: Role) -> &'static str {
    match role {
        Role::Top => "Top",
        Role::Jungle => "Jungle",
        Role::Mid => "Mid",
        Role::Adc => "ADC",
        Role::Support => "Support",
    }
}

pub fn match_input(
    blue_champions: [ChampionId; 5],
    red_champions: [ChampionId; 5],
    blue: &[&Player],
    red: &[&Player],
    on_patch: impl Fn(ChampionId) -> Option<ChampionOnPatch>,
    objectives: Vec<domain::PatchObjective>,
) -> Result<MatchInput, String> {
    Ok(MatchInput {
        elimination: false,
        objectives,
        inhibitor_respawn_seconds: None,
        blue: side(DraftSide::Blue, blue_champions, blue, &on_patch)?,
        red: side(DraftSide::Red, red_champions, red, &on_patch)?,
    })
}

pub fn play_draft(
    blue_champions: [ChampionId; 5],
    red_champions: [ChampionId; 5],
    blue: &[&Player],
    red: &[&Player],
    on_patch: impl Fn(ChampionId) -> Option<ChampionOnPatch>,
    objectives: Vec<domain::PatchObjective>,
) -> Result<PlayedMatch, String> {
    let input = match_input(
        blue_champions,
        red_champions,
        blue,
        red,
        on_patch,
        objectives,
    )?;
    Ok(play(input, seed_from(blue_champions, red_champions)))
}

pub fn team_gold(minute: u16, kill_gold: i32) -> i32 {
    i32::from(minute) * 1_700 + 2_500 + kill_gold
}

pub fn champion_damage(role: Role, minute: u16) -> i32 {
    let per_minute = match role {
        Role::Top => 500,
        Role::Jungle => 380,
        Role::Mid => 640,
        Role::Adc => 780,
        Role::Support => 160,
    };
    per_minute * i32::from(minute)
}

fn grouped(value: i32) -> String {
    let digits = value.abs().to_string();
    let mut out = String::new();
    for (index, glyph) in digits.chars().rev().enumerate() {
        if index > 0 && index % 3 == 0 {
            out.push('\u{202f}');
        }
        out.push(glyph);
    }
    let mut out: String = out.chars().rev().collect();
    if value < 0 {
        out.insert(0, '-');
    }
    out
}

pub fn describe(
    played: &PlayedMatch,
    blue_name: &str,
    red_name: &str,
) -> (String, Vec<LoggedLine>) {
    let winner = match played.winner {
        Side::Blue => blue_name,
        Side::Red => red_name,
    };
    let minute = played.log.last().map(|line| line.minute).unwrap_or(0);
    let headline = format!(
        "Vainqueur : {winner} · {minute} min · or {} / {}",
        grouped(team_gold(minute, played.blue_gold)),
        grouped(team_gold(minute, played.red_gold))
    );
    let lines = played
        .log
        .iter()
        .map(|line| LoggedLine {
            brief: brief(line),
            full: line.text(),
        })
        .collect();
    (headline, lines)
}

fn brief(line: &domain::ReportLine) -> String {
    let status = match line.status {
        domain::EventStatus::DidNotStart => "ne part pas",
        domain::EventStatus::Succeeded => "réussi",
        domain::EventStatus::Failed => "échoué",
    };
    let mut text = format!("{} min · {} · {status}", line.minute, line.kind.label());
    if !line.taken.is_empty() {
        let names = line
            .taken
            .iter()
            .map(|building| building.label())
            .collect::<Vec<_>>()
            .join(", ");
        text.push_str(" · ");
        text.push_str(&names);
    }
    if !line.deaths.is_empty() {
        text.push_str(&format!(" · {} mort(s)", line.deaths.len()));
    }
    text
}

pub fn map_frames(played: &PlayedMatch, units: &[MapUnit]) -> Vec<MapFrame> {
    let mut fallen = Vec::new();
    played
        .log
        .iter()
        .map(|line| {
            if let Some(beneficiary) = line.beneficiary {
                let base = match beneficiary {
                    Side::Blue => DraftSide::Red,
                    Side::Red => DraftSide::Blue,
                };
                for building in &line.taken {
                    let mark = (base, *building);
                    if !fallen.contains(&mark) {
                        fallen.push(mark);
                    }
                }
            }
            MapFrame {
                minute: line.minute,
                zone: zone_for(line),
                movers: movers(line, units),
                fallen: fallen.clone(),
            }
        })
        .collect()
}

fn zone_for(line: &ReportLine) -> MapZone {
    if let Some(building) = line.taken.first() {
        return match building {
            Building::Outer(Lane::Top)
            | Building::Inner(Lane::Top)
            | Building::InhibitorTurret(Lane::Top)
            | Building::Inhibitor(Lane::Top) => MapZone::Top,
            Building::Outer(Lane::Bot)
            | Building::Inner(Lane::Bot)
            | Building::InhibitorTurret(Lane::Bot)
            | Building::Inhibitor(Lane::Bot) => MapZone::Bot,
            Building::Outer(Lane::Mid)
            | Building::Inner(Lane::Mid)
            | Building::InhibitorTurret(Lane::Mid)
            | Building::Inhibitor(Lane::Mid)
            | Building::NexusTurret(_)
            | Building::Nexus => MapZone::Mid,
        };
    }
    match &line.kind {
        EventKind::Invade => match line.beneficiary {
            Some(Side::Blue) => MapZone::RedJungle,
            Some(Side::Red) => MapZone::BlueJungle,
            None => MapZone::Mid,
        },
        EventKind::Trade(lane) | EventKind::Gank(lane) => lane_zone(lane),
        EventKind::Vision => MapZone::Dragon,
        EventKind::Catch => MapZone::Mid,
        EventKind::Trap => MapZone::Baron,
        EventKind::Objective(name) => {
            let lower = name.to_lowercase();
            if lower.contains("baron") || lower.contains("nashor") || lower.contains("herald") {
                MapZone::Baron
            } else {
                MapZone::Dragon
            }
        }
        EventKind::Structures => MapZone::Mid,
    }
}

fn lane_zone(lane: &str) -> MapZone {
    match lane {
        "top" => MapZone::Top,
        "bot" => MapZone::Bot,
        _ => MapZone::Mid,
    }
}

fn movers(line: &ReportLine, units: &[MapUnit]) -> Vec<(DraftSide, Role)> {
    let mut found = Vec::new();
    for name in line.deaths.iter().map(String::as_str).chain(acted(line)) {
        if let Some(unit) = units.iter().find(|unit| unit.name == name) {
            let mark = (unit.side, unit.role);
            if !found.contains(&mark) {
                found.push(mark);
            }
        }
    }
    if found.is_empty() {
        if let Some(beneficiary) = line.beneficiary {
            let side = match beneficiary {
                Side::Blue => DraftSide::Blue,
                Side::Red => DraftSide::Red,
            };
            return units
                .iter()
                .filter(|unit| unit.side == side)
                .map(|unit| (unit.side, unit.role))
                .collect();
        }
    }
    found
}

fn acted(line: &ReportLine) -> impl Iterator<Item = &str> {
    line.actions.iter().filter_map(|action| match action {
        PlayerAction::Acted { name } => Some(name.as_str()),
        PlayerAction::NotInPlan { .. } | PlayerAction::DidNotFollow { .. } => None,
    })
}

fn seed_from(blue: [ChampionId; 5], red: [ChampionId; 5]) -> u64 {
    let mut seed = 0x4c4f4c_u64;
    for champion in blue.into_iter().chain(red) {
        seed = seed
            .wrapping_mul(16_777_619)
            .wrapping_add(champion.0.as_u128() as u64);
    }
    seed
}

fn side(
    bench: DraftSide,
    champions: [ChampionId; 5],
    roster: &[&Player],
    on_patch: &impl Fn(ChampionId) -> Option<ChampionOnPatch>,
) -> Result<SideInput, String> {
    let mut players = Vec::with_capacity(ROSTER.len());
    for (role, champion) in ROSTER.into_iter().zip(champions) {
        let Some(player) = roster
            .iter()
            .copied()
            .find(|player| player.identity.role == role)
        else {
            return Err(format!(
                "Le côté {} n'a pas de joueur au rôle {}.",
                bench.name(),
                role_name(role)
            ));
        };
        players.push(player_input(player, role, champion, on_patch(champion)));
    }
    let players: [PlayerInput; 5] = match players.try_into() {
        Ok(players) => players,
        Err(_) => unreachable!("five roster slots"),
    };
    SideInput::new(players, GamePlan::aggressive())
        .map_err(|_| "L'effectif n'est pas dans l'ordre des rôles.".into())
}

fn player_input(
    player: &Player,
    role: Role,
    champion: ChampionId,
    on_patch: Option<ChampionOnPatch>,
) -> PlayerInput {
    let kit = kit_of(on_patch);
    PlayerInput {
        name: player.identity.name.clone(),
        role,
        competencies: sheet_of(player, role, on_patch),
        state: player.state.unwrap_or(PlayerState {
            form: score(80),
            fatigue: score(20),
        }),
        tags: player.tags.clone(),
        mastery: player
            .pool
            .iter()
            .find(|entry| entry.champion == champion)
            .map(|entry| entry.mastery)
            .unwrap_or_else(|| score(50)),
        matchup: matchup_of(kit.damage),
        kit,
    }
}

fn sheet_of(player: &Player, role: Role, on_patch: Option<ChampionOnPatch>) -> Competencies {
    if let Some(sheet) = player.competencies {
        return sheet;
    }
    let phases = on_patch.and_then(|row| row.phases).unwrap_or(PhaseScores {
        early: score(50),
        mid: score(50),
        late: score(50),
    });
    let role_score = on_patch
        .and_then(|row| row.roles)
        .map(|roles| score_for_role(roles, role))
        .unwrap_or_else(|| score(50));
    Competencies {
        mechanics: score(50),
        teamfight: score(50),
        map_awareness: score(50),
        objectives: score(50),
        tempo: score(50),
        mental: score(50),
        itemisation: score(50),
        phases,
        shotcalling: score(50),
        role_skill: RoleSkill::for_role(role, role_score),
    }
}

fn kit_of(on_patch: Option<ChampionOnPatch>) -> KitProfile {
    let flat = score(40);
    KitProfile {
        damage: on_patch
            .and_then(|row| row.damage)
            .unwrap_or(DamageSliders {
                attack: flat,
                ability: flat,
                true_damage: flat,
            }),
        tankiness: on_patch
            .and_then(|row| row.tankiness)
            .unwrap_or(TankinessSliders {
                health: flat,
                armor: flat,
                magic_resist: flat,
            }),
    }
}

fn matchup_of(damage: DamageSliders) -> MatchupPlan {
    if damage.attack.value() >= damage.ability.value() {
        MatchupPlan::Attack
    } else {
        MatchupPlan::Ability
    }
}

fn score_for_role(roles: RoleScores, role: Role) -> Score {
    match role {
        Role::Top => roles.top,
        Role::Jungle => roles.jungle,
        Role::Mid => roles.mid,
        Role::Adc => roles.adc,
        Role::Support => roles.support,
    }
}

fn score(value: u8) -> Score {
    Score::new(value).unwrap_or_else(|| unreachable!("literal score stays within 0..=100"))
}

#[cfg(test)]
mod tests {
    use super::{
        concrete_lineup, map_frames, match_input, role_name, DraftSide, DraftStep, MapUnit,
        MatchDesk, Stage, Turn, SCRIPT,
    };
    use domain::{
        play, Building, ChampionId, ChampionOnPatch, DamageSliders, EventStatus, MatchupPlan,
        PhaseScores, Player, PlayerId, PlayerIdentity, Role, RoleScores, RoleSkill, Score,
        TankinessSliders,
    };
    use uuid::Uuid;

    #[test]
    fn season_four_script_is_three_bans_then_role_order() {
        assert_eq!(SCRIPT.len(), 16);
        let bans: Vec<_> = SCRIPT
            .into_iter()
            .take_while(|turn| matches!(turn, super::Turn::Ban(_)))
            .collect();
        assert_eq!(
            bans,
            vec![
                super::Turn::Ban(DraftSide::Blue),
                super::Turn::Ban(DraftSide::Red),
                super::Turn::Ban(DraftSide::Blue),
                super::Turn::Ban(DraftSide::Red),
                super::Turn::Ban(DraftSide::Blue),
                super::Turn::Ban(DraftSide::Red),
            ]
        );
        let picks: Vec<_> = SCRIPT
            .into_iter()
            .filter_map(|turn| match turn {
                super::Turn::Pick(side, role) => Some((side, role)),
                super::Turn::Ban(_) => None,
            })
            .collect();
        assert_eq!(
            picks,
            vec![
                (DraftSide::Blue, Role::Top),
                (DraftSide::Red, Role::Top),
                (DraftSide::Red, Role::Jungle),
                (DraftSide::Blue, Role::Jungle),
                (DraftSide::Blue, Role::Mid),
                (DraftSide::Red, Role::Mid),
                (DraftSide::Red, Role::Adc),
                (DraftSide::Blue, Role::Adc),
                (DraftSide::Blue, Role::Support),
                (DraftSide::Red, Role::Support),
            ]
        );
        assert_eq!(role_name(Role::Adc), "ADC");
    }

    #[test]
    fn a_banned_champion_cannot_be_picked() {
        let mut desk = MatchDesk::new();
        desk.stage = Stage::Draft;
        let ahri = ChampionId(Uuid::from_u128(1));
        desk.choose(ahri);
        desk.choose(ahri);
        assert_eq!(desk.steps.len(), 1);
        assert_eq!(
            desk.steps[0],
            DraftStep::Ban {
                side: DraftSide::Blue,
                champion: ahri,
            }
        );
        assert_eq!(
            desk.notice.as_deref(),
            Some("Ce champion est déjà banni ou choisi.")
        );
    }

    #[test]
    fn an_empty_sheet_takes_the_champion_on_the_patch_and_the_match_closes() {
        let mut desk = MatchDesk::new();
        desk.stage = Stage::Draft;
        for index in 1..=16 {
            desk.choose(ChampionId(Uuid::from_u128(index)));
        }
        assert!(desk.next_turn().is_none());
        let blue_top = ChampionId(Uuid::from_u128(7));
        let blue = squad(10);
        let red = squad(20);
        let blue_refs: Vec<&Player> = blue.iter().collect();
        let red_refs: Vec<&Player> = red.iter().collect();
        let input = match_input(
            concrete_lineup(desk.champions(DraftSide::Blue)).unwrap(),
            concrete_lineup(desk.champions(DraftSide::Red)).unwrap(),
            &blue_refs,
            &red_refs,
            |champion| Some(kit_for(champion, blue_top)),
            Vec::new(),
        )
        .unwrap();
        let top = &input.blue.players[0];
        assert_eq!(top.role, Role::Top);
        assert_eq!(top.competencies.phases.early.value(), 90);
        assert_eq!(top.competencies.mechanics.value(), 50);
        assert!(matches!(
            top.competencies.role_skill,
            RoleSkill::Laning(score) if score.value() == 80
        ));
        assert_eq!(top.matchup, MatchupPlan::Attack);
        assert_eq!(input.red.players[0].competencies.phases.early.value(), 35);
        let played = play(input, 1);
        assert!(played.log_matches_the_result());
        assert!(played
            .log
            .iter()
            .any(|line| line.status == EventStatus::Succeeded && !line.taken.is_empty()));
        let frames = map_frames(&played, &named_units());
        let nexus_at = frames
            .iter()
            .position(|frame| {
                frame
                    .fallen
                    .iter()
                    .any(|(_, building)| matches!(building, Building::Nexus))
            })
            .expect("a nexus falls");
        assert!(frames[nexus_at..].iter().all(|frame| frame
            .fallen
            .iter()
            .any(|(_, building)| { matches!(building, Building::Nexus) })));
    }

    #[test]
    fn a_swap_exchanges_two_champions_of_the_same_side() {
        let mut desk = MatchDesk::new();
        desk.stage = Stage::Draft;
        for index in 1..=16 {
            desk.choose(ChampionId(Uuid::from_u128(index)));
        }
        let before = desk.champions(DraftSide::Blue);
        desk.arm_swap(DraftSide::Blue, Role::Top);
        desk.arm_swap(DraftSide::Blue, Role::Mid);
        let after = desk.champions(DraftSide::Blue);
        assert_eq!(after[0], before[2]);
        assert_eq!(after[2], before[0]);
        assert_eq!(after[1], before[1]);
        assert_eq!(desk.champions(DraftSide::Red), before_red(&desk));
    }

    #[test]
    fn the_opponent_picks_the_best_role_and_bans_the_biggest_threat() {
        let support = super::Offer {
            id: ChampionId(Uuid::from_u128(1)),
            phase: 90,
            roles: [10, 10, 10, 10, 80],
        };
        let jungler = super::Offer {
            id: ChampionId(Uuid::from_u128(2)),
            phase: 40,
            roles: [10, 90, 10, 10, 10],
        };
        assert_eq!(
            super::opponent_choice(
                Turn::Pick(DraftSide::Red, Role::Jungle),
                &[support, jungler]
            ),
            Some(jungler.id)
        );
        assert_eq!(
            super::opponent_choice(Turn::Ban(DraftSide::Red), &[support, jungler]),
            Some(support.id)
        );
    }

    #[test]
    fn a_click_does_not_take_the_opponent_turn() {
        let mut desk = MatchDesk::new();
        desk.stage = Stage::Draft;
        desk.human = Some(DraftSide::Blue);
        let ahri = ChampionId(Uuid::from_u128(1));
        let lee = ChampionId(Uuid::from_u128(2));
        desk.choose(ahri);
        desk.choose(lee);
        assert_eq!(desk.steps.len(), 1);
        desk.answer(lee);
        assert_eq!(desk.steps.len(), 2);
        assert_eq!(desk.steps[1].side(), DraftSide::Red);
        desk.undo();
        assert!(desk.steps.is_empty());
    }

    #[test]
    fn shown_gold_and_damage_match_a_thirty_three_minute_pro_game() {
        assert!((55_000..70_000).contains(&super::team_gold(33, 0)));
        let carry = super::champion_damage(Role::Adc, 33);
        let support = super::champion_damage(Role::Support, 33);
        assert!((20_000..36_000).contains(&carry));
        assert!((4_000..8_000).contains(&support));
        assert!(carry > support);
    }

    fn before_red(desk: &MatchDesk) -> [Option<ChampionId>; 5] {
        let mut lineup = [None; 5];
        for step in &desk.steps {
            if let DraftStep::Pick {
                side: DraftSide::Red,
                role,
                champion,
            } = step
            {
                let index = super::ROSTER.iter().position(|item| item == role).unwrap();
                lineup[index] = Some(*champion);
            }
        }
        lineup
    }

    fn named_units() -> Vec<MapUnit> {
        super::ROSTER
            .into_iter()
            .flat_map(|role| {
                [DraftSide::Blue, DraftSide::Red]
                    .into_iter()
                    .map(move |side| MapUnit {
                        side,
                        role,
                        name: role_name(role).into(),
                        champion: role_name(role).into(),
                        label: role_name(role).chars().take(2).collect(),
                        portrait: None,
                    })
            })
            .collect()
    }

    fn squad(start: u128) -> Vec<Player> {
        super::ROSTER
            .into_iter()
            .enumerate()
            .map(|(offset, role)| player(start + offset as u128, role))
            .collect()
    }

    fn player(id: u128, role: Role) -> Player {
        Player {
            identity: PlayerIdentity {
                id: PlayerId(Uuid::from_u128(id)),
                name: role_name(role).into(),
                role,
                nationality: None,
                birth_date: None,
                portrait: None,
                teams: Vec::new(),
                palmares: Vec::new(),
            },
            pool: Vec::new(),
            competencies: None,
            state: None,
            tags: Vec::new(),
            aspirations: Vec::new(),
        }
    }

    fn kit_for(champion: ChampionId, blue_top: ChampionId) -> ChampionOnPatch {
        let blue = matches!(champion.0.as_u128(), 7 | 10 | 11 | 14 | 15);
        let early = if champion == blue_top {
            90
        } else if blue {
            80
        } else {
            35
        };
        let role_score = if champion == blue_top {
            80
        } else if blue {
            70
        } else {
            30
        };
        let rated = score(role_score);
        ChampionOnPatch {
            champion,
            roles: Some(RoleScores {
                top: rated,
                jungle: rated,
                mid: rated,
                adc: rated,
                support: rated,
            }),
            damage: Some(DamageSliders {
                attack: score(if blue { 60 } else { 30 }),
                ability: score(25),
                true_damage: score(0),
            }),
            tankiness: Some(TankinessSliders {
                health: score(40),
                armor: score(30),
                magic_resist: score(20),
            }),
            phases: Some(PhaseScores {
                early: score(early),
                mid: score(if blue { 70 } else { 35 }),
                late: score(if blue { 70 } else { 35 }),
            }),
        }
    }

    fn score(value: u8) -> Score {
        Score::new(value).unwrap()
    }
}
