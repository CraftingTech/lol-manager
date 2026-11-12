use super::event::{read_side, resolve, FightSpec};
use super::impact::death_timer_seconds;
use super::input::{MatchInput, PatchObjective, SideInput};
use super::report::{replay, EventKind, ReportLine};
use super::rift::{Rift, Side};
use super::weight::side_strength;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlayedMatch {
    pub winner: Side,
    pub log: Vec<ReportLine>,
    pub blue_gold: i32,
    pub red_gold: i32,
}

impl PlayedMatch {
    pub fn log_matches_the_result(&self) -> bool {
        let replayed = replay(&self.log);
        let nexus = match self.winner {
            Side::Blue => replayed.red_nexus && !replayed.blue_nexus,
            Side::Red => replayed.blue_nexus && !replayed.red_nexus,
        };
        replayed.legal
            && nexus
            && replayed.blue_gold == self.blue_gold
            && replayed.red_gold == self.red_gold
    }
}

pub fn play(input: MatchInput, seed: u64) -> PlayedMatch {
    let mut world = World::new(input);
    let mut rng = Rng::new(seed);
    let mut log = Vec::new();
    if let Some(side) = level_one(&world, &mut rng) {
        contest(
            &mut world,
            side,
            1,
            true,
            invade_setup(),
            &mut log,
            &mut rng,
        );
    }
    let beats = beats(rng.roll());
    let objectives = world.objectives.clone();
    let mut offered = false;
    for beat in beats {
        if world.winner.is_some() {
            break;
        }
        if !offered && beat.minute >= 20 {
            offer_patch_objectives(&mut world, &objectives, &mut log, &mut rng);
            offered = true;
        }
        if world.winner.is_some() {
            break;
        }
        let attacker = match beat.side {
            Aggressor::Ahead => stronger(&world, beat.minute),
            Aggressor::Behind => stronger(&world, beat.minute).enemy(),
        };
        if beat.needs_deficit && world.live(attacker).gold >= world.live(attacker.enemy()).gold {
            continue;
        }
        contest(
            &mut world,
            attacker,
            beat.minute,
            true,
            beat.setup,
            &mut log,
            &mut rng,
        );
    }
    if !offered && world.winner.is_none() {
        offer_patch_objectives(&mut world, &objectives, &mut log, &mut rng);
    }
    let mut minute = 36;
    while world.winner.is_none() && minute <= 48 {
        let attacker = stronger(&world, minute);
        contest(
            &mut world,
            attacker,
            minute,
            true,
            siege_setup(minute),
            &mut log,
            &mut rng,
        );
        minute = minute.saturating_add(4);
    }
    PlayedMatch {
        winner: world.winner.expect("a match closes when a nexus falls"),
        log,
        blue_gold: world.blue.gold,
        red_gold: world.red.gold,
    }
}

fn level_one(world: &World, rng: &mut Rng) -> Option<Side> {
    let blue = world.live(Side::Blue).input.plan.invade;
    let red = world.live(Side::Red).input.plan.invade;
    if !blue && !red {
        return None;
    }
    if rng.roll() >= 40 {
        return None;
    }
    if blue && red {
        if rng.roll() % 2 == 0 {
            Some(Side::Blue)
        } else {
            Some(Side::Red)
        }
    } else if blue {
        Some(Side::Blue)
    } else {
        Some(Side::Red)
    }
}

struct Beat {
    minute: u16,
    side: Aggressor,
    needs_deficit: bool,
    setup: Setup,
}

enum Aggressor {
    Ahead,
    Behind,
}

fn beats(lane: u8) -> Vec<Beat> {
    let (first_name, first_lane) = lane_of(lane);
    let (second_name, second_lane) = lane_of(lane.wrapping_add(1));
    let bot = roles(&[3, 4]);
    let brush = roles(&[1, 4]);
    let pit = roles(&[1, 3, 4]);
    vec![
        Beat {
            minute: 4,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: skirmish(EventKind::Trade("bot".into()), bot, bot),
        },
        Beat {
            minute: 6,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: gank(first_name, first_lane),
        },
        Beat {
            minute: 8,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: skirmish(EventKind::Vision, brush, brush),
        },
        Beat {
            minute: 10,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: skirmish(EventKind::Trade("mid".into()), roles(&[2]), roles(&[2])),
        },
        Beat {
            minute: 12,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: objective("dragon", pit),
        },
        Beat {
            minute: 14,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: gank(second_name, second_lane),
        },
        Beat {
            minute: 17,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: skirmish(EventKind::Catch, roles(&[1, 2]), roles(&[3, 4])),
        },
        Beat {
            minute: 20,
            side: Aggressor::Behind,
            needs_deficit: true,
            setup: skirmish(EventKind::Trap, roles(&[1, 2, 4]), roles(&[2])),
        },
        Beat {
            minute: 22,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: objective("baron", [true; 5]),
        },
        Beat {
            minute: 25,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: gank("top", roles(&[0])),
        },
        Beat {
            minute: 28,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: siege_setup(28),
        },
        Beat {
            minute: 32,
            side: Aggressor::Ahead,
            needs_deficit: false,
            setup: siege_setup(32),
        },
    ]
}

