//! Turns a Data Dragon `championFull.json` into the `champion_on_patch` rows.
//!
//! The numbers come from `domain::rate_patch`. Phase scores then pass through
//! `domain::balance_roster`. Edit the lane table and `REFERENCE_LEVEL` in the
//! rating module, or the phase band in the balance module, then run this again.
//!
//! ```text
//! cargo run -p storage --bin rate_champions -- /path/to/championFull.json
//! ```
//!
//! The file used for the 2014 catalog is
//! <https://ddragon.leagueoflegends.com/cdn/4.21.5/data/en_US/championFull.json>.

use std::env;
use std::fs;
use std::process::ExitCode;

use domain::{
    balance_roster, counts_as_true_damage, rate_patch, stacked_maximum_health, ChampionClass,
    OfficialKit, SpellLine,
};

const PATCH_ID: &str = "b7e0c1a4-6d28-4f5a-9c33-1a8e2f04d6b0";
const PATCH_VERSION: &str = "4.21.5";

fn main() -> ExitCode {
    let Some(path) = env::args().nth(1) else {
        eprintln!("usage: rate_champions <championFull.json>");
        return ExitCode::from(2);
    };
    let text = match fs::read_to_string(&path) {
        Ok(text) => text,
        Err(error) => {
            eprintln!("cannot read {path}: {error}");
            return ExitCode::from(1);
        }
    };
    let file: serde_json::Value = match serde_json::from_str(&text) {
        Ok(file) => file,
        Err(error) => {
            eprintln!("cannot parse {path}: {error}");
            return ExitCode::from(1);
        }
    };
    let Some(data) = file.get("data").and_then(|data| data.as_object()) else {
        eprintln!("{path} has no data object");
        return ExitCode::from(1);
    };

    let mut champions: Vec<(String, OfficialKit)> = Vec::new();
    for (key, champion) in data {
        let name = champion
            .get("name")
            .and_then(|name| name.as_str())
            .unwrap_or(key)
            .to_string();
        match kit(champion) {
            Ok(kit) => champions.push((name, kit)),
            Err(error) => {
                eprintln!("{key}: {error}");
                return ExitCode::from(1);
            }
        }
    }
    champions.sort_by(|left, right| left.0.cmp(&right.0));
    let kits: Vec<OfficialKit> = champions.iter().map(|(_, kit)| kit.clone()).collect();
    let rated = match rate_patch(&kits) {
        Ok(rated) => rated,
        Err(error) => {
            eprintln!("rating failed: {error:?}");
            return ExitCode::from(1);
        }
    };
    let rated = match balance_roster(&kits, &rated) {
        Ok(rated) => rated,
        Err(error) => {
            eprintln!("balance failed: {error:?}");
            return ExitCode::from(1);
        }
    };

    println!("-- Champion ratings on patch {PATCH_VERSION}.");
    println!("-- Source: https://ddragon.leagueoflegends.com/cdn/{PATCH_VERSION}/data/en_US/championFull.json");
    println!("-- Method: crates/domain/src/champion_rating.rs");
    println!("-- Phases: crates/domain/src/champion_balance.rs");
    println!("-- The date stays empty: this file does not carry a calendar day.");
    println!(
        "INSERT INTO patches (id, version, date) VALUES ('{PATCH_ID}', '{PATCH_VERSION}', '');"
    );
    for ((name, _), rated) in champions.iter().zip(rated) {
        let roles = rated.roles;
        let damage = rated.damage;
        let tank = rated.tankiness;
        let phases = rated.phases;
        println!(
            "INSERT INTO champion_on_patch (patch_id, champion_id, top, jungle, mid, adc, support, attack, ability, true_damage, health, armor, magic_resist, phase_early, phase_mid, phase_late) \
             SELECT '{PATCH_ID}', id, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} FROM champions WHERE name = '{}';",
            roles.top.value(),
            roles.jungle.value(),
            roles.mid.value(),
            roles.adc.value(),
            roles.support.value(),
            damage.attack.value(),
            damage.ability.value(),
            damage.true_damage.value(),
            tank.health.value(),
            tank.armor.value(),
            tank.magic_resist.value(),
            phases.early.value(),
            phases.mid.value(),
            phases.late.value(),
            name.replace('\'', "''"),
        );
    }
    ExitCode::SUCCESS
}

