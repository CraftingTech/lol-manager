use super::rift::{Building, Rift, Side, StructureState};

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum EventKind {
    Invade,
    Objective(String),
    Structures,
}

impl EventKind {
    pub fn label(&self) -> String {
        match self {
            Self::Invade => "Invade".into(),
            Self::Structures => "Combat de structures".into(),
            Self::Objective(name) => name.clone(),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EventStatus {
    DidNotStart,
    Succeeded,
    Failed,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum PlayerAction {
    Acted { name: String },
    NotInPlan { name: String },
    DidNotFollow { name: String },
}

impl PlayerAction {
    pub fn name(&self) -> &str {
        match self {
            Self::Acted { name } | Self::NotInPlan { name } | Self::DidNotFollow { name } => name,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Stat {
    Mechanics,
    Teamfight,
    MapAwareness,
    Objectives,
    Tempo,
    Mental,
    Itemisation,
    Shotcalling,
    Laning,
    Pathing,
    Phase,
    Mastery,
}

impl Stat {
    pub fn label(self) -> &'static str {
        match self {
            Self::Mechanics => "mécanique",
            Self::Teamfight => "teamfight",
            Self::MapAwareness => "map",
            Self::Objectives => "objectifs",
            Self::Tempo => "tempo",
            Self::Mental => "mental",
            Self::Itemisation => "itemisation",
            Self::Shotcalling => "shotcalling",
            Self::Laning => "laning",
            Self::Pathing => "pathing",
            Self::Phase => "phase",
            Self::Mastery => "maîtrise",
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct WeighedStat {
    pub player: String,
    pub stat: Stat,
    pub weight: u8,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ReportLine {
    pub minute: u16,
    pub phase: super::clock::Phase,
    pub kind: EventKind,
    pub status: EventStatus,
    pub start_chance: u8,
    pub success_chance: u8,
    pub weights: Vec<WeighedStat>,
    pub actions: Vec<PlayerAction>,
    pub reaction_read: bool,
    pub reaction_recalled: bool,
    pub deaths: Vec<String>,
    pub beneficiary: Option<Side>,
    pub gold: i32,
    pub taken: Vec<Building>,
    pub unlocked: Vec<String>,
    pub priority: Option<String>,
    pub reward: Option<String>,
    pub on_rift: Vec<String>,
}

impl ReportLine {
    pub fn text(&self) -> String {
        let mut line = format!(
            "{} min, {}. {}.",
            self.minute,
            self.phase.label(),
            self.kind.label()
        );
        match self.status {
            EventStatus::DidNotStart => {
                line.push_str(&format!(" Ne part pas ({} %).", self.start_chance));
            }
            EventStatus::Succeeded => {
                line.push_str(&format!(
                    " Part à {} %. Réussite {} %.",
                    self.start_chance, self.success_chance
                ));
            }
            EventStatus::Failed => {
                line.push_str(&format!(
                    " Part à {} %. Échoue ({} %).",
                    self.start_chance, self.success_chance
                ));
            }
        }
        let acted = join_actions(&self.actions, ActionKind::Acted);
        let absent = join_actions(&self.actions, ActionKind::NotInPlan);
        let missed = join_actions(&self.actions, ActionKind::DidNotFollow);
        if !acted.is_empty() {
            line.push_str(&format!(" A agi : {acted}."));
        }
        if !absent.is_empty() {
            line.push_str(&format!(" Hors du plan : {absent}."));
        }
        if !missed.is_empty() {
            line.push_str(&format!(" N'a pas suivi : {missed}."));
        }
        if self.reaction_read {
            line.push_str(" L'adversaire lit le coup.");
        } else {
            line.push_str(" L'adversaire ne lit pas le coup.");
        }
        if self.reaction_recalled {
            line.push_str(" Il rappelle une réponse.");
        }
        if !self.deaths.is_empty() {
            line.push_str(&format!(" Morts : {}.", self.deaths.join(", ")));
        }
        if !self.taken.is_empty() {
            let names = self
                .taken
                .iter()
                .map(|building| building.label())
                .collect::<Vec<_>>()
                .join(", ");
            line.push_str(&format!(" Chaîne : {names}."));
        }
        if !self.unlocked.is_empty() {
            line.push_str(&format!(" Débloque : {}.", self.unlocked.join(", ")));
        }
        if let Some(priority) = &self.priority {
            line.push_str(&format!(" Priorité : {priority}."));
        }
        if let EventKind::Objective(_) = self.kind {
            if self.status == EventStatus::Succeeded {
                match &self.reward {
                    Some(reward) => line.push_str(&format!(" Rapport : {reward}.")),
                    None => line.push_str(" Rapport vide."),
                }
            }
        }
        if !self.on_rift.is_empty() {
            line.push_str(&format!(" Sur la faille : {}.", self.on_rift.join(", ")));
        }
        for weight in &self.weights {
            line.push_str(&format!(
                " {} {} {}.",
                weight.player,
                weight.stat.label(),
                weight.weight
            ));
        }
        line
    }
}

#[derive(Clone, Copy)]
enum ActionKind {
    Acted,
    NotInPlan,
    DidNotFollow,
}

fn join_actions(actions: &[PlayerAction], kind: ActionKind) -> String {
    actions
        .iter()
        .filter(|action| {
            matches!(
                (kind, action),
                (ActionKind::Acted, PlayerAction::Acted { .. })
                    | (ActionKind::NotInPlan, PlayerAction::NotInPlan { .. })
                    | (ActionKind::DidNotFollow, PlayerAction::DidNotFollow { .. })
            )
        })
        .map(PlayerAction::name)
        .collect::<Vec<_>>()
        .join(", ")
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Replay {
    pub legal: bool,
    pub blue_nexus: bool,
    pub red_nexus: bool,
    pub blue_gold: i32,
    pub red_gold: i32,
}

pub fn replay(lines: &[ReportLine]) -> Replay {
    let mut blue = Rift::new();
    let mut red = Rift::new();
    let mut blue_gold = 0;
    let mut red_gold = 0;
    let mut legal = true;
    for line in lines {
        let Some(beneficiary) = line.beneficiary else {
            continue;
        };
        match beneficiary {
            Side::Blue => blue_gold += line.gold,
            Side::Red => red_gold += line.gold,
        }
        let base = match beneficiary {
            Side::Blue => &mut red,
            Side::Red => &mut blue,
        };
        for building in &line.taken {
            if base.state(*building) == StructureState::Destroyed || !base.attempt(*building) {
                legal = false;
            }
        }
    }
    Replay {
        legal,
        blue_nexus: blue.nexus_fallen(),
        red_nexus: red.nexus_fallen(),
        blue_gold,
        red_gold,
    }
}