fn lane_of(lane: u8) -> (&'static str, [bool; 5]) {
    match lane % 3 {
        0 => ("top", roles(&[0])),
        1 => ("mid", roles(&[2])),
        _ => ("bot", roles(&[3, 4])),
    }
}

fn roles(indexes: &[usize]) -> [bool; 5] {
    let mut mask = [false; 5];
    for index in indexes {
        mask[*index] = true;
    }
    mask
}

fn invade_setup() -> Setup {
    let trio = roles(&[1, 2, 4]);
    skirmish(EventKind::Invade, trio, trio)
}

fn gank(lane: &str, lane_roles: [bool; 5]) -> Setup {
    let mut included = lane_roles;
    included[1] = true;
    skirmish(EventKind::Gank(lane.into()), included, lane_roles)
}

fn objective(name: &str, present: [bool; 5]) -> Setup {
    skirmish(EventKind::Objective(name.into()), present, present)
}

fn siege_setup(minute: u16) -> Setup {
    Setup {
        kind: EventKind::Structures,
        included: [true; 5],
        present: [true; 5],
        planned: true,
        opens_structures: true,
        conversion: minute >= 32,
        priority: None,
        reward: None,
        named_unlocks: Vec::new(),
    }
}

fn skirmish(kind: EventKind, included: [bool; 5], present: [bool; 5]) -> Setup {
    Setup {
        kind,
        included,
        present,
        planned: true,
        opens_structures: false,
        conversion: false,
        priority: None,
        reward: None,
        named_unlocks: Vec::new(),
    }
}

struct Setup {
    kind: EventKind,
    included: [bool; 5],
    present: [bool; 5],
    planned: bool,
    opens_structures: bool,
    conversion: bool,
    priority: Option<String>,
    reward: Option<String>,
    named_unlocks: Vec<String>,
}

fn offer_patch_objectives(
    world: &mut World,
    objectives: &[PatchObjective],
    log: &mut Vec<ReportLine>,
    rng: &mut Rng,
) {
    for objective in objectives {
        if world.winner.is_some() {
            break;
        }
        offer_objective(world, objective.clone(), log, rng);
    }
}

fn offer_objective(
    world: &mut World,
    objective: PatchObjective,
    log: &mut Vec<ReportLine>,
    rng: &mut Rng,
) {
    let minute = 20;
    let reward = objective.reported_reward();
    let named_unlocks = objective.unlocks.clone();
    let order = [stronger(world, minute), stronger(world, minute).enemy()];
    for attacker in order {
        if !world.live(attacker).input.plan.contest_objectives {
            continue;
        }
        let before = log.len();
        contest(
            world,
            attacker,
            minute,
            false,
            Setup {
                kind: EventKind::Objective(objective.name.clone()),
                included: world.live(attacker).input.plan.push_with,
                present: [true; 5],
                planned: world.live(attacker).input.plan.contest_objectives,
                opens_structures: false,
                conversion: false,
                priority: None,
                reward: reward.clone(),
                named_unlocks: named_unlocks.clone(),
            },
            log,
            rng,
        );
        if log
            .get(before)
            .is_some_and(|line| matches!(line.status, super::report::EventStatus::Succeeded))
        {
            break;
        }
    }
}

