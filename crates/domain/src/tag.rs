#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Tag {
    Potentiel,
    Leader,
    Regulier,
    Rookie,
    TeteDaffiche,
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
    }
}
