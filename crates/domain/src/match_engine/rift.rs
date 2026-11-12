#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Side {
    Blue,
    Red,
}

impl Side {
    pub fn enemy(self) -> Self {
        match self {
            Self::Blue => Self::Red,
            Self::Red => Self::Blue,
        }
    }

    pub fn label(self) -> &'static str {
        match self {
            Self::Blue => "bleu",
            Self::Red => "rouge",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Lane {
    Top,
    Mid,
    Bot,
}

impl Lane {
    fn index(self) -> usize {
        match self {
            Self::Top => 0,
            Self::Mid => 1,
            Self::Bot => 2,
        }
    }

    pub fn label(self) -> &'static str {
        match self {
            Self::Top => "top",
            Self::Mid => "mid",
            Self::Bot => "bot",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum NexusSide {
    Left,
    Right,
}

impl NexusSide {
    fn index(self) -> usize {
        match self {
            Self::Left => 0,
            Self::Right => 1,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Building {
    Outer(Lane),
    Inner(Lane),
    InhibitorTurret(Lane),
    Inhibitor(Lane),
    NexusTurret(NexusSide),
    Nexus,
}

impl Building {
    pub fn label(self) -> &'static str {
        match self {
            Self::Outer(lane) => match lane {
                Lane::Top => "tour extérieure top",
                Lane::Mid => "tour extérieure mid",
                Lane::Bot => "tour extérieure bot",
            },
            Self::Inner(lane) => match lane {
                Lane::Top => "tour intérieure top",
                Lane::Mid => "tour intérieure mid",
                Lane::Bot => "tour intérieure bot",
            },
            Self::InhibitorTurret(lane) => match lane {
                Lane::Top => "tour d'inhibiteur top",
                Lane::Mid => "tour d'inhibiteur mid",
                Lane::Bot => "tour d'inhibiteur bot",
            },
            Self::Inhibitor(lane) => match lane {
                Lane::Top => "inhibiteur top",
                Lane::Mid => "inhibiteur mid",
                Lane::Bot => "inhibiteur bot",
            },
            Self::NexusTurret(NexusSide::Left) => "tour du nexus gauche",
            Self::NexusTurret(NexusSide::Right) => "tour du nexus droite",
            Self::Nexus => "nexus",
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum StructureState {
    Locked,
    Standing,
    Destroyed,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
struct Timed {
    state: StructureState,
    down_for: u16,
}

impl Timed {
    fn locked() -> Self {
        Self {
            state: StructureState::Locked,
            down_for: 0,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
struct LaneState {
    outer: StructureState,
    inner: StructureState,
    inhibitor_turret: StructureState,
    inhibitor: Timed,
}

impl LaneState {
    fn fresh() -> Self {
        Self {
            outer: StructureState::Standing,
            inner: StructureState::Locked,
            inhibitor_turret: StructureState::Locked,
            inhibitor: Timed::locked(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Rift {
    lanes: [LaneState; 3],
    nexus_turrets: [Timed; 2],
    nexus: StructureState,
}

impl Rift {
    pub fn new() -> Self {
        Self {
            lanes: [LaneState::fresh(), LaneState::fresh(), LaneState::fresh()],
            nexus_turrets: [Timed::locked(), Timed::locked()],
            nexus: StructureState::Locked,
        }
    }

    pub fn state(&self, building: Building) -> StructureState {
        match building {
            Building::Outer(lane) => self.lanes[lane.index()].outer,
            Building::Inner(lane) => self.lanes[lane.index()].inner,
            Building::InhibitorTurret(lane) => self.lanes[lane.index()].inhibitor_turret,
            Building::Inhibitor(lane) => self.lanes[lane.index()].inhibitor.state,
            Building::NexusTurret(side) => self.nexus_turrets[side.index()].state,
            Building::Nexus => self.nexus,
        }
    }

    pub fn nexus_fallen(&self) -> bool {
        self.nexus == StructureState::Destroyed
    }

    pub fn next_available(&self) -> Option<Building> {
        for lane in [Lane::Mid, Lane::Top, Lane::Bot] {
            for building in lane_chain(lane) {
                match self.state(building) {
                    StructureState::Destroyed => continue,
                    StructureState::Standing => return Some(building),
                    StructureState::Locked => break,
                }
            }
        }
        for side in [NexusSide::Left, NexusSide::Right] {
            if self.state(Building::NexusTurret(side)) == StructureState::Standing {
                return Some(Building::NexusTurret(side));
            }
        }
        if self.nexus == StructureState::Standing {
            Some(Building::Nexus)
        } else {
            None
        }
    }

    pub fn attempt(&mut self, building: Building) -> bool {
        if self.state(building) != StructureState::Standing {
            return false;
        }
        self.destroy(building);
        true
    }

    pub fn take(&mut self, steps: u8) -> (Vec<Building>, Vec<String>) {
        let before = self.clone();
        let mut taken = Vec::new();
        for _ in 0..steps {
            let Some(building) = self.next_available() else {
                break;
            };
            self.destroy(building);
            taken.push(building);
            if building == Building::Nexus {
                break;
            }
        }
        let unlocked = every_building()
            .into_iter()
            .filter(|building| {
                before.state(*building) == StructureState::Locked
                    && self.state(*building) == StructureState::Standing
            })
            .map(Building::label)
            .map(str::to_string)
            .collect();
        (taken, unlocked)
    }

    pub fn tick(&mut self, seconds: u16, respawn_after: Option<u16>) {
        let Some(limit) = respawn_after else {
            return;
        };
        if limit == 0 {
            return;
        }
        for lane in &mut self.lanes {
            revive(&mut lane.inhibitor, seconds, limit);
        }
        for turret in &mut self.nexus_turrets {
            revive(turret, seconds, limit);
        }
        self.refresh_nexus();
    }

    fn destroy(&mut self, building: Building) {
        self.write(building, StructureState::Destroyed);
        match building {
            Building::Outer(lane) => self.unlock(Building::Inner(lane)),
            Building::Inner(lane) => self.unlock(Building::InhibitorTurret(lane)),
            Building::InhibitorTurret(lane) => self.unlock(Building::Inhibitor(lane)),
            Building::Inhibitor(_) => {
                self.unlock(Building::NexusTurret(NexusSide::Left));
                self.unlock(Building::NexusTurret(NexusSide::Right));
                self.refresh_nexus();
            }
            Building::NexusTurret(_) => self.refresh_nexus(),
            Building::Nexus => {}
        }
    }

    fn unlock(&mut self, building: Building) {
        if self.state(building) == StructureState::Locked {
            self.write(building, StructureState::Standing);
        }
    }

    fn write(&mut self, building: Building, state: StructureState) {
        match building {
            Building::Outer(lane) => self.lanes[lane.index()].outer = state,
            Building::Inner(lane) => self.lanes[lane.index()].inner = state,
            Building::InhibitorTurret(lane) => self.lanes[lane.index()].inhibitor_turret = state,
            Building::Inhibitor(lane) => {
                let inhibitor = &mut self.lanes[lane.index()].inhibitor;
                inhibitor.state = state;
                if state == StructureState::Destroyed {
                    inhibitor.down_for = 0;
                }
            }
            Building::NexusTurret(side) => {
                let turret = &mut self.nexus_turrets[side.index()];
                turret.state = state;
                if state == StructureState::Destroyed {
                    turret.down_for = 0;
                }
            }
            Building::Nexus => self.nexus = state,
        }
    }

    fn any_inhibitor_destroyed(&self) -> bool {
        self.lanes
            .iter()
            .any(|lane| lane.inhibitor.state == StructureState::Destroyed)
    }

    fn refresh_nexus(&mut self) {
        if self.nexus == StructureState::Destroyed {
            return;
        }
        if !self.any_inhibitor_destroyed() {
            for turret in &mut self.nexus_turrets {
                if turret.state == StructureState::Standing {
                    turret.state = StructureState::Locked;
                }
            }
            if self.nexus == StructureState::Standing {
                self.nexus = StructureState::Locked;
            }
            return;
        }
        let both_turrets_down = self
            .nexus_turrets
            .iter()
            .all(|turret| turret.state == StructureState::Destroyed);
        if both_turrets_down && self.nexus == StructureState::Locked {
            self.nexus = StructureState::Standing;
        }
    }
}

fn revive(timed: &mut Timed, seconds: u16, limit: u16) {
    if timed.state != StructureState::Destroyed {
        return;
    }
    timed.down_for = timed.down_for.saturating_add(seconds);
    if timed.down_for >= limit {
        timed.state = StructureState::Standing;
        timed.down_for = 0;
    }
}

fn lane_chain(lane: Lane) -> [Building; 4] {
    [
        Building::Outer(lane),
        Building::Inner(lane),
        Building::InhibitorTurret(lane),
        Building::Inhibitor(lane),
    ]
}

fn every_building() -> [Building; 15] {
    [
        Building::Outer(Lane::Top),
        Building::Outer(Lane::Mid),
        Building::Outer(Lane::Bot),
        Building::Inner(Lane::Top),
        Building::Inner(Lane::Mid),
        Building::Inner(Lane::Bot),
        Building::InhibitorTurret(Lane::Top),
        Building::InhibitorTurret(Lane::Mid),
        Building::InhibitorTurret(Lane::Bot),
        Building::Inhibitor(Lane::Top),
        Building::Inhibitor(Lane::Mid),
        Building::Inhibitor(Lane::Bot),
        Building::NexusTurret(NexusSide::Left),
        Building::NexusTurret(NexusSide::Right),
        Building::Nexus,
    ]
}

#[cfg(test)]
mod tests {
    use super::{Building, Lane, NexusSide, Rift, StructureState};

    #[test]
    fn an_inner_tower_stays_locked_while_its_outer_stands() {
        let mut rift = Rift::new();
        let inner = Building::Inner(Lane::Mid);
        assert_eq!(rift.state(inner), StructureState::Locked);
        assert!(!rift.attempt(inner));
        assert_eq!(rift.state(inner), StructureState::Locked);
        assert!(rift.attempt(Building::Outer(Lane::Mid)));
        assert_eq!(rift.state(inner), StructureState::Standing);
    }

    #[test]
    fn nexus_turrets_stay_locked_until_an_inhibitor_falls() {
        let mut rift = Rift::new();
        let turret = Building::NexusTurret(NexusSide::Left);
        assert!(!rift.attempt(turret));
        let (taken, _) = rift.take(4);
        assert!(taken.contains(&Building::Inhibitor(Lane::Mid)));
        assert_eq!(rift.state(turret), StructureState::Standing);
    }

    #[test]
    fn the_nexus_stays_locked_while_either_turret_stands() {
        let mut rift = Rift::new();
        assert!(!rift.attempt(Building::Nexus));
        rift.take(4);
        assert_eq!(rift.state(Building::Nexus), StructureState::Locked);
        assert!(rift.attempt(Building::NexusTurret(NexusSide::Left)));
        assert!(!rift.attempt(Building::Nexus));
        assert!(rift.attempt(Building::NexusTurret(NexusSide::Right)));
        assert_eq!(rift.state(Building::Nexus), StructureState::Standing);
        assert!(rift.attempt(Building::Nexus));
        assert!(rift.nexus_fallen());
    }

    #[test]
    fn a_destroyed_inhibitor_stays_down_without_a_respawn_duration() {
        let mut rift = Rift::new();
        rift.take(4);
        let inhibitor = Building::Inhibitor(Lane::Mid);
        assert_eq!(rift.state(inhibitor), StructureState::Destroyed);
        rift.tick(600, None);
        assert_eq!(rift.state(inhibitor), StructureState::Destroyed);
    }

    #[test]
    fn a_respawned_inhibitor_locks_the_nexus_again() {
        let mut rift = Rift::new();
        rift.take(4);
        assert!(rift.attempt(Building::NexusTurret(NexusSide::Left)));
        assert!(rift.attempt(Building::NexusTurret(NexusSide::Right)));
        assert_eq!(rift.state(Building::Nexus), StructureState::Standing);
        rift.tick(60, Some(60));
        assert_eq!(
            rift.state(Building::Inhibitor(Lane::Mid)),
            StructureState::Standing
        );
        assert_eq!(rift.state(Building::Nexus), StructureState::Locked);
        assert!(!rift.nexus_fallen());
    }

    #[test]
    fn steps_cannot_take_a_building_that_is_still_locked() {
        let mut rift = Rift::new();
        let (taken, unlocked) = rift.take(1);
        assert_eq!(taken, vec![Building::Outer(Lane::Mid)]);
        assert!(unlocked.iter().any(|name| name.contains("intérieure mid")));
        assert!(!taken.contains(&Building::Nexus));
        assert!(!rift.nexus_fallen());
    }
}
