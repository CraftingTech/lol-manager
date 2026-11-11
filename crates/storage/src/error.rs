use domain::PlayerError;
use rusqlite::Error as SqlError;

#[derive(Debug)]
pub enum StoreError {
    Sql(SqlError),
    InvalidScore(i64),
    InvalidValue(String),
    Player(PlayerError),
    NotFound,
}

impl From<SqlError> for StoreError {
    fn from(error: SqlError) -> Self {
        Self::Sql(error)
    }
}

impl From<PlayerError> for StoreError {
    fn from(error: PlayerError) -> Self {
        Self::Player(error)
    }
}