fn kit(champion: &serde_json::Value) -> Result<OfficialKit, String> {
    let tags = champion
        .get("tags")
        .and_then(|tags| tags.as_array())
        .ok_or("missing tags")?;
    let mut classes = Vec::new();
    for tag in tags {
        let tag = tag.as_str().ok_or("a tag is not a string")?;
        classes.push(ChampionClass::parse(tag).ok_or_else(|| format!("unknown class {tag}"))?);
    }
    let info = champion.get("info").ok_or("missing info")?;
    let stats = champion.get("stats").ok_or("missing stats")?;
    let spells = champion
        .get("spells")
        .and_then(|spells| spells.as_array())
        .ok_or("missing spells")?;
    let mut texts = Vec::new();
    if let Some(passive) = champion.get("passive") {
        texts.push(text_of(passive));
    }
    for spell in spells {
        texts.push(text_of(spell));
    }
    let true_damage_texts = texts
        .iter()
        .filter(|text| counts_as_true_damage(text))
        .count();
    Ok(OfficialKit {
        classes,
        info_attack: number(info, "attack")?,
        info_magic: number(info, "magic")?,
        true_damage_texts: u8::try_from(true_damage_texts)
            .map_err(|_| "too many true damage texts")?,
        spell_count: u8::try_from(spells.len()).map_err(|_| "too many spells")?,
        health: float(stats, "hp")?,
        health_per_level: float(stats, "hpperlevel")?,
        bonus_health: bonus_health(champion),
        armor: float(stats, "armor")?,
        armor_per_level: float(stats, "armorperlevel")?,
        magic_resist: float(stats, "spellblock")?,
        magic_resist_per_level: float(stats, "spellblockperlevel")?,
        attack_damage: float(stats, "attackdamage")?,
        attack_damage_per_level: float(stats, "attackdamageperlevel")?,
        attack_speed_offset: float(stats, "attackspeedoffset")?,
        attack_speed_per_level: float(stats, "attackspeedperlevel")?,
        spells: spells
            .iter()
            .map(|spell| spell_line(spell))
            .collect::<Result<Vec<_>, _>>()?,
    })
}

fn spell_line(spell: &serde_json::Value) -> Result<SpellLine, String> {
    let ultimate = spell.get("maxrank").and_then(|rank| rank.as_u64()) == Some(3);
    let mut line = SpellLine {
        ultimate,
        flat: Vec::new(),
        percent_health: Vec::new(),
        ability_power: Vec::new(),
        bonus_attack_damage: Vec::new(),
        total_attack_damage: Vec::new(),
    };
    let labels = string_list(spell, &["leveltip", "label"]);
    let snippets = string_list(spell, &["leveltip", "effect"]);
    for (label, snippet) in labels.iter().zip(snippets.iter()) {
        let lower = label.to_ascii_lowercase();
        if !lower.contains("damage") {
            continue;
        }
        if ["mana", "shield", "armor", "slow"]
            .iter()
            .any(|word| lower.contains(word))
        {
            continue;
        }
        let Some(index) = effect_index(snippet) else {
            continue;
        };
        let values = effect_values(spell, index);
        if snippet.contains('%') {
            add_ranks(&mut line.percent_health, &values);
        } else {
            add_ranks(&mut line.flat, &values);
        }
    }
    for var in spell
        .get("vars")
        .and_then(|vars| vars.as_array())
        .into_iter()
        .flatten()
    {
        let coeffs = coeffs_of(var);
        match var.get("link").and_then(|link| link.as_str()) {
            Some("spelldamage") => add_ranks(&mut line.ability_power, &coeffs),
            Some("bonusattackdamage") => add_ranks(&mut line.bonus_attack_damage, &coeffs),
            Some("attackdamage") => add_ranks(&mut line.total_attack_damage, &coeffs),
            _ => {}
        }
    }
    Ok(line)
}

