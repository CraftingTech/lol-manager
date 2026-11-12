use crate::error::StoreError;
use domain::{
    AspirationEffect, AspirationType, LeagueTier, Role, RoleSkill, SalaryCap, Score,
    SeasonPresence, SeriesLength, StaffRole, Tag,
};

pub fn score_from(value: i64) -> Result<Score, StoreError> {
    let byte = u8::try_from(value).map_err(|_| StoreError::InvalidScore(value))?;
    Score::new(byte).ok_or(StoreError::InvalidScore(value))
}

pub fn aspiration_type_to_sql(kind: AspirationType) -> &'static str {
    match kind {
        AspirationType::SatisfyingTitle => "satisfying_title",
        AspirationType::RetirementAge => "retirement_age",
        AspirationType::WantsAgent => "wants_agent",
    }
}

pub fn aspiration_type_from_sql(value: &str) -> Result<AspirationType, StoreError> {
    match value {
        "satisfying_title" => Ok(AspirationType::SatisfyingTitle),
        "retirement_age" => Ok(AspirationType::RetirementAge),
        "wants_agent" => Ok(AspirationType::WantsAgent),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn aspiration_effect_from_sql(value: &str) -> Result<AspirationEffect, StoreError> {
    match value {
        "compares_to_palmares" => Ok(AspirationEffect::ComparesToPalmares),
        "weighs_on_signing" => Ok(AspirationEffect::WeighsOnSigning),
        "closes_contract" => Ok(AspirationEffect::ClosesContract),
        "talk_through_agent" => Ok(AspirationEffect::TalkThroughAgent),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn role_to_sql(role: Role) -> &'static str {
    match role {
        Role::Top => "top",
        Role::Jungle => "jungle",
        Role::Mid => "mid",
        Role::Adc => "adc",
        Role::Support => "support",
    }
}

pub fn role_from_sql(value: &str) -> Result<Role, StoreError> {
    match value {
        "top" => Ok(Role::Top),
        "jungle" => Ok(Role::Jungle),
        "mid" => Ok(Role::Mid),
        "adc" => Ok(Role::Adc),
        "support" => Ok(Role::Support),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn skill_kind(skill: RoleSkill) -> &'static str {
    match skill {
        RoleSkill::Laning(_) => "laning",
        RoleSkill::Pathing(_) => "pathing",
    }
}

pub fn skill_score(skill: RoleSkill) -> u8 {
    match skill {
        RoleSkill::Laning(score) | RoleSkill::Pathing(score) => score.value(),
    }
}

pub fn skill_from_sql(kind: &str, score: Score) -> Result<RoleSkill, StoreError> {
    match kind {
        "laning" => Ok(RoleSkill::Laning(score)),
        "pathing" => Ok(RoleSkill::Pathing(score)),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn tag_to_sql(tag: Tag) -> &'static str {
    match tag {
        Tag::Potentiel => "potentiel",
        Tag::Leader => "leader",
        Tag::Regulier => "regulier",
        Tag::Rookie => "rookie",
        Tag::TeteDaffiche => "tete_daffiche",
    }
}

pub fn tag_from_sql(value: &str) -> Result<Tag, StoreError> {
    match value {
        "potentiel" => Ok(Tag::Potentiel),
        "leader" => Ok(Tag::Leader),
        "regulier" => Ok(Tag::Regulier),
        "rookie" => Ok(Tag::Rookie),
        "tete_daffiche" => Ok(Tag::TeteDaffiche),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn tier_to_sql(tier: LeagueTier) -> &'static str {
    match tier {
        LeagueTier::Primary => "primary",
        LeagueTier::Secondary => "secondary",
    }
}

pub fn tier_from_sql(value: &str) -> Result<LeagueTier, StoreError> {
    match value {
        "primary" => Ok(LeagueTier::Primary),
        "secondary" => Ok(LeagueTier::Secondary),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn presence_to_sql(presence: SeasonPresence) -> &'static str {
    match presence {
        SeasonPresence::InWorld => "in_world",
        SeasonPresence::Playable => "playable",
    }
}

pub fn presence_from_sql(value: &str) -> Result<SeasonPresence, StoreError> {
    match value {
        "in_world" => Ok(SeasonPresence::InWorld),
        "playable" => Ok(SeasonPresence::Playable),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn series_to_sql(series: SeriesLength) -> &'static str {
    match series {
        SeriesLength::SingleGame => "single_game",
        SeriesLength::TwoGames => "two_games",
        SeriesLength::FirstToThree => "first_to_three",
    }
}

pub fn series_from_sql(value: &str) -> Result<SeriesLength, StoreError> {
    match value {
        "single_game" => Ok(SeriesLength::SingleGame),
        "two_games" => Ok(SeriesLength::TwoGames),
        "first_to_three" => Ok(SeriesLength::FirstToThree),
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn cap_to_sql(cap: Option<SalaryCap>) -> (Option<&'static str>, Option<i64>) {
    match cap {
        None => (None, None),
        Some(SalaryCap::Hard { amount }) => (Some("hard"), amount),
        Some(SalaryCap::Soft { amount }) => (Some("soft"), amount),
    }
}

pub fn cap_from_sql(
    kind: Option<String>,
    amount: Option<i64>,
) -> Result<Option<SalaryCap>, StoreError> {
    match kind.as_deref() {
        None => Ok(None),
        Some("hard") => Ok(Some(SalaryCap::Hard { amount })),
        Some("soft") => Ok(Some(SalaryCap::Soft { amount })),
        Some(other) => Err(StoreError::InvalidValue(other.to_string())),
    }
}

pub fn staff_role_to_sql(role: StaffRole) -> (&'static str, Option<&'static str>) {
    match role {
        StaffRole::AssistantCoach => ("assistant_coach", None),
        StaffRole::Analyst => ("analyst", None),
        StaffRole::MentalCoach => ("mental_coach", None),
        StaffRole::Positional(coach) => ("positional", Some(role_to_sql(coach.role))),
    }
}

pub fn staff_role_from_sql(
    role: &str,
    positional: Option<String>,
) -> Result<StaffRole, StoreError> {
    match role {
        "assistant_coach" => Ok(StaffRole::AssistantCoach),
        "analyst" => Ok(StaffRole::Analyst),
        "mental_coach" => Ok(StaffRole::MentalCoach),
        "positional" => {
            let value = positional.ok_or_else(|| StoreError::InvalidValue("positional".into()))?;
            Ok(StaffRole::Positional(domain::PositionalCoach {
                role: role_from_sql(&value)?,
            }))
        }
        other => Err(StoreError::InvalidValue(other.to_string())),
    }
}