fn contest(
    world: &mut World,
    attacker: Side,
    minute: u16,
    force_start: bool,
    setup: Setup,
    log: &mut Vec<ReportLine>,
    rng: &mut Rng,
) {
    world.advance_to(minute);
    let enemy = attacker.enemy();
    let attackers = world.live(attacker).input.clone();
    let defenders = world.live(enemy).input.clone();
    let attacker_alive = world.live(attacker).alive;
    let defender_alive = world.live(enemy).alive;
    let attacker_gold = world.live(attacker).gold;
    let defender_gold = world.live(enemy).gold;
    let attacker_tempo = world.live(attacker).tempo;
    let elimination = world.elimination;
    let (attacker_base, defender_base) = world.bases(attacker);
    let outcome = resolve(
        FightSpec {
            minute,
            kind: setup.kind,
            elimination,
            attacker,
            attackers: &attackers,
            defenders: &defenders,
            attacker_alive,
            defender_alive,
            attacker_gold,
            defender_gold,
            attacker_tempo,
            included: setup.included,
            defender_present: setup.present,
            opens_structures: setup.opens_structures,
            conversion: setup.conversion,
            planned: setup.planned,
            force_start,
            priority: setup.priority,
            reward: setup.reward,
            named_unlocks: setup.named_unlocks,
            roll_start: rng.roll(),
            roll_success: rng.roll(),
        },
        attacker_base,
        defender_base,
    );
    apply(world, attacker, minute, outcome, log);
}

fn apply(
    world: &mut World,
    attacker: Side,
    minute: u16,
    outcome: super::event::Outcome,
    log: &mut Vec<ReportLine>,
) {
    let until = world
        .clock_seconds
        .saturating_add(death_timer_seconds(minute));
    {
        let attack = world.live_mut(attacker);
        attack.gold += outcome.gold_to_attacker;
        attack.tempo += outcome.tempo_attacker;
        for index in &outcome.dead_attackers {
            attack.alive[*index] = false;
            attack.dead_until[*index] = until;
        }
    }
    {
        let defend = world.live_mut(attacker.enemy());
        defend.gold += outcome.gold_to_defender;
        defend.tempo += outcome.tempo_defender;
        for index in &outcome.dead_defenders {
            defend.alive[*index] = false;
            defend.dead_until[*index] = until;
        }
    }
    log.push(outcome.line);
    if world.red.base.nexus_fallen() {
        world.winner = Some(Side::Blue);
    } else if world.blue.base.nexus_fallen() {
        world.winner = Some(Side::Red);
    }
}

fn stronger(world: &World, minute: u16) -> Side {
    let blue = power(&world.blue, minute, world.elimination);
    let red = power(&world.red, minute, world.elimination);
    if blue >= red {
        Side::Blue
    } else {
        Side::Red
    }
}

fn power(live: &Live, minute: u16, elimination: bool) -> i16 {
    let reads = read_side(&live.input, minute, elimination);
    let present: Vec<_> = reads
        .into_iter()
        .enumerate()
        .filter(|(index, _)| live.alive[*index])
        .map(|(_, read)| read)
        .collect();
    i16::from(side_strength(&present))
        + i16::try_from(live.gold / 100).unwrap_or(0)
        + live.tempo.clamp(-10, 10)
}

struct Live {
    input: SideInput,
    gold: i32,
    tempo: i16,
    alive: [bool; 5],
    dead_until: [u16; 5],
    base: Rift,
}

struct World {
    elimination: bool,
    objectives: Vec<PatchObjective>,
    respawn_after: Option<u16>,
    blue: Live,
    red: Live,
    winner: Option<Side>,
    clock_seconds: u16,
}

impl World {
    fn new(input: MatchInput) -> Self {
        Self {
            elimination: input.elimination,
            objectives: input.objectives,
            respawn_after: input.inhibitor_respawn_seconds,
            blue: Live::new(input.blue),
            red: Live::new(input.red),
            winner: None,
            clock_seconds: 0,
        }
    }

    fn live(&self, side: Side) -> &Live {
        match side {
            Side::Blue => &self.blue,
            Side::Red => &self.red,
        }
    }

    fn live_mut(&mut self, side: Side) -> &mut Live {
        match side {
            Side::Blue => &mut self.blue,
            Side::Red => &mut self.red,
        }
    }

    fn bases(&mut self, attacker: Side) -> (&mut Rift, &mut Rift) {
        match attacker {
            Side::Blue => (&mut self.blue.base, &mut self.red.base),
            Side::Red => (&mut self.red.base, &mut self.blue.base),
        }
    }

    fn advance_to(&mut self, minute: u16) {
        let target = minute.saturating_mul(60);
        let elapsed = target.saturating_sub(self.clock_seconds);
        self.clock_seconds = target;
        let respawn = self.respawn_after;
        self.blue.base.tick(elapsed, respawn);
        self.red.base.tick(elapsed, respawn);
        let now = self.clock_seconds;
        for live in [&mut self.blue, &mut self.red] {
            for index in 0..5 {
                if now >= live.dead_until[index] {
                    live.alive[index] = true;
                }
            }
        }
    }
}

