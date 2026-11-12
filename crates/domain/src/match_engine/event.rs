use crate::role::Role;

use super::clock::phase_at;
use super::impact::{chance_with_gold, gold_from_kills, steps_from_deaths};
use super::input::SideInput;
use super::report::{EventKind, EventStatus, PlayerAction, ReportLine, Stat, WeighedStat};
use super::rift::{Rift, Side};
use super::weight::{read_player, team_bonus, ReadPlayer};

pub struct FightSpec<'a> {
    pub minute: u16,
    pub kind: EventKind,
    pub elimination: bool,
    pub attacker: Side,
    pub attackers: &'a SideInput,
    pub defenders: &'a SideInput,
    pub attacker_alive: [bool; 5],
    pub defender_alive: [bool; 5],
    pub attacker_gold: i32,
    pub defender_gold: i32,
    pub attacker_tempo: i16,
    pub included: [bool; 5],
    pub planned: bool,
    pub force_start: bool,
    pub priority: Option<String>,
    pub reward: Option<String>,
    pub named_unlocks: Vec<String>,
    pub roll_start: u8,
    pub roll_success: u8,
}

pub struct Outcome {
    pub line: ReportLine,
    pub dead_attackers: Vec<usize>,
    pub dead_defenders: Vec<usize>,
    pub gold_to_attacker: i32,
    pub gold_to_defender: i32,
    pub tempo_attacker: i16,
    pub tempo_defender: i16,
}

pub fn resolve(spec: FightSpec<'_>, attacker_base: &mut Rift, defender_base: &mut Rift) -> Outcome {
    let attackers = read_side(spec.attackers, spec.minute, spec.elimination);
    let defenders = read_side(spec.defenders, spec.minute, spec.elimination);
    let actions = actions_of(
        spec.attackers,
        &attackers,
        spec.included,
        spec.attacker_alive,
    );
    let start_chance = start_chance(&attackers, spec.planned, spec.force_start);
    let (reaction_read, reaction_recalled) = reaction(&defenders, spec.defender_alive);
    let success_chance = success_chance(
        &attackers,
        &actions,
        spec.attacker_gold,
        spec.defender_gold,
        spec.attacker_tempo,
        reaction_read && reaction_recalled,
    );
    let on_rift = rift_names(spec.attackers, spec.defenders);
    let weights = weights_of(spec.attackers, &attackers, &actions, spec.included);
    if !spec.force_start && spec.roll_start >= start_chance {
        return shell(
            &spec,
            EventStatus::DidNotStart,
            start_chance,
            success_chance,
            weights,
            actions,
            reaction_read,
            reaction_recalled,
            Vec::new(),
            None,
            0,
            Vec::new(),
            Vec::new(),
            None,
            on_rift,
        );
    }
    let success = spec.roll_success < success_chance;
    let kills = kill_count(
        spec.minute,
        success,
        success_chance,
        spec.roll_success,
        reaction_read,
    );
    let (dead_attackers, dead_defenders, beneficiary, base) = if success {
        let dead = victims(&defenders, spec.defender_alive, kills);
        (Vec::new(), dead, Some(spec.attacker), defender_base)
    } else if kills > 0 {
        let dead = victims(&attackers, spec.attacker_alive, kills);
        (dead, Vec::new(), Some(spec.attacker.enemy()), attacker_base)
    } else {
        (Vec::new(), Vec::new(), None, defender_base)
    };
    let deaths = death_names(
        spec.attackers,
        spec.defenders,
        &dead_attackers,
        &dead_defenders,
    );
    let gold = gold_from_kills(spec.minute, kills);
    let (taken, mut unlocked) = if kills > 0 {
        base.take(steps_from_deaths(spec.minute, kills))
    } else {
        (Vec::new(), Vec::new())
    };
    if success {
        unlocked.extend(spec.named_unlocks.iter().cloned());
    }
    let (gold_to_attacker, gold_to_defender, tempo_attacker, tempo_defender) = if success {
        (gold, 0, 8, -4)
    } else if kills > 0 {
        (0, gold, -8, 8)
    } else {
        (0, 0, -8, 0)
    };
    let line_gold = if success || kills > 0 { gold } else { 0 };
    let mut outcome = shell(
        &spec,
        if success {
            EventStatus::Succeeded
        } else {
            EventStatus::Failed
        },
        start_chance,
        success_chance,
        weights,
        actions,
        reaction_read,
        reaction_recalled,
        deaths,
        beneficiary,
        line_gold,
        taken,
        unlocked,
        if success { spec.priority.clone() } else { None },
        on_rift,
    );
    if success {
        outcome.line.reward = spec.reward.clone();
    }
    outcome.dead_attackers = dead_attackers;
    outcome.dead_defenders = dead_defenders;
    outcome.gold_to_attacker = gold_to_attacker;
    outcome.gold_to_defender = gold_to_defender;
    outcome.tempo_attacker = tempo_attacker;
    outcome.tempo_defender = tempo_defender;
    outcome
}

