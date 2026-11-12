use crate::ids::ChampionId;
use crate::score::Score;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Champion {
    pub id: ChampionId,
    pub name: String,
    pub portrait: Option<String>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct DamageSliders {
    pub attack: Score,
    pub ability: Score,
    pub true_damage: Score,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TankinessSliders {
    pub health: Score,
    pub armor: Score,
    pub magic_resist: Score,
}

#[cfg(test)]
mod tests {
    use super::{Champion, DamageSliders, TankinessSliders};
    use crate::ids::ChampionId;
    use crate::score::Score;

    #[test]
    fn champion_is_id_and_name() {
        let champion = Champion {
            id: ChampionId(uuid::Uuid::from_u128(12)),
            name: "Ahri".into(),
            portrait: None,
        };
        assert_eq!(champion.id, ChampionId(uuid::Uuid::from_u128(12)));
        assert_eq!(champion.name, "Ahri");
        assert!(champion.portrait.is_none());
    }

    #[test]
    fn sliders_hold_scores() {
        let damage = DamageSliders {
            attack: Score::new(40).unwrap(),
            ability: Score::new(70).unwrap(),
            true_damage: Score::new(10).unwrap(),
        };
        let tankiness = TankinessSliders {
            health: Score::new(30).unwrap(),
            armor: Score::new(20).unwrap(),
            magic_resist: Score::new(25).unwrap(),
        };
        assert_eq!(damage.attack.value(), 40);
        assert_eq!(tankiness.magic_resist.value(), 25);
    }
}
