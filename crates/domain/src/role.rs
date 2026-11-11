use crate::score::Score;

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Role {
    Top,
    Jungle,
    Mid,
    Adc,
    Support,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RoleSkill {
    Laning(Score),
    Pathing(Score),
}

impl RoleSkill {
    pub fn for_role(role: Role, score: Score) -> Self {
        match role {
            Role::Jungle => Self::Pathing(score),
            Role::Top | Role::Mid | Role::Adc | Role::Support => Self::Laning(score),
        }
    }

    pub fn fits(self, role: Role) -> bool {
        matches!(
            (role, self),
            (Role::Jungle, Self::Pathing(_))
                | (Role::Top | Role::Mid | Role::Adc | Role::Support, Self::Laning(_))
        )
    }
}

#[cfg(test)]
mod tests {
    use super::{Role, RoleSkill};
    use crate::score::Score;

    #[test]
    fn jungle_paths_and_lanes_do_not() {
        let score = Score::new(40).unwrap();
        assert!(matches!(RoleSkill::for_role(Role::Jungle, score), RoleSkill::Pathing(_)));
        assert!(matches!(RoleSkill::for_role(Role::Mid, score), RoleSkill::Laning(_)));
        assert!(!RoleSkill::Laning(score).fits(Role::Jungle));
        assert!(RoleSkill::Pathing(score).fits(Role::Jungle));
    }
}