fn shell(
    spec: &FightSpec<'_>,
    status: EventStatus,
    start_chance: u8,
    success_chance: u8,
    weights: Vec<WeighedStat>,
    actions: Vec<PlayerAction>,
    reaction_read: bool,
    reaction_recalled: bool,
    deaths: Vec<String>,
    beneficiary: Option<Side>,
    gold: i32,
    taken: Vec<super::rift::Building>,
    unlocked: Vec<String>,
    priority: Option<String>,
    on_rift: Vec<String>,
) -> Outcome {
    Outcome {
        line: ReportLine {
            minute: spec.minute,
            phase: phase_at(spec.minute),
            kind: spec.kind.clone(),
            status,
            start_chance,
            success_chance,
            weights,
            actions,
            reaction_read,
            reaction_recalled,
            deaths,
            beneficiary,
            gold,
            taken,
            unlocked,
            priority,
            reward: None,
            on_rift,
        },
        dead_attackers: Vec::new(),
        dead_defenders: Vec::new(),
        gold_to_attacker: 0,
        gold_to_defender: 0,
        tempo_attacker: 0,
        tempo_defender: 0,
    }
}

pub fn read_side(side: &SideInput, minute: u16, elimination: bool) -> [ReadPlayer; 5] {
    std::array::from_fn(|index| {
        let player = &side.players[index];
        read_player(
            index as u8,
            player.role,
            player.competencies,
            player.state,
            &player.tags,
            player.mastery,
            player.kit,
            player.matchup,
            minute,
            elimination,
        )
    })
}

fn actions_of(
    side: &SideInput,
    reads: &[ReadPlayer; 5],
    included: [bool; 5],
    alive: [bool; 5],
) -> Vec<PlayerAction> {
    let caller = caller_shotcalling(reads);
    reads
        .iter()
        .enumerate()
        .map(|(index, read)| {
            let name = side.players[index].name.clone();
            if !included[index] {
                PlayerAction::NotInPlan { name }
            } else if alive[index] && follows(caller, read.tempo, read.mental) {
                PlayerAction::Acted { name }
            } else {
                PlayerAction::DidNotFollow { name }
            }
        })
        .collect()
}

fn follows(caller: u8, tempo: u8, mental: u8) -> bool {
    u16::from(tempo) + u16::from(mental) + 20 >= u16::from(caller)
}

fn caller_shotcalling(reads: &[ReadPlayer; 5]) -> u8 {
    reads
        .iter()
        .filter(|read| matches!(read.role, Role::Jungle | Role::Support))
        .map(|read| read.shotcalling)
        .max()
        .unwrap_or(0)
}

fn start_chance(reads: &[ReadPlayer; 5], planned: bool, force: bool) -> u8 {
    if force {
        return 100;
    }
    if !planned {
        return 15;
    }
    let phase = average(reads.iter().map(|read| read.phase));
    let mastery = average(reads.iter().map(|read| read.mastery));
    (55 + phase / 5 + mastery / 10).min(95)
}

