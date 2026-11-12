pub fn steps_from_deaths(minute: u16, deaths: u8) -> u8 {
    let scale = chain_scale(minute);
    u8::try_from(u16::from(deaths) * u16::from(scale) / 4).unwrap_or(0)
}

pub fn gold_from_kills(minute: u16, kills: u8) -> i32 {
    i32::from(kills) * (80 + i32::from(minute) * 4)
}

pub fn chance_with_gold(base: u8, own_gold: i32, enemy_gold: i32) -> u8 {
    let swing = ((own_gold - enemy_gold) / 100).clamp(-20, 20);
    i16::from(base)
        .saturating_add(i16::try_from(swing).unwrap_or(0))
        .clamp(0, 100) as u8
}

pub fn death_timer_seconds(minute: u16) -> u16 {
    if minute <= 10 {
        15
    } else if minute >= 35 {
        45
    } else {
        15 + (minute - 10)
    }
}

fn chain_scale(minute: u16) -> u8 {
    if minute <= 10 {
        1
    } else if minute >= 35 {
        4
    } else {
        u8::try_from(1 + ((minute - 10) * 3) / 25).unwrap_or(4)
    }
}

#[cfg(test)]
mod tests {
    use super::{chance_with_gold, death_timer_seconds, gold_from_kills, steps_from_deaths};

    #[test]
    fn the_same_four_for_one_opens_one_step_at_ten_and_four_at_thirty_five() {
        assert_eq!(steps_from_deaths(10, 4), 1);
        assert_eq!(steps_from_deaths(35, 4), 4);
        assert!(steps_from_deaths(35, 4) > steps_from_deaths(10, 4));
    }

    #[test]
    fn one_death_at_thirty_five_opens_more_than_one_death_at_ten() {
        assert_eq!(steps_from_deaths(10, 1), 0);
        assert_eq!(steps_from_deaths(35, 1), 1);
        assert!(steps_from_deaths(35, 1) > steps_from_deaths(10, 1));
    }

    #[test]
    fn gold_from_a_later_fight_is_heavier_and_lifts_the_next_chance() {
        assert!(gold_from_kills(35, 4) > gold_from_kills(10, 4));
        let base = 50;
        let richer = chance_with_gold(base, gold_from_kills(10, 4), 0);
        assert!(richer > chance_with_gold(base, 0, 0));
        assert_eq!(chance_with_gold(base, 0, 0), base);
    }

    #[test]
    fn a_death_timer_is_longer_in_the_late_game() {
        assert!(death_timer_seconds(35) > death_timer_seconds(10));
    }
}
