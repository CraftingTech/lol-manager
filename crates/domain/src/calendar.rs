#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct CalendarDate {
    year: i32,
    month: u8,
    day: u8,
}

impl CalendarDate {
    pub const CAREER_OPENING: Self = Self {
        year: 2014,
        month: 1,
        day: 1,
    };

    pub fn new(year: i32, month: u8, day: u8) -> Option<Self> {
        let day_exists = day >= 1 && day <= days_in_month(year, month);
        day_exists.then_some(Self { year, month, day })
    }

    pub fn parse(text: &str) -> Option<Self> {
        let mut parts = text.split('-');
        let year = parts.next()?.parse().ok()?;
        let month = parts.next()?.parse().ok()?;
        let day = parts.next()?.parse().ok()?;
        if parts.next().is_some() {
            return None;
        }
        Self::new(year, month, day)
    }

    pub fn to_iso(self) -> String {
        format!("{:04}-{:02}-{:02}", self.year, self.month, self.day)
    }

    pub fn completed_years_until(self, on: Self) -> Option<u8> {
        let mut years = on.year - self.year;
        if (on.month, on.day) < (self.month, self.day) {
            years -= 1;
        }
        u8::try_from(years).ok()
    }
}

fn days_in_month(year: i32, month: u8) -> u8 {
    match month {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        2 if is_leap(year) => 29,
        2 => 28,
        _ => 0,
    }
}

fn is_leap(year: i32) -> bool {
    year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
}

#[cfg(test)]
mod tests {
    use super::CalendarDate;

    #[test]
    fn completed_years_follow_the_birthday() {
        let faker = CalendarDate::parse("1996-05-07").unwrap();
        assert_eq!(faker.completed_years_until(CalendarDate::CAREER_OPENING), Some(17));
        assert_eq!(
            faker.completed_years_until(CalendarDate::parse("2014-05-07").unwrap()),
            Some(18)
        );
        assert!(CalendarDate::parse("2014-02-29").is_none());
        assert!(CalendarDate::parse("2000-02-29").is_some());
    }
}