fn success_chance(
    reads: &[ReadPlayer; 5],
    actions: &[PlayerAction],
    own_gold: i32,
    enemy_gold: i32,
    tempo: i16,
    answer_ready: bool,
) -> u8 {
    let acting: Vec<&ReadPlayer> = reads
        .iter()
        .enumerate()
        .filter(|(index, _)| matches!(actions[*index], PlayerAction::Acted { .. }))
        .map(|(_, read)| read)
        .collect();
    let pool: Vec<&ReadPlayer> = if acting.is_empty() {
        reads.iter().collect()
    } else {
        acting
    };
    let body = average(pool.iter().flat_map(|read| {
        [
            read.mechanics,
            read.map_awareness,
            read.tempo,
            read.mental,
            read.role_skill,
        ]
    }));
    let call = reads
        .iter()
        .filter(|read| matches!(read.role, Role::Jungle | Role::Support))
        .map(|read| read.call_value)
        .max()
        .unwrap_or(0);
    let punish = average_i16(pool.iter().map(|read| read.punishment));
    let mut chance = i16::from(u8::try_from((u16::from(body) + u16::from(call)) / 2).unwrap_or(0));
    chance += i16::from(team_bonus(reads)) / 5;
    chance -= punish;
    chance += tempo.clamp(-10, 10);
    if answer_ready {
        chance -= 10;
    }
    chance_with_gold(chance.clamp(0, 100) as u8, own_gold, enemy_gold)
}

fn reaction(reads: &[ReadPlayer; 5], alive: [bool; 5]) -> (bool, bool) {
    let present: Vec<&ReadPlayer> = reads
        .iter()
        .enumerate()
        .filter(|(index, _)| alive[*index])
        .map(|(_, read)| read)
        .collect();
    if present.is_empty() {
        return (false, false);
    }
    let awareness = average(present.iter().map(|read| read.map_awareness));
    let recalled = present
        .iter()
        .filter(|read| matches!(read.role, Role::Jungle | Role::Support))
        .map(|read| read.call_value)
        .max()
        .unwrap_or(0)
        >= 40
        || team_bonus(&present.into_iter().copied().collect::<Vec<_>>()) > 0;
    (awareness >= 45, recalled)
}

fn kill_count(minute: u16, success: bool, chance: u8, roll: u8, enemy_read: bool) -> u8 {
    if !success {
        return if minute >= 35 || enemy_read { 1 } else { 0 };
    }
    let margin = chance.saturating_sub(roll);
    if margin >= 40 {
        4
    } else if margin >= 15 {
        2
    } else {
        1
    }
}

fn victims(reads: &[ReadPlayer; 5], alive: [bool; 5], count: u8) -> Vec<usize> {
    let mut indexes: Vec<usize> = (0..5).filter(|index| alive[*index]).collect();
    indexes.sort_by_key(|index| (reads[*index].mechanics, *index));
    indexes.truncate(usize::from(count));
    indexes
}

fn death_names(
    attackers: &SideInput,
    defenders: &SideInput,
    dead_attackers: &[usize],
    dead_defenders: &[usize],
) -> Vec<String> {
    dead_attackers
        .iter()
        .map(|index| attackers.players[*index].name.clone())
        .chain(
            dead_defenders
                .iter()
                .map(|index| defenders.players[*index].name.clone()),
        )
        .collect()
}

fn rift_names(attackers: &SideInput, defenders: &SideInput) -> Vec<String> {
    attackers
        .players
        .iter()
        .chain(defenders.players.iter())
        .map(|player| player.name.clone())
        .collect()
}

fn weights_of(
    side: &SideInput,
    reads: &[ReadPlayer; 5],
    actions: &[PlayerAction],
    included: [bool; 5],
) -> Vec<WeighedStat> {
    let mut weights = Vec::new();
    for (index, read) in reads.iter().enumerate() {
        let in_plan = included[index];
        let acted = matches!(actions[index], PlayerAction::Acted { .. });
        if !in_plan && !acted {
            continue;
        }
        let name = side.players[index].name.clone();
        let skill = if read.role == Role::Jungle {
            Stat::Pathing
        } else {
            Stat::Laning
        };
        for (stat, weight) in [
            (Stat::Phase, read.phase),
            (Stat::Mechanics, read.mechanics),
            (Stat::MapAwareness, read.map_awareness),
            (Stat::Tempo, read.tempo),
            (Stat::Mental, read.mental),
            (Stat::Shotcalling, read.shotcalling),
            (skill, read.role_skill),
            (Stat::Itemisation, read.itemisation),
            (Stat::Mastery, read.mastery),
        ] {
            weights.push(WeighedStat {
                player: name.clone(),
                stat,
                weight,
            });
        }
    }
    weights
}

