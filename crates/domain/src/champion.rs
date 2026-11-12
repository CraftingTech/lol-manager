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

/// Which way a high itemisation score leans the kit. No item is named.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MatchupPlan {
    Armor,
    MagicResist,
    Ability,
    Attack,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct KitProfile {
    pub damage: DamageSliders,
    pub tankiness: TankinessSliders,
}

impl KitProfile {
    /// Effective scores for one game. The stored kit stays the base.
    /// Itemisation 0 keeps the comfort profile. A higher score leans `plan`.
    pub fn orient(self, itemisation: Score, plan: MatchupPlan) -> Self {
        let step = i16::from(itemisation.value()) / 5;
        let mut damage = self.damage;
        let mut tankiness = self.tankiness;
        match plan {
            MatchupPlan::Armor => tankiness.armor = tankiness.armor.saturating_add(step),
            MatchupPlan::MagicResist => {
                tankiness.magic_resist = tankiness.magic_resist.saturating_add(step);
            }
            MatchupPlan::Ability => damage.ability = damage.ability.saturating_add(step),
            MatchupPlan::Attack => damage.attack = damage.attack.saturating_add(step),
        }
        Self { damage, tankiness }
    }
}

#[cfg(test)]
mod tests {
    use super::{Champion, DamageSliders, KitProfile, MatchupPlan, TankinessSliders};
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

    #[test]
    fn itemisation_leans_the_kit_and_names_no_item() {
        let base = KitProfile {
            damage: DamageSliders {
                attack: Score::new(40).unwrap(),
                ability: Score::new(20).unwrap(),
                true_damage: Score::new(0).unwrap(),
            },
            tankiness: TankinessSliders {
                health: Score::new(70).unwrap(),
                armor: Score::new(80).unwrap(),
                magic_resist: Score::new(30).unwrap(),
            },
        };
        let comfort = base.orient(Score::new(0).unwrap(), MatchupPlan::Ability);
        assert_eq!(comfort, base);
        let burst = base.orient(Score::new(100).unwrap(), MatchupPlan::Ability);
        assert!(burst.damage.ability.value() > base.damage.ability.value());
        assert_eq!(burst.tankiness.armor, base.tankiness.armor);
        let armored = base.orient(Score::new(100).unwrap(), MatchupPlan::Armor);
        assert!(armored.tankiness.armor.value() > base.tankiness.armor.value());
        assert_eq!(armored.damage.ability, base.damage.ability);
    }
}