fn string_list(value: &serde_json::Value, path: &[&str]) -> Vec<String> {
    let mut current = value;
    for key in path {
        match current.get(key) {
            Some(next) => current = next,
            None => return Vec::new(),
        }
    }
    current
        .as_array()
        .map(|items| {
            items
                .iter()
                .filter_map(|item| item.as_str().map(str::to_string))
                .collect()
        })
        .unwrap_or_default()
}

fn effect_index(snippet: &str) -> Option<usize> {
    let marker = snippet.find("e")?;
    let digits: String = snippet[marker + 1..]
        .chars()
        .take_while(|character| character.is_ascii_digit())
        .collect();
    digits.parse().ok()
}

fn effect_values(spell: &serde_json::Value, index: usize) -> Vec<f64> {
    spell
        .get("effect")
        .and_then(|effect| effect.as_array())
        .and_then(|effect| effect.get(index))
        .and_then(|values| values.as_array())
        .map(|values| values.iter().filter_map(|value| value.as_f64()).collect())
        .unwrap_or_default()
}

fn coeffs_of(var: &serde_json::Value) -> Vec<f64> {
    match var.get("coeff") {
        Some(value) if value.as_f64().is_some() => vec![value.as_f64().unwrap_or(0.0)],
        Some(value) => value
            .as_array()
            .map(|items| items.iter().filter_map(|item| item.as_f64()).collect())
            .unwrap_or_default(),
        None => Vec::new(),
    }
}

fn add_ranks(target: &mut Vec<f64>, addition: &[f64]) {
    if addition.is_empty() {
        return;
    }
    if target.is_empty() {
        target.extend_from_slice(addition);
        return;
    }
    let length = target.len().max(addition.len());
    let mut next = vec![0.0; length];
    for index in 0..length {
        next[index] = rank_at(target, index) + rank_at(addition, index);
    }
    *target = next;
}

fn rank_at(values: &[f64], index: usize) -> f64 {
    if values.is_empty() {
        0.0
    } else {
        values[index.min(values.len() - 1)]
    }
}

fn bonus_health(champion: &serde_json::Value) -> f64 {
    let mut total = 0.0;
    if let Some(passive) = champion.get("passive") {
        total += bonus_of(passive);
    }
    if let Some(spells) = champion.get("spells").and_then(|spells| spells.as_array()) {
        for spell in spells {
            total += bonus_of(spell);
        }
    }
    total
}

fn bonus_of(ability: &serde_json::Value) -> f64 {
    stacked_maximum_health(&text_of(ability), |index| {
        ability
            .get("effect")
            .and_then(|effect| effect.as_array())
            .and_then(|effect| effect.get(index))
            .and_then(|values| values.as_array())
            .and_then(|values| values.last())
            .and_then(|value| value.as_f64())
    })
}

fn text_of(ability: &serde_json::Value) -> String {
    let description = ability
        .get("description")
        .and_then(|value| value.as_str())
        .unwrap_or("");
    let tooltip = ability
        .get("tooltip")
        .and_then(|value| value.as_str())
        .unwrap_or("");
    format!("{description}\n{tooltip}")
}

fn number(value: &serde_json::Value, key: &str) -> Result<u8, String> {
    value
        .get(key)
        .and_then(|value| value.as_u64())
        .and_then(|value| u8::try_from(value).ok())
        .ok_or_else(|| format!("missing {key}"))
}

fn float(value: &serde_json::Value, key: &str) -> Result<f64, String> {
    value
        .get(key)
        .and_then(|value| value.as_f64())
        .ok_or_else(|| format!("missing {key}"))
}
