use std::path::PathBuf;

use crate::draft::{DraftSide, MapZone, MatchDesk};
use domain::{Building, Lane, NexusSide, Role};
use gpui::{
    canvas, point, px, quad, rgb, size, App, BorderStyle, Bounds, Corners, Hsla, ImgResourceLoader,
    IntoElement, Pixels, Point, Resource, SharedString, Styled, TextRun, Window,
};

const SOURCE_W: f32 = 2048.0;
const SOURCE_H: f32 = 1457.0;
const BLUE: u32 = 0x6ea8e8;
const RED: u32 = 0xe07a7a;
const DOWN: u32 = 0x1a120c;
const INK: u32 = 0xe8e6e3;
const FIELD: u32 = 0x12141a;

pub fn element(desk: &MatchDesk, map_path: PathBuf) -> impl IntoElement {
    let snapshot = Snapshot::from_desk(desk, map_path);
    canvas(
        |_, _, _| (),
        move |bounds, _, window, cx| snapshot.paint(bounds, window, cx),
    )
    .size_full()
}

struct Snapshot {
    minute: String,
    map_path: PathBuf,
    structures: Vec<StructureMark>,
    units: Vec<PlacedUnit>,
    pulse: Option<(f32, f32, DraftSide)>,
}

struct StructureMark {
    at: (f32, f32),
    kind: MarkKind,
    down: bool,
}

#[derive(Clone, Copy)]
enum MarkKind {
    Tower,
    Inhibitor,
    Nexus,
}

struct PlacedUnit {
    at: (f32, f32),
    side: DraftSide,
    label: String,
    portrait: Option<PathBuf>,
}

impl Snapshot {
    fn from_desk(desk: &MatchDesk, map_path: PathBuf) -> Self {
        let frame = desk.frames.get(desk.playback_frame);
        let minute = frame
            .map(|frame| format!("{} min", frame.minute))
            .unwrap_or_else(|| "Faille".into());
        let structures = ALL_BUILDINGS
            .into_iter()
            .map(|(side, building)| StructureMark {
                at: structure_at(side, building),
                kind: mark_kind(building),
                down: is_down(desk, side, building),
            })
            .collect();
        let units = desk
            .units
            .iter()
            .map(|unit| PlacedUnit {
                at: unit_at(desk, unit.side, unit.role),
                side: unit.side,
                label: unit.label.clone(),
                portrait: unit.portrait.clone(),
            })
            .collect();
        let pulse = frame.and_then(|frame| {
            if approach(desk.playback_travel) <= 0.15 {
                None
            } else {
                let side = frame
                    .movers
                    .first()
                    .map(|(side, _)| *side)
                    .unwrap_or(DraftSide::Blue);
                let (x, y) = zone_at(frame.zone);
                Some((x, y, side))
            }
        });
        Self {
            minute,
            map_path,
            structures,
            units,
            pulse,
        }
    }

    fn paint(&self, bounds: Bounds<Pixels>, window: &mut Window, cx: &mut App) {
        window.paint_quad(fill(bounds, px(0.0), rgb(FIELD)));
        let image = load_image(window, cx, &self.map_path);
        let aspect = image
            .as_ref()
            .map(|frame| {
                let pixels = frame.size(0);
                pixels.width.0 as f32 / pixels.height.0.max(1) as f32
            })
            .unwrap_or(SOURCE_W / SOURCE_H);
        let placed = contain(bounds, aspect);
        if let Some(frame) = image {
            let _ = window.paint_image(placed, Corners::all(px(0.0)), frame, 0, false);
        }
        if let Some((x, y, side)) = self.pulse {
            disc(
                window,
                at(placed, x, y),
                px(width_of(placed) * 0.055),
                rgb(if side == DraftSide::Blue {
                    0x3d6ea8
                } else {
                    0xa85a5a
                }),
            );
        }
        for structure in &self.structures {
            if !structure.down {
                continue;
            }
            let center = at(placed, structure.at.0, structure.at.1);
            let radius = px(width_of(placed) * structure.kind.scale());
            disc(window, center, radius, rgb(DOWN));
        }
        for unit in &self.units {
            let center = at(placed, unit.at.0, unit.at.1);
            let radius = px(width_of(placed) * 0.028);
            disc(window, center, radius + px(2.0), rgb(side_color(unit.side)));
            if let Some(path) = unit.portrait.as_ref() {
                if let Some(portrait) = load_image(window, cx, path) {
                    let edge = radius * 2.0;
                    let _ = window.paint_image(
                        Bounds {
                            origin: point(center.x - radius, center.y - radius),
                            size: size(edge, edge),
                        },
                        Corners::all(radius),
                        portrait,
                        0,
                        false,
                    );
                    continue;
                }
            }
            paint_label(window, cx, center, &unit.label);
        }
        paint_label(
            window,
            cx,
            point(
                placed.origin.x + placed.size.width / 2.0,
                placed.origin.y + px(16.0),
            ),
            &self.minute,
        );
    }
}