fn average(values: impl Iterator<Item = u8>) -> u8 {
    let values: Vec<u8> = values.collect();
    if values.is_empty() {
        return 0;
    }
    let sum: u16 = values.iter().copied().map(u16::from).sum();
    u8::try_from(sum / values.len() as u16).unwrap_or(0)
}

fn average_i16(values: impl Iterator<Item = i16>) -> i16 {
    let values: Vec<i16> = values.collect();
    if values.is_empty() {
        return 0;
    }
    values.iter().sum::<i16>() / i16::try_from(values.len()).unwrap_or(1)
}

#[cfg(test)]
mod tests {
    use super::{resolve, FightSpec};
    use crate::match_engine::clock::Phase;
    use crate::match_engine::fixture::{roster, score, side};
    use crate::match_engine::input::{GamePlan, PatchObjective, SideInput};
    use crate::match_engine::report::{EventKind, EventStatus, PlayerAction};
    use crate::match_engine::rift::{Building, Rift, Side};
    fn fight<'a>(
        minute: u16,
        attackers: &'a SideInput,
        defenders: &'a SideInput,
        included: [bool; 5],
        roll_start: u8,
        roll_success: u8,
        attacker_gold: i32,
    ) -> FightSpec<'a> {
        FightSpec {
            minute,
            kind: EventKind::Invade,
            elimination: false,
            attacker: Side::Blue,
            attackers,
            defenders,
            attacker_alive: [true; 5],
            defender_alive: [true; 5],
            attacker_gold,
            defender_gold: 0,
            attacker_tempo: 0,
            included,
            planned: true,
            force_start: false,
            priority: Some("dragon".into()),
            reward: None,
            named_unlocks: Vec::new(),
            roll_start,
            roll_success,
        }
    }

    #[test]
    fn an_invade_can_stay_unstarted_or_fail_or_succeed() {
        let blue = side(70, GamePlan::aggressive());
        let red = side(40, GamePlan::quiet());
        let mut attack = Rift::new();
        let mut defend = Rift::new();
        let skipped = resolve(
            fight(10, &blue, &red, [true; 5], 99, 0, 0),
            &mut attack,
            &mut defend,
        );
        assert_eq!(skipped.line.status, EventStatus::DidNotStart);
        assert!(skipped.line.taken.is_empty());
        assert!(!attack.nexus_fallen());

        let failed = resolve(
            fight(10, &blue, &red, [true; 5], 0, 99, 0),
            &mut attack,
            &mut defend,
        );
        assert_eq!(failed.line.status, EventStatus::Failed);
        assert!(!failed.line.taken.contains(&Building::Nexus));

        let won = resolve(
            fight(10, &blue, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        assert_eq!(won.line.status, EventStatus::Succeeded);
        assert_eq!(won.line.phase, Phase::Early);
        assert!(won.line.unlocked.iter().all(|name| name != "nexus"));
        assert!(!won.line.taken.contains(&Building::Nexus));
        assert_eq!(won.line.priority.as_deref(), Some("dragon"));
        assert!(won.line.text().contains("Invade"));
    }

    #[test]
    fn the_same_four_kills_walk_farther_at_thirty_five() {
        let blue = side(95, GamePlan::aggressive());
        let red = side(20, GamePlan::quiet());
        let early = resolve(
            fight(10, &blue, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        let late = resolve(
            fight(35, &blue, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        assert_eq!(early.line.status, EventStatus::Succeeded);
        assert_eq!(late.line.status, EventStatus::Succeeded);
        assert!(late.line.taken.len() > early.line.taken.len());
        assert!(!early.line.taken.contains(&Building::Nexus));
        assert!(!late.line.taken.contains(&Building::Nexus));
        assert!(late.line.gold > early.line.gold);
        assert_ne!(early.line.text(), late.line.text());
    }

    #[test]
    fn gold_from_the_previous_fight_raises_the_next_chance() {
        let blue = side(55, GamePlan::aggressive());
        let red = side(55, GamePlan::aggressive());
        let poor = resolve(
            fight(20, &blue, &red, [true; 5], 0, 50, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        let rich = resolve(
            fight(20, &blue, &red, [true; 5], 0, 50, 2_000),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        assert!(rich.line.success_chance > poor.line.success_chance);
    }

    #[test]
    fn absence_is_either_outside_the_plan_or_a_missed_follow() {
        let mut players = roster(80);
        players[3].competencies.tempo = score(0);
        players[3].competencies.mental = score(0);
        let mut plan = GamePlan::aggressive();
        plan.invade_with[0] = false;
        let blue = SideInput::new(players, plan).unwrap();
        let red = side(30, GamePlan::quiet());
        let resolved = resolve(
            fight(10, &blue, &red, plan.invade_with, 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        assert!(resolved.line.actions.iter().any(|action| matches!(
            action,
            PlayerAction::NotInPlan { name } if name == "Top"
        )));
        assert!(resolved.line.actions.iter().any(|action| matches!(
            action,
            PlayerAction::DidNotFollow { name } if name == "Adc"
        )));
        let text = resolved.line.text();
        assert!(text.contains("Hors du plan : Top"));
        assert!(text.contains("N'a pas suivi : Adc"));
        assert!(text.contains("Sur la faille"));
    }

    #[test]
    fn an_objective_report_stays_empty_without_a_source() {
        let blue = side(90, GamePlan::aggressive());
        let red = side(30, GamePlan::quiet());
        let objective = PatchObjective {
            name: "dragon".into(),
            reward: Some("or".into()),
            unlocks: vec!["dragon aîné".into()],
            source_url: None,
        };
        let mut spec = fight(20, &blue, &red, [true; 5], 0, 0, 0);
        spec.kind = EventKind::Objective(objective.name.clone());
        spec.reward = objective.reported_reward();
        spec.named_unlocks = objective.unlocks.clone();
        spec.priority = None;
        let resolved = resolve(spec, &mut Rift::new(), &mut Rift::new());
        assert_eq!(resolved.line.status, EventStatus::Succeeded);
        assert_eq!(resolved.line.reward, None);
        assert!(resolved.line.text().contains("Rapport vide."));
        assert!(resolved
            .line
            .unlocked
            .iter()
            .any(|name| name == "dragon aîné"));

        let sourced = PatchObjective {
            name: "dragon infernal".into(),
            reward: Some("âme".into()),
            unlocks: vec![],
            source_url: Some("https://leagueoflegends.fandom.com/wiki/Season_Six".into()),
        };
        let mut spec = fight(20, &blue, &red, [true; 5], 0, 0, 0);
        spec.kind = EventKind::Objective(sourced.name.clone());
        spec.reward = sourced.reported_reward();
        spec.priority = None;
        let resolved = resolve(spec, &mut Rift::new(), &mut Rift::new());
        assert_eq!(resolved.line.reward.as_deref(), Some("âme"));
        assert!(resolved.line.text().contains("Rapport : âme."));
    }

    #[test]
    fn low_itemisation_lowers_the_chance_and_names_no_item() {
        let mut rich_players = roster(80);
        let mut poor_players = roster(80);
        for player in &mut rich_players {
            player.competencies.itemisation = score(100);
        }
        for player in &mut poor_players {
            player.competencies.itemisation = score(0);
        }
        let rich = SideInput::new(rich_players, GamePlan::aggressive()).unwrap();
        let poor = SideInput::new(poor_players, GamePlan::aggressive()).unwrap();
        let red = side(50, GamePlan::quiet());
        let high = resolve(
            fight(10, &rich, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        let low = resolve(
            fight(10, &poor, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut Rift::new(),
        );
        assert!(low.line.success_chance < high.line.success_chance);
        assert!(!low.line.text().contains("Doran"));
        assert!(!low.line.text().contains("Luden"));
        assert!(low.line.text().contains("itemisation"));
    }

    #[test]
    fn a_fight_does_not_take_the_nexus_while_its_turrets_stand() {
        let blue = side(95, GamePlan::aggressive());
        let red = side(20, GamePlan::quiet());
        let mut defend = Rift::new();
        let resolved = resolve(
            fight(35, &blue, &red, [true; 5], 0, 0, 0),
            &mut Rift::new(),
            &mut defend,
        );
        assert!(!resolved.line.taken.contains(&Building::Nexus));
        assert!(!defend.nexus_fallen());
        assert_eq!(resolved.line.kind.label(), "Invade");
    }
}
