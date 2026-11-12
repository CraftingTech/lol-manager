#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Tag {
    Potentiel,
    Leader,
    Regulier,
    Rookie,
    TeteDaffiche,
}

impl Tag {
    pub fn impact(self) -> &'static str {
        match self {
            Self::Potentiel => "À entraînement égal, les compétences montent plus vite.",
            Self::Leader => {
                "Après une défaite, la forme de l'équipe tombe moins s'il était sur le rift."
            }
            Self::Regulier => "Sa forme bouge peu d'une semaine à l'autre.",
            Self::Rookie => {
                "Il progresse plus vite à l'entraînement, et en match à élimination directe son mental effectif baisse."
            }
            Self::TeteDaffiche => {
                "L'adversaire le priorise en draft, et la notoriété de l'équipe monte quand il joue."
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::Tag;

    #[test]
    fn tags_cover_the_five_labels() {
        let tags = [
            Tag::Potentiel,
            Tag::Leader,
            Tag::Regulier,
            Tag::Rookie,
            Tag::TeteDaffiche,
        ];
        assert_eq!(tags.len(), 5);
        assert_ne!(Tag::Rookie, Tag::TeteDaffiche);
        for tag in tags {
            assert!(!tag.impact().is_empty());
        }
    }
}