fn load_image(
    window: &mut Window,
    cx: &mut App,
    path: &PathBuf,
) -> Option<std::sync::Arc<gpui::RenderImage>> {
    window
        .use_asset::<ImgResourceLoader>(&Resource::from(path.clone()), cx)
        .and_then(Result::ok)
}

fn is_down(desk: &MatchDesk, side: DraftSide, building: Building) -> bool {
    let mark = (side, building);
    let already = desk
        .playback_frame
        .checked_sub(1)
        .and_then(|index| desk.frames.get(index))
        .is_some_and(|frame| frame.fallen.contains(&mark));
    let revealed = desk
        .frames
        .get(desk.playback_frame)
        .is_some_and(|frame| frame.fallen.contains(&mark))
        && desk.playback_travel >= 0.55;
    already || revealed
}

fn unit_at(desk: &MatchDesk, side: DraftSide, role: Role) -> (f32, f32) {
    let home = home(side, role);
    let Some(frame) = desk.frames.get(desk.playback_frame) else {
        return home;
    };
    let Some(index) = frame.movers.iter().position(|mover| *mover == (side, role)) else {
        return home;
    };
    let destination = spread(frame.zone, index, frame.movers.len());
    lerp(home, destination, approach(desk.playback_travel))
}

fn approach(travel: f32) -> f32 {
    if travel < 0.7 {
        travel / 0.7
    } else if travel < 1.15 {
        1.0
    } else {
        ((1.7 - travel) / 0.55).clamp(0.0, 1.0)
    }
}

fn spread(zone: MapZone, index: usize, count: usize) -> (f32, f32) {
    let (x, y) = zone_at(zone);
    let angle = (index as f32 / count.max(1) as f32) * std::f32::consts::TAU;
    (x + angle.cos() * 70.0, y + angle.sin() * 70.0)
}

fn lerp(from: (f32, f32), to: (f32, f32), t: f32) -> (f32, f32) {
    (from.0 + (to.0 - from.0) * t, from.1 + (to.1 - from.1) * t)
}

fn contain(bounds: Bounds<Pixels>, aspect: f32) -> Bounds<Pixels> {
    let view = width_of(bounds) / height_of(bounds).max(1.0);
    if aspect > view {
        let width = bounds.size.width;
        let height = px(width_of(bounds) / aspect);
        Bounds {
            origin: point(
                bounds.origin.x,
                bounds.origin.y + (bounds.size.height - height) / 2.0,
            ),
            size: size(width, height),
        }
    } else {
        let height = bounds.size.height;
        let width = px(height_of(bounds) * aspect);
        Bounds {
            origin: point(
                bounds.origin.x + (bounds.size.width - width) / 2.0,
                bounds.origin.y,
            ),
            size: size(width, height),
        }
    }
}

fn at(image: Bounds<Pixels>, x: f32, y: f32) -> Point<Pixels> {
    point(
        image.origin.x + image.size.width * (x / SOURCE_W),
        image.origin.y + image.size.height * (y / SOURCE_H),
    )
}

fn width_of(bounds: Bounds<Pixels>) -> f32 {
    f32::from(bounds.size.width)
}

fn height_of(bounds: Bounds<Pixels>) -> f32 {
    f32::from(bounds.size.height)
}

fn fill(bounds: Bounds<Pixels>, radius: Pixels, color: gpui::Rgba) -> gpui::PaintQuad {
    quad(
        bounds,
        radius,
        color,
        px(0.0),
        rgb(0x00000000),
        BorderStyle::default(),
    )
}