impl Live {
    fn new(input: SideInput) -> Self {
        Self {
            input,
            gold: 0,
            tempo: 0,
            alive: [true; 5],
            dead_until: [0; 5],
            base: Rift::new(),
        }
    }
}

struct Rng(u64);

impl Rng {
    fn new(seed: u64) -> Self {
        Self(seed)
    }

    fn roll(&mut self) -> u8 {
        self.0 = self
            .0
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1);
        u8::try_from((self.0 >> 33) % 100).unwrap_or(0)
    }
}

#[cfg(test)]
mod tests {
    use super::play;
    use crate::match_engine::fixture::side;
    use crate::match_engine::input::{GamePlan, MatchInput, PatchObjective};
    use crate::match_engine::report::{EventKind, EventStatus};
    use crate::match_engine::rift::{Building, Side};

    fn input(objectives: Vec<PatchObjective>) -> MatchInput {
        MatchInput {
            elimination: false,
            objectives,
            inhibitor_respawn_seconds: None,
            blue: side(95, GamePlan::aggressive()),
            red: side(25, GamePlan::quiet()),
        }
    }

    #[test]
    fn a_match_names_the_side_that_destroys_the_nexus() {
        let played = play(input(Vec::new()), 3);
        assert!(played.log_matches_the_result());
        assert_eq!(played.winner, Side::Blue);
        assert!(played
            .log
            .iter()
            .any(|line| line.taken.contains(&Building::Nexus)));
        assert!(played.log.iter().all(|line| !line.on_rift.is_empty()));
        assert!(played.log.iter().any(|line| line.on_rift.len() < 10));
        assert!(played
            .log
            .iter()
            .any(|line| !line.deaths.is_empty() && !line.taken.contains(&Building::Nexus)));
        let minute = played.log.last().map(|line| line.minute).unwrap_or(0);
        assert!(
            (24..=47).contains(&minute),
            "le match se termine à {minute} min"
        );
    }

    #[test]
    fn a_2014_patch_does_not_play_a_2026_dragon() {
        let dragon = PatchObjective {
            name: "dragon".into(),
            reward: Some("or".into()),
            unlocks: vec![],
            source_url: None,
        };
        let played = play(
            MatchInput {
                blue: side(90, GamePlan::aggressive()),
                red: side(40, GamePlan::aggressive()),
                objectives: vec![dragon],
                ..input(Vec::new())
            },
            1,
        );
        assert!(played.log.iter().all(|line| match &line.kind {
            EventKind::Objective(name) => {
                assert!(!name.contains("infernal"));
                if name == "dragon" && line.status == EventStatus::Succeeded {
                    assert!(line.reward.is_none());
                }
                true
            }
            EventKind::Invade
            | EventKind::Trade(_)
            | EventKind::Gank(_)
            | EventKind::Vision
            | EventKind::Catch
            | EventKind::Trap
            | EventKind::Structures => true,
        }));
        let text = played
            .log
            .iter()
            .map(|line| line.text())
            .collect::<Vec<_>>()
            .join("\n");
        assert!(!text.contains("infernal"));
        assert!(!text.contains("aîné"));
        assert!(!text.contains("dragon infernal"));
    }

    #[test]
    fn a_match_is_a_sequence_of_different_fights_and_an_invade_is_not_guaranteed() {
        let mut seen = 0;
        let mut missed = 0;
        for seed in 0..24 {
            let played = play(input(Vec::new()), seed);
            assert!(played.log_matches_the_result());
            let invade = played
                .log
                .iter()
                .find(|line| matches!(line.kind, EventKind::Invade));
            match invade {
                Some(line) => {
                    assert_eq!(line.minute, 1);
                    assert!(line.on_rift.len() < 10);
                    seen += 1;
                }
                None => missed += 1,
            }
            assert!(played
                .log
                .iter()
                .any(|line| matches!(line.kind, EventKind::Trade(_))));
            assert!(played
                .log
                .iter()
                .any(|line| matches!(line.kind, EventKind::Gank(_))));
            assert!(played.log.iter().any(|line| match &line.kind {
                EventKind::Objective(name) => name == "dragon" || name == "baron",
                _ => false,
            }));
            assert!(played.log.iter().any(|line| line.on_rift.len() < 10));
        }
        assert!(seen > 0);
        assert!(missed > 0);
    }
}
