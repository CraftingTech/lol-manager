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
    if world.winner.is_none() && world.live(Side::Blue).input.plan.invade {
        contest(
            &mut world,
            Side::Blue,
            10,
            false,
            Contest::Invade,
            None,
            &mut log,
            &mut rng,
        );
    }
    if world.winner.is_none() && world.live(Side::Red).input.plan.invade {
        contest(
            &mut world,
            Side::Red,
            10,
            false,
            Contest::Invade,
            None,
            &mut log,
            &mut rng,
        );
    }
    let objectives = world.objectives.clone();
    for objective in objectives {
        if world.winner.is_some() {
            break;
        }
        offer_objective(&mut world, objective, &mut log, &mut rng);
    }
    let mut minute = 35;
    while world.winner.is_none() && minute <= 200 {
        let attacker = stronger(&world, minute);
        contest(
            &mut world,
            attacker,
            minute,
            true,
            Contest::Structures,
            None,
            &mut log,
            &mut rng,
        );
        minute = minute.saturating_add(5);
    }
    PlayedMatch {
        winner: world.winner.expect("a match closes when a nexus falls"),
        log,
        blue_gold: world.blue.gold,
        red_gold: world.red.gold,
    }
}

enum Contest {
    Invade,
    Structures,
    Objective(PatchObjective),
}

fn offer_objective(
    world: &mut World,
    objective: PatchObjective,
    log: &mut Vec<ReportLine>,
    rng: &mut Rng,
) {
    let minute = 20;
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
            Contest::Objective(objective.clone()),
            None,
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
    contest: Contest,
    _priority: Option<String>,
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
    let (kind, included, planned, priority, reward, named_unlocks) = match contest {
        Contest::Invade => (
            EventKind::Invade,
            attackers.plan.invade_with,
            attackers.plan.invade,
            world
                .objectives
                .first()
                .map(|objective| objective.name.clone()),
            None,
            Vec::new(),
        ),
        Contest::Structures => (
            EventKind::Structures,
            attackers.plan.push_with,
            true,
            None,
            None,
            Vec::new(),
        ),
        Contest::Objective(objective) => {
            let reward = objective.reported_reward();
            let named_unlocks = objective.unlocks.clone();
            (
                EventKind::Objective(objective.name),
                attackers.plan.push_with,
                attackers.plan.contest_objectives,
                None,
                reward,
                named_unlocks,
            )
        }
    };
    let elimination = world.elimination;
    let (attacker_base, defender_base) = world.bases(attacker);
    let outcome = resolve(
        FightSpec {
            minute,
            kind,
            elimination,
            attacker,
            attackers: &attackers,
            defenders: &defenders,
            attacker_alive,
            defender_alive,
            attacker_gold,
            defender_gold,
            attacker_tempo,
            included,
            planned,
            force_start,
            priority,
            reward,
            named_unlocks,
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
        assert!(played.log.iter().all(|line| line.on_rift.len() == 10));
        assert!(played
            .log
            .iter()
            .any(|line| !line.deaths.is_empty() && !line.taken.contains(&Building::Nexus)));
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
                assert_eq!(name, "dragon");
                if line.status == EventStatus::Succeeded {
                    assert!(line.reward.is_none());
                }
                true
            }
            EventKind::Invade | EventKind::Structures => true,
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
}