fn disc(window: &mut Window, center: Point<Pixels>, radius: Pixels, color: gpui::Rgba) {
    let bounds = Bounds {
        origin: point(center.x - radius, center.y - radius),
        size: size(radius * 2.0, radius * 2.0),
    };
    window.paint_quad(quad(
        bounds,
        radius,
        color,
        px(1.0),
        rgb(INK),
        BorderStyle::default(),
    ));
}

fn paint_label(window: &mut Window, cx: &mut App, center: Point<Pixels>, text: &str) {
    if text.is_empty() {
        return;
    }
    let style = window.text_style();
    let text = SharedString::from(text.to_string());
    let run = TextRun {
        len: text.len(),
        font: style.font(),
        color: label_ink(),
        background_color: None,
        underline: None,
        strikethrough: None,
    };
    let line = window
        .text_system()
        .shape_line(text, px(11.0), &[run], None);
    let origin = point(center.x - line.width / 2.0, center.y - px(6.0));
    let _ = line.paint(origin, px(14.0), window, cx);
}

fn label_ink() -> Hsla {
    rgb(INK).into()
}

fn side_color(side: DraftSide) -> u32 {
    match side {
        DraftSide::Blue => BLUE,
        DraftSide::Red => RED,
    }
}

fn mark_kind(building: Building) -> MarkKind {
    match building {
        Building::Nexus => MarkKind::Nexus,
        Building::Inhibitor(_) => MarkKind::Inhibitor,
        Building::Outer(_)
        | Building::Inner(_)
        | Building::InhibitorTurret(_)
        | Building::NexusTurret(_) => MarkKind::Tower,
    }
}

impl MarkKind {
    fn scale(self) -> f32 {
        match self {
            Self::Tower => 0.018,
            Self::Inhibitor => 0.024,
            Self::Nexus => 0.034,
        }
    }
}

fn home(side: DraftSide, role: Role) -> (f32, f32) {
    match (side, role) {
        (DraftSide::Blue, Role::Top) => (300.0, 560.0),
        (DraftSide::Blue, Role::Jungle) => (520.0, 1040.0),
        (DraftSide::Blue, Role::Mid) => (700.0, 980.0),
        (DraftSide::Blue, Role::Adc) => (1080.0, 1240.0),
        (DraftSide::Blue, Role::Support) => (960.0, 1310.0),
        (DraftSide::Red, Role::Top) => (860.0, 150.0),
        (DraftSide::Red, Role::Jungle) => (1500.0, 420.0),
        (DraftSide::Red, Role::Mid) => (1340.0, 500.0),
        (DraftSide::Red, Role::Adc) => (1680.0, 780.0),
        (DraftSide::Red, Role::Support) => (1580.0, 860.0),
    }
}

fn zone_at(zone: MapZone) -> (f32, f32) {
    match zone {
        MapZone::Top => (530.0, 314.0),
        MapZone::Mid => (1026.0, 713.0),
        MapZone::Bot => (1558.0, 1142.0),
        MapZone::Dragon => (1240.0, 1000.0),
        MapZone::Baron => (820.0, 450.0),
        MapZone::BlueJungle => (560.0, 1000.0),
        MapZone::RedJungle => (1480.0, 460.0),
    }
}

fn structure_at(side: DraftSide, building: Building) -> (f32, f32) {
    let point = match (side, building) {
        (DraftSide::Blue, Building::Outer(Lane::Top)) => (356.0, 452.5),
        (DraftSide::Blue, Building::Inner(Lane::Top)) => (397.5, 768.5),
        (DraftSide::Blue, Building::InhibitorTurret(Lane::Top)) => (357.5, 975.5),
        (DraftSide::Blue, Building::Inhibitor(Lane::Top)) => (359.0, 1052.5),
        (DraftSide::Blue, Building::Outer(Lane::Mid)) => (866.0, 800.5),
        (DraftSide::Blue, Building::Inner(Lane::Mid)) => (779.0, 942.5),
        (DraftSide::Blue, Building::InhibitorTurret(Lane::Mid)) => (627.5, 1037.5),
        (DraftSide::Blue, Building::Inhibitor(Lane::Mid)) => (582.5, 1090.0),
        (DraftSide::Blue, Building::Outer(Lane::Bot)) => (1380.5, 1301.5),
        (DraftSide::Blue, Building::Inner(Lane::Bot)) => (989.5, 1252.5),
        (DraftSide::Blue, Building::InhibitorTurret(Lane::Bot)) => (695.0, 1265.5),
        (DraftSide::Blue, Building::Inhibitor(Lane::Bot)) => (602.5, 1271.0),
        (DraftSide::Blue, Building::NexusTurret(NexusSide::Left)) => (418.0, 1165.0),
        (DraftSide::Blue, Building::NexusTurret(NexusSide::Right)) => (465.5, 1213.0),
        (DraftSide::Blue, Building::Nexus) => (392.0, 1233.5),
        (DraftSide::Red, Building::Outer(Lane::Top)) => (703.0, 175.5),
        (DraftSide::Red, Building::Inner(Lane::Top)) => (1075.0, 218.0),
        (DraftSide::Red, Building::InhibitorTurret(Lane::Top)) => (1329.5, 201.0),
        (DraftSide::Red, Building::Inhibitor(Lane::Top)) => (1415.0, 208.0),
        (DraftSide::Red, Building::Outer(Lane::Mid)) => (1187.5, 626.5),
        (DraftSide::Red, Building::Inner(Lane::Mid)) => (1269.5, 489.5),
        (DraftSide::Red, Building::InhibitorTurret(Lane::Mid)) => (1399.5, 402.5),
        (DraftSide::Red, Building::Inhibitor(Lane::Mid)) => (1455.5, 369.5),
        (DraftSide::Red, Building::Outer(Lane::Bot)) => (1736.0, 984.0),
        (DraftSide::Red, Building::Inner(Lane::Bot)) => (1650.0, 658.5),
        (DraftSide::Red, Building::InhibitorTurret(Lane::Bot)) => (1670.5, 462.0),
        (DraftSide::Red, Building::Inhibitor(Lane::Bot)) => (1658.5, 396.5),
        (DraftSide::Red, Building::NexusTurret(NexusSide::Left)) => (1543.5, 249.5),
        (DraftSide::Red, Building::NexusTurret(NexusSide::Right)) => (1597.0, 299.5),
        (DraftSide::Red, Building::Nexus) => (1616.5, 239.0),
    };
    point
}

const ALL_BUILDINGS: [(DraftSide, Building); 30] = [
    (DraftSide::Blue, Building::Outer(Lane::Top)),
    (DraftSide::Blue, Building::Inner(Lane::Top)),
    (DraftSide::Blue, Building::InhibitorTurret(Lane::Top)),
    (DraftSide::Blue, Building::Inhibitor(Lane::Top)),
    (DraftSide::Blue, Building::Outer(Lane::Mid)),
    (DraftSide::Blue, Building::Inner(Lane::Mid)),
    (DraftSide::Blue, Building::InhibitorTurret(Lane::Mid)),
    (DraftSide::Blue, Building::Inhibitor(Lane::Mid)),
    (DraftSide::Blue, Building::Outer(Lane::Bot)),
    (DraftSide::Blue, Building::Inner(Lane::Bot)),
    (DraftSide::Blue, Building::InhibitorTurret(Lane::Bot)),
    (DraftSide::Blue, Building::Inhibitor(Lane::Bot)),
    (DraftSide::Blue, Building::NexusTurret(NexusSide::Left)),
    (DraftSide::Blue, Building::NexusTurret(NexusSide::Right)),
    (DraftSide::Blue, Building::Nexus),
    (DraftSide::Red, Building::Outer(Lane::Top)),
    (DraftSide::Red, Building::Inner(Lane::Top)),
    (DraftSide::Red, Building::InhibitorTurret(Lane::Top)),
    (DraftSide::Red, Building::Inhibitor(Lane::Top)),
    (DraftSide::Red, Building::Outer(Lane::Mid)),
    (DraftSide::Red, Building::Inner(Lane::Mid)),
    (DraftSide::Red, Building::InhibitorTurret(Lane::Mid)),
    (DraftSide::Red, Building::Inhibitor(Lane::Mid)),
    (DraftSide::Red, Building::Outer(Lane::Bot)),
    (DraftSide::Red, Building::Inner(Lane::Bot)),
    (DraftSide::Red, Building::InhibitorTurret(Lane::Bot)),
    (DraftSide::Red, Building::Inhibitor(Lane::Bot)),
    (DraftSide::Red, Building::NexusTurret(NexusSide::Left)),
    (DraftSide::Red, Building::NexusTurret(NexusSide::Right)),
    (DraftSide::Red, Building::Nexus),
];
