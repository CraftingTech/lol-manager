use std::ops::Range;
use std::path::{Path, PathBuf};

use crate::browser::{Browser, Catalog, CANVAS, GOLD, LINE, MUTED, PANEL, ROW, SELECTED, TEXT};
use crate::draft::{
    champion_damage, concrete_lineup, describe, map_frames, opponent_choice, play_draft, role_name,
    DraftSide, DraftStep, MapUnit, MatchDesk, Offer, Stage, Turn, ROSTER, SCRIPT,
};
use domain::{ChampionId, Patch, PatchObjective, Player, Role, TeamId};
use gpui::{
    div, img, prelude::*, px, rgb, uniform_list, AnyElement, Context, KeyDownEvent, MouseButton,
    ObjectFit, ScrollStrategy, StyledImage, Window,
};

const BLUE: u32 = 0x6ea8e8;
const RED: u32 = 0xe07a7a;

pub fn screen(browser: &mut Browser, window: &mut Window, cx: &mut Context<Browser>) -> AnyElement {
    if let Err(message) = &browser.catalog {
        return div()
            .flex_1()
            .h_full()
            .p(px(16.0))
            .child(ink(message.clone(), RED, false))
            .into_any_element();
    }
    if browser.desk.stage == Stage::Draft {
        answer_for_opponent(browser);
    }
    browser.desk.tick(window);
    shell(browser, cx).into_any_element()
}

fn shell(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    div()
        .flex_1()
        .min_w_0()
        .min_h_0()
        .h_full()
        .overflow_hidden()
        .flex()
        .flex_col()
        .bg(rgb(CANVAS))
        .child(masthead(browser))
        .child(body(browser, cx))
        .child(footer(&browser.desk, cx))
}

fn masthead(browser: &Browser) -> impl IntoElement {
    let version = browser
        .catalog
        .as_ref()
        .ok()
        .and_then(|catalog| catalog.patches.first())
        .map(|patch| patch.version.clone())
        .unwrap_or_else(|| "2014".into());
    let mut header = div()
        .px_3()
        .pt_3()
        .pb_2()
        .flex_shrink_0()
        .flex()
        .flex_col()
        .gap_1()
        .child(ink(format!("Match · patch {version}"), GOLD, true))
        .child(ink(status_line(browser), TEXT, true));
    if browser.desk.stage != Stage::Report {
        header = header
            .child(ink(
                "Draft 2014 : trois bans chacun, bleu en premier, puis dix picks. Le premier pick d'un côté va au top, puis jungle, mid, ADC et support.",
                MUTED,
                false,
            ))
            .child(ink(
                "Tu joues un côté. L'adversaire ban le plus gros score du patch et pick le meilleur champion encore libre pour le rôle.",
                MUTED,
                false,
            ));
    }
    header
}

fn status_line(browser: &Browser) -> String {
    let desk = &browser.desk;
    match desk.stage {
        Stage::Teams => "Choisis l'équipe bleue et l'équipe rouge.".into(),
        Stage::Draft => match desk.next_turn() {
            Some(turn) => {
                let who = if desk.human.is_some_and(|human| turn.side() == human) {
                    "À toi"
                } else {
                    "Adversaire"
                };
                format!(
                    "{who} · {} · {}/{}",
                    turn_text(browser, turn),
                    desk.steps.len() + 1,
                    SCRIPT.len()
                )
            }
            None => "Échanges ouverts. Clique deux rôles d'un même côté.".into(),
        },
        Stage::Report => desk.headline.clone().unwrap_or_else(|| "Match joué".into()),
    }
}

fn turn_text(browser: &Browser, turn: Turn) -> String {
    let Ok(catalog) = &browser.catalog else {
        return "Draft".into();
    };
    match turn {
        Turn::Ban(side) => format!("Ban · {}", side.name()),
        Turn::Pick(side, role) => {
            let player = side_team(&browser.desk, side)
                .and_then(|team| starter(catalog, team, role))
                .map(|player| player.identity.name.clone())
                .unwrap_or_else(|| "sans joueur".into());
            format!("Pick · {} · {} · {player}", side.name(), role_name(role))
        }
    }
}

fn body(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    if browser.desk.stage == Stage::Teams {
        team_picker(browser, cx).into_any_element()
    } else {
        draft_columns(browser, cx).into_any_element()
    }
}

fn team_picker(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    let blue_scroll = browser.blue_scroll.clone();
    let red_scroll = browser.red_scroll.clone();
    div()
        .flex_1()
        .min_h_0()
        .flex()
        .gap_1()
        .px_3()
        .pb_2()
        .child(team_column(browser, true, blue_scroll, cx))
        .child(team_column(browser, false, red_scroll, cx))
}

fn team_column(
    browser: &Browser,
    blue_side: bool,
    scroll: gpui::UniformListScrollHandle,
    cx: &mut Context<Browser>,
) -> impl IntoElement {
    let side = if blue_side {
        DraftSide::Blue
    } else {
        DraftSide::Red
    };
    let chosen = side_team(&browser.desk, side)
        .and_then(|team| {
            browser
                .catalog
                .as_ref()
                .ok()
                .map(|catalog| team_name(catalog, team))
        })
        .unwrap_or_else(|| "à choisir".into());
    let query = if blue_side {
        browser.blue_query.as_str()
    } else {
        browser.red_query.as_str()
    };
    let count = browser
        .catalog
        .as_ref()
        .map(|catalog| filtered_team_indexes(catalog, query).len())
        .unwrap_or(0);
    let (field_id, focus, slot) = if blue_side {
        ("blue-team-filter", &browser.blue_filter, NameQuery::Blue)
    } else {
        ("red-team-filter", &browser.red_filter, NameQuery::Red)
    };
    div()
        .flex_1()
        .min_w_0()
        .min_h_0()
        .flex()
        .flex_col()
        .bg(rgb(PANEL))
        .rounded_md()
        .overflow_hidden()
        .child(
            div()
                .px_3()
                .py_2()
                .flex_shrink_0()
                .child(ink(side.name(), side_color(side), true))
                .child(ink(chosen, TEXT, false))
                .child(ink(format!("{count} équipes"), MUTED, false)),
        )
        .child(name_field(field_id, query, "Nom d'équipe", focus, slot, cx))
        .child(
            uniform_list(
                if blue_side { "blue-teams" } else { "red-teams" },
                count,
                cx.processor(move |this, range: Range<usize>, _, cx| {
                    team_rows(this, range, blue_side, cx)
                }),
            )
            .track_scroll(scroll)
            .flex_1()
            .w_full(),
        )
}

fn team_rows(
    browser: &Browser,
    range: Range<usize>,
    blue_side: bool,
    cx: &mut Context<Browser>,
) -> Vec<AnyElement> {
    let catalog = browser.catalog.as_ref().ok();
    let query = if blue_side {
        browser.blue_query.as_str()
    } else {
        browser.red_query.as_str()
    };
    let indexes = catalog
        .map(|catalog| filtered_team_indexes(catalog, query))
        .unwrap_or_default();
    let selected = if blue_side {
        browser.desk.blue
    } else {
        browser.desk.red
    };
    let prefix = if blue_side { "blue-team" } else { "red-team" };
    range
        .map(|index| {
            let team = catalog.and_then(|catalog| {
                indexes
                    .get(index)
                    .and_then(|team_index| catalog.teams.get(*team_index))
            });
            match team {
                Some(team) => team_row(
                    prefix,
                    index,
                    team.id,
                    &team.name,
                    selected == Some(team.id),
                    blue_side,
                    cx,
                )
                .into_any_element(),
                None => div().h(px(32.0)).into_any_element(),
            }
        })
        .collect()
}

fn team_row(
    prefix: &'static str,
    index: usize,
    id: TeamId,
    name: &str,
    selected: bool,
    blue_side: bool,
    cx: &mut Context<Browser>,
) -> impl IntoElement {
    div()
        .id((prefix, index))
        .h(px(32.0))
        .w_full()
        .px_3()
        .flex()
        .items_center()
        .overflow_hidden()
        .bg(rgb(if selected { SELECTED } else { PANEL }))
        .child(ink(name, if selected { TEXT } else { MUTED }, selected))
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |this, _, _, cx| {
                if blue_side {
                    this.desk.blue = Some(id);
                } else {
                    this.desk.red = Some(id);
                }
                this.desk.notice = if this.desk.blue.is_some() && this.desk.blue == this.desk.red {
                    Some("Choisis deux équipes différentes.".into())
                } else {
                    None
                };
                cx.notify();
            }),
        )
}

fn draft_columns(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    div()
        .flex_1()
        .min_h_0()
        .flex()
        .overflow_hidden()
        .px_3()
        .pb_2()
        .gap_1()
        .child(side_board(browser, DraftSide::Blue, cx))
        .child(center(browser, cx))
        .child(side_board(browser, DraftSide::Red, cx))
}

fn side_board(browser: &Browser, side: DraftSide, cx: &mut Context<Browser>) -> impl IntoElement {
    let team = side_team(&browser.desk, side)
        .and_then(|team| {
            browser
                .catalog
                .as_ref()
                .ok()
                .map(|catalog| team_name(catalog, team))
        })
        .unwrap_or_else(|| "—".into());
    let mut board = div()
        .id(match side {
            DraftSide::Blue => "blue-board",
            DraftSide::Red => "red-board",
        })
        .w(px(280.0))
        .flex_shrink_0()
        .h_full()
        .overflow_y_scroll()
        .flex()
        .flex_col()
        .bg(rgb(PANEL))
        .rounded_md()
        .child(div().h(px(3.0)).bg(rgb(side_color(side))))
        .child(
            div()
                .px_3()
                .py_2()
                .child(ink(side.name(), side_color(side), true))
                .child(ink(team, TEXT, false)),
        )
        .child(ban_row(browser, side));
    for role in ROSTER {
        board = board.child(pick_row(browser, side, role, cx));
    }
    board
}

fn ban_row(browser: &Browser, side: DraftSide) -> impl IntoElement {
    let Ok(catalog) = &browser.catalog else {
        return div();
    };
    let bans: Vec<(ChampionId, String)> = browser
        .desk
        .steps
        .iter()
        .filter_map(|step| match step {
            DraftStep::Ban {
                side: banned,
                champion,
            } if *banned == side => Some((*champion, champion_name(catalog, *champion))),
            _ => None,
        })
        .collect();
    let active = matches!(browser.desk.next_turn(), Some(Turn::Ban(current)) if current == side);
    let mut row = div()
        .px_2()
        .py_1()
        .flex()
        .gap_1()
        .bg(rgb(if active { SELECTED } else { PANEL }));
    for slot in 0..3 {
        let face = bans
            .get(slot)
            .map(|(id, name)| (champion_face(browser, *id), name.clone()));
        row = row.child(ban_slot(face));
    }
    row
}

fn ban_slot(face: Option<(Option<PathBuf>, String)>) -> impl IntoElement {
    let mut slot = div().w(px(76.0)).flex().flex_col().items_center().gap_1();
    if let Some((path, name)) = face {
        slot = slot.child(head(path, 40.0)).child(ink(name, MUTED, false));
    } else {
        slot = slot.child(div().w(px(40.0)).h(px(40.0)).rounded_sm().bg(rgb(ROW)));
    }
    slot
}

fn pick_row(
    browser: &Browser,
    side: DraftSide,
    role: Role,
    cx: &mut Context<Browser>,
) -> AnyElement {
    let Some(catalog) = browser.catalog.as_ref().ok() else {
        return div().into_any_element();
    };
    let active = matches!(
        browser.desk.next_turn(),
        Some(Turn::Pick(current, picked)) if current == side && picked == role
    );
    let armed = browser.desk.swap_from == Some((side, role));
    let player = side_team(&browser.desk, side)
        .and_then(|team| starter(catalog, team, role))
        .map(|player| player.identity.name.clone())
        .unwrap_or_else(|| "—".into());
    let champion_id = picked_id(&browser.desk, side, role);
    let champion = champion_id
        .map(|id| champion_name(catalog, id))
        .unwrap_or_else(|| "—".into());
    let known = champion_id.is_some();
    let face = champion_id.and_then(|id| champion_face(browser, id));
    let index = ROSTER.iter().position(|item| *item == role).unwrap_or(0);
    let prefix = match side {
        DraftSide::Blue => "blue-role",
        DraftSide::Red => "red-role",
    };
    div()
        .id((prefix, index))
        .px_3()
        .py_1()
        .bg(rgb(if armed || active { SELECTED } else { PANEL }))
        .border_t_1()
        .border_color(rgb(if armed { GOLD } else { LINE }))
        .flex()
        .items_center()
        .gap_2()
        .child(head(face, 48.0))
        .child(
            div()
                .min_w_0()
                .flex()
                .flex_col()
                .child(ink(role_name(role), GOLD, false))
                .child(ink(player, TEXT, false))
                .child(ink(champion, if known { TEXT } else { MUTED }, known)),
        )
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |this, _, _, cx| {
                this.desk.arm_swap(side, role);
                cx.notify();
            }),
        )
        .into_any_element()
}

fn center(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    if browser.desk.stage == Stage::Report {
        report(browser, cx).into_any_element()
    } else if browser.desk.next_turn().is_none() {
        div()
            .flex_1()
            .flex()
            .items_center()
            .justify_center()
            .px_4()
            .child(ink(
                "Clique deux rôles du même côté pour échanger leurs champions, puis lance le match.",
                TEXT,
                true,
            ))
            .into_any_element()
    } else {
        champion_pool(browser, cx).into_any_element()
    }
}

fn champion_pool(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    let Ok(catalog) = &browser.catalog else {
        return div();
    };
    let mut champions: Vec<_> = catalog
        .champions
        .iter()
        .filter(|champion| {
            !browser
                .desk
                .steps
                .iter()
                .any(|step| step.champion() == champion.id)
                && name_matches(&champion.name, &browser.champion_query)
        })
        .collect();
    champions.sort_by(|left, right| left.name.cmp(&right.name));
    let chips: Vec<AnyElement> = champions
        .iter()
        .enumerate()
        .map(|(index, champion)| {
            champion_chip(
                index,
                champion.id,
                &champion.name,
                champion_face(browser, champion.id),
                cx,
            )
            .into_any_element()
        })
        .collect();
    let count = chips.len();
    div()
        .flex_1()
        .min_w_0()
        .min_h_0()
        .flex()
        .flex_col()
        .child(name_field(
            "champion-filter",
            &browser.champion_query,
            "Nom de champion",
            &browser.champion_filter,
            NameQuery::Champion,
            cx,
        ))
        .child(div().px_2().pb_1().flex_shrink_0().child(ink(
            format!("{count} champions"),
            MUTED,
            false,
        )))
        .child(
            div()
                .id(("champion-pool", query_stamp(&browser.champion_query)))
                .flex_1()
                .min_h_0()
                .overflow_y_scroll()
                .px_2()
                .child(div().flex().flex_wrap().gap_1().pb_2().children(chips)),
        )
}

fn champion_chip(
    index: usize,
    id: ChampionId,
    name: &str,
    face: Option<PathBuf>,
    cx: &mut Context<Browser>,
) -> impl IntoElement {
    div()
        .id(("champion", index))
        .w(px(76.0))
        .flex()
        .flex_col()
        .items_center()
        .gap_1()
        .py_1()
        .rounded_md()
        .bg(rgb(ROW))
        .child(head(face, 64.0))
        .child(
            div()
                .w_full()
                .px_1()
                .overflow_hidden()
                .child(ink(name, TEXT, false)),
        )
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |this, _, _, cx| {
                this.desk.choose(id);
                cx.notify();
            }),
        )
}

fn head(path: Option<PathBuf>, edge: f32) -> AnyElement {
    if let Some(path) = path {
        img(path)
            .w(px(edge))
            .h(px(edge))
            .object_fit(ObjectFit::Cover)
            .rounded_sm()
            .into_any_element()
    } else {
        div()
            .w(px(edge))
            .h(px(edge))
            .rounded_sm()
            .bg(rgb(CANVAS))
            .into_any_element()
    }
}

fn champion_face(browser: &Browser, id: ChampionId) -> Option<PathBuf> {
    face_file(browser.catalog.as_ref().ok()?, &browser.assets, id)
}

fn face_file(catalog: &Catalog, assets: &Path, id: ChampionId) -> Option<PathBuf> {
    let relative = catalog
        .champions
        .iter()
        .find(|champion| champion.id == id)?
        .portrait
        .clone()?;
    let path = assets.join(relative);
    path.is_file().then_some(path)
}

fn report(browser: &Browser, cx: &mut Context<Browser>) -> impl IntoElement {
    let desk = &browser.desk;
    let selected = desk.selected_line;
    let rows: Vec<AnyElement> = desk
        .lines
        .iter()
        .enumerate()
        .map(|(index, line)| {
            log_row(index, &line.brief, selected == Some(index), cx).into_any_element()
        })
        .collect();
    let detail = selected
        .and_then(|index| desk.lines.get(index))
        .map(|line| line.full.clone())
        .unwrap_or_default();
    let title = desk
        .lines
        .get(desk.playback_frame)
        .map(|line| line.brief.clone())
        .unwrap_or_default();
    div()
        .flex_1()
        .min_w_0()
        .min_h_0()
        .flex()
        .flex_col()
        .bg(rgb(PANEL))
        .rounded_md()
        .overflow_hidden()
        .child(
            div()
                .flex_1()
                .min_h(px(260.0))
                .child(crate::rift_map::element(
                    desk,
                    browser.assets.join("maps/rift.png"),
                )),
        )
        .child(
            div()
                .px_3()
                .py_1()
                .flex_shrink_0()
                .child(ink(title, GOLD, false))
                .child(ink(damage_caption(desk, DraftSide::Blue), MUTED, false))
                .child(ink(damage_caption(desk, DraftSide::Red), MUTED, false)),
        )
        .child(
            div()
                .id("match-log")
                .h(px(132.0))
                .flex_shrink_0()
                .overflow_y_scroll()
                .child(div().flex().flex_col().children(rows)),
        )
        .child(
            div()
                .id("match-detail")
                .h(px(96.0))
                .flex_shrink_0()
                .overflow_y_scroll()
                .px_3()
                .py_2()
                .border_t_1()
                .border_color(rgb(LINE))
                .child(
                    div()
                        .text_xs()
                        .whitespace_normal()
                        .text_color(rgb(TEXT))
                        .child(detail),
                ),
        )
}

fn damage_caption(desk: &MatchDesk, side: DraftSide) -> String {
    let minute = desk
        .frames
        .get(desk.playback_frame)
        .map(|frame| frame.minute)
        .unwrap_or(0);
    let parts = desk
        .units
        .iter()
        .filter(|unit| unit.side == side)
        .map(|unit| {
            format!(
                "{} {}",
                unit.champion,
                grouped(champion_damage(unit.role, minute))
            )
        })
        .collect::<Vec<_>>()
        .join(" · ");
    format!("{} · {parts}", side.name())
}

fn grouped(value: i32) -> String {
    let digits = value.abs().to_string();
    let mut out = String::new();
    for (index, glyph) in digits.chars().rev().enumerate() {
        if index > 0 && index % 3 == 0 {
            out.push('\u{202f}');
        }
        out.push(glyph);
    }
    let mut out: String = out.chars().rev().collect();
    if value < 0 {
        out.insert(0, '-');
    }
    out
}

fn log_row(
    index: usize,
    brief: &str,
    selected: bool,
    cx: &mut Context<Browser>,
) -> impl IntoElement {
    div()
        .id(("log-line", index))
        .px_3()
        .py_1()
        .bg(rgb(if selected { SELECTED } else { PANEL }))
        .child(ink(brief, TEXT, selected))
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |this, _, _, cx| {
                this.desk.show_frame(index);
                cx.notify();
            }),
        )
}

fn answer_for_opponent(browser: &mut Browser) {
    let Ok(catalog) = browser.catalog.as_ref() else {
        return;
    };
    if browser.desk.human.is_none() {
        return;
    }
    let patch = catalog.patches.first();
    while let Some(turn) = browser.desk.next_turn() {
        if browser.desk.human.is_some_and(|human| turn.side() == human) {
            break;
        }
        let offers = offers_for(catalog, patch, &browser.desk);
        let Some(champion) = opponent_choice(turn, &offers) else {
            break;
        };
        let before = browser.desk.steps.len();
        browser.desk.answer(champion);
        if browser.desk.steps.len() == before {
            break;
        }
    }
}

fn offers_for(catalog: &Catalog, patch: Option<&domain::Patch>, desk: &MatchDesk) -> Vec<Offer> {
    catalog
        .champions
        .iter()
        .filter(|champion| !desk.steps.iter().any(|step| step.champion() == champion.id))
        .map(|champion| {
            let row = patch.and_then(|patch| patch.champion(champion.id));
            let phase = row
                .and_then(|row| row.phases)
                .map(|phases| {
                    let sum = u16::from(phases.early.value())
                        + u16::from(phases.mid.value())
                        + u16::from(phases.late.value());
                    u8::try_from(sum / 3).unwrap_or(50)
                })
                .unwrap_or(50);
            let roles = row
                .and_then(|row| row.roles)
                .map(|roles| {
                    [
                        roles.top.value(),
                        roles.jungle.value(),
                        roles.mid.value(),
                        roles.adc.value(),
                        roles.support.value(),
                    ]
                })
                .unwrap_or([50; 5]);
            Offer {
                id: champion.id,
                phase,
                roles,
            }
        })
        .collect()
}

fn footer(desk: &MatchDesk, cx: &mut Context<Browser>) -> impl IntoElement {
    let mut bar = div()
        .flex_shrink_0()
        .flex()
        .items_center()
        .gap_1()
        .px_3()
        .py_2();
    match desk.stage {
        Stage::Teams => {
            bar = bar
                .child(button(
                    "human-side",
                    if desk.human == Some(DraftSide::Red) {
                        "Tu joues rouge"
                    } else {
                        "Tu joues bleu"
                    },
                    false,
                    cx,
                    |this| {
                        this.desk.human = Some(match this.desk.human {
                            Some(DraftSide::Red) => DraftSide::Blue,
                            _ => DraftSide::Red,
                        });
                    },
                ))
                .child(button(
                    "begin-draft",
                    "Commencer le draft",
                    true,
                    cx,
                    |this| {
                        if let Some(message) = roster_problem(this) {
                            this.desk.notice = Some(message);
                        } else {
                            this.desk.begin();
                        }
                    },
                ));
        }
        Stage::Draft => {
            if desk.next_turn().is_none() {
                bar = bar.child(button("launch-match", "Lancer le match", true, cx, launch));
            }
            if !desk.steps.is_empty() {
                bar = bar.child(button(
                    "undo-pick",
                    "Annuler le dernier coup",
                    false,
                    cx,
                    |this| this.desk.undo(),
                ));
            }
            bar = bar.child(button(
                "change-teams-draft",
                "Changer d'équipes",
                false,
                cx,
                |this| this.desk.change_teams(),
            ));
        }
        Stage::Report => {
            bar = bar
                .child(button("replay-map", "Revoir la carte", true, cx, |this| {
                    this.desk.replay()
                }))
                .child(button("new-draft", "Nouveau draft", false, cx, |this| {
                    this.desk.begin()
                }))
                .child(button(
                    "change-teams-report",
                    "Changer d'équipes",
                    false,
                    cx,
                    |this| this.desk.change_teams(),
                ));
        }
    }
    if let Some(notice) = &desk.notice {
        bar = bar.child(ink(notice.clone(), RED, false));
    }
    bar
}

fn button(
    id: &'static str,
    label: &'static str,
    primary: bool,
    cx: &mut Context<Browser>,
    on_press: impl Fn(&mut Browser) + 'static,
) -> impl IntoElement {
    div()
        .id(id)
        .px_3()
        .py_1()
        .rounded_md()
        .bg(rgb(if primary { SELECTED } else { ROW }))
        .child(ink(label, TEXT, primary))
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |this, _, _, cx| {
                on_press(this);
                cx.notify();
            }),
        )
}

fn launch(browser: &mut Browser) {
    let Some(blue_id) = browser.desk.blue else {
        browser.desk.notice = Some("Choisis l'équipe bleue.".into());
        return;
    };
    let Some(red_id) = browser.desk.red else {
        browser.desk.notice = Some("Choisis l'équipe rouge.".into());
        return;
    };
    if browser.desk.next_turn().is_some() {
        browser.desk.notice = Some("Le draft n'est pas terminé.".into());
        return;
    }
    let Some(blue_champions) = concrete_lineup(browser.desk.champions(DraftSide::Blue)) else {
        browser.desk.notice = Some("Le côté bleu n'a pas ses cinq champions.".into());
        return;
    };
    let Some(red_champions) = concrete_lineup(browser.desk.champions(DraftSide::Red)) else {
        browser.desk.notice = Some("Le côté rouge n'a pas ses cinq champions.".into());
        return;
    };
    let played = {
        let Ok(catalog) = browser.catalog.as_ref() else {
            return;
        };
        let patch = catalog.patches.first();
        let objectives = patch.map(objectives_of).unwrap_or_default();
        play_draft(
            blue_champions,
            red_champions,
            &players_for(catalog, blue_id),
            &players_for(catalog, red_id),
            |champion| patch.and_then(|patch| patch.champion(champion).copied()),
            objectives,
        )
        .map(|played| {
            let (headline, lines) = describe(
                &played,
                &team_name(catalog, blue_id),
                &team_name(catalog, red_id),
            );
            let units = match_units(catalog, &browser.assets, &browser.desk, blue_id, red_id);
            let frames = map_frames(&played, &units);
            (headline, lines, frames, units)
        })
    };
    match played {
        Ok((headline, lines, frames, units)) => browser.desk.store(headline, lines, frames, units),
        Err(message) => browser.desk.notice = Some(message),
    }
}

fn match_units(
    catalog: &Catalog,
    assets: &Path,
    desk: &MatchDesk,
    blue: TeamId,
    red: TeamId,
) -> Vec<MapUnit> {
    let mut units = Vec::new();
    for (side, team) in [(DraftSide::Blue, blue), (DraftSide::Red, red)] {
        let champions = desk.champions(side);
        for (index, role) in ROSTER.into_iter().enumerate() {
            let name = starter(catalog, team, role)
                .map(|player| player.identity.name.clone())
                .unwrap_or_else(|| role_name(role).into());
            let champion_id = champions.get(index).and_then(|champion| *champion);
            let champion = champion_id
                .map(|champion| champion_name(catalog, champion))
                .unwrap_or_else(|| role_name(role).into());
            let portrait = champion_id.and_then(|id| face_file(catalog, assets, id));
            let label = abbrev(&champion);
            units.push(MapUnit {
                side,
                role,
                name,
                champion,
                label,
                portrait,
            });
        }
    }
    units
}

fn abbrev(name: &str) -> String {
    name.chars()
        .filter(|glyph| glyph.is_ascii_alphanumeric())
        .take(2)
        .collect::<String>()
        .to_uppercase()
}

fn roster_problem(browser: &Browser) -> Option<String> {
    let catalog = browser.catalog.as_ref().ok()?;
    if !browser.desk.teams_differ() {
        return Some("Choisis deux équipes différentes.".into());
    }
    let blue = browser.desk.blue?;
    let red = browser.desk.red?;
    for team in [blue, red] {
        if let Some(role) = roster_gap(catalog, team) {
            return Some(format!(
                "{} n'a pas de {}.",
                team_name(catalog, team),
                role_name(role)
            ));
        }
    }
    None
}

fn objectives_of(patch: &Patch) -> Vec<PatchObjective> {
    patch
        .objectives
        .iter()
        .map(|event| PatchObjective {
            name: event.name.clone(),
            reward: event.reward.clone(),
            unlocks: event.unlocks.clone(),
            source_url: patch.source_url.clone(),
        })
        .collect()
}

fn roster_gap(catalog: &Catalog, team: TeamId) -> Option<Role> {
    let players = players_for(catalog, team);
    ROSTER
        .into_iter()
        .find(|role| !players.iter().any(|player| player.identity.role == *role))
}

fn players_for<'a>(catalog: &'a Catalog, team: TeamId) -> Vec<&'a Player> {
    let listed = roster_listed(catalog, team);
    if ROSTER
        .iter()
        .all(|role| listed.iter().any(|player| player.identity.role == *role))
    {
        return listed;
    }
    catalog
        .players
        .iter()
        .filter(|player| player.identity.teams.contains(&team))
        .collect()
}

fn roster_listed<'a>(catalog: &'a Catalog, team_id: TeamId) -> Vec<&'a Player> {
    let Some(team) = catalog.teams.iter().find(|team| team.id == team_id) else {
        return Vec::new();
    };
    team.roster
        .players
        .iter()
        .filter_map(|id| {
            catalog
                .players
                .iter()
                .find(|player| player.identity.id == *id)
        })
        .collect()
}

fn starter<'a>(catalog: &'a Catalog, team: TeamId, role: Role) -> Option<&'a Player> {
    players_for(catalog, team)
        .into_iter()
        .find(|player| player.identity.role == role)
}

fn side_team(desk: &MatchDesk, side: DraftSide) -> Option<TeamId> {
    match side {
        DraftSide::Blue => desk.blue,
        DraftSide::Red => desk.red,
    }
}

fn filtered_team_indexes(catalog: &Catalog, query: &str) -> Vec<usize> {
    team_indexes(catalog)
        .into_iter()
        .filter(|&index| name_matches(&catalog.teams[index].name, query))
        .collect()
}

fn team_indexes(catalog: &Catalog) -> Vec<usize> {
    let mut indexes: Vec<usize> = (0..catalog.teams.len()).collect();
    indexes.sort_by(|&left, &right| catalog.teams[left].name.cmp(&catalog.teams[right].name));
    indexes
}

fn team_name(catalog: &Catalog, id: TeamId) -> String {
    catalog
        .team_names
        .get(&id)
        .cloned()
        .unwrap_or_else(|| "Équipe".into())
}

fn champion_name(catalog: &Catalog, id: ChampionId) -> String {
    catalog
        .champions
        .iter()
        .find(|champion| champion.id == id)
        .map(|champion| champion.name.clone())
        .unwrap_or_else(|| "Champion".into())
}

fn picked_id(desk: &MatchDesk, side: DraftSide, role: Role) -> Option<ChampionId> {
    let index = ROSTER.iter().position(|item| *item == role)?;
    desk.champions(side)
        .get(index)
        .and_then(|champion| *champion)
}

fn side_color(side: DraftSide) -> u32 {
    match side {
        DraftSide::Blue => BLUE,
        DraftSide::Red => RED,
    }
}

fn ink(value: impl AsRef<str>, color: u32, strong: bool) -> impl IntoElement {
    let text = div()
        .text_color(rgb(color))
        .whitespace_normal()
        .child(value.as_ref().to_string());
    if strong {
        text.text_sm()
    } else {
        text.text_xs()
    }
}

#[derive(Clone, Copy)]
enum NameQuery {
    Blue,
    Red,
    Champion,
}

fn name_field(
    id: &'static str,
    query: &str,
    placeholder: &'static str,
    focus: &gpui::FocusHandle,
    slot: NameQuery,
    cx: &mut Context<Browser>,
) -> impl IntoElement {
    let typing = !query.is_empty();
    let label = if typing {
        query.to_string()
    } else {
        placeholder.into()
    };
    let focus_for_click = focus.clone();
    div()
        .id(id)
        .track_focus(focus)
        .mx_2()
        .mt_1()
        .h(px(28.0))
        .px_2()
        .flex()
        .items_center()
        .flex_shrink_0()
        .bg(rgb(CANVAS))
        .rounded_sm()
        .border_1()
        .border_color(rgb(LINE))
        .focus(|style| style.border_color(rgb(GOLD)))
        .child(ink(label, if typing { TEXT } else { MUTED }, false))
        .on_mouse_down(
            MouseButton::Left,
            cx.listener(move |_, _, window, _| {
                focus_for_click.focus(window);
            }),
        )
        .on_key_down(cx.listener(move |this, event: &KeyDownEvent, _, cx| {
            if edit_query(this, slot, event) {
                cx.notify();
            }
        }))
}

fn edit_query(browser: &mut Browser, slot: NameQuery, event: &KeyDownEvent) -> bool {
    let keystroke = &event.keystroke;
    if keystroke.modifiers.control || keystroke.modifiers.platform || keystroke.modifiers.function {
        return false;
    }
    {
        let query = query_mut(browser, slot);
        match keystroke.key.as_str() {
            "backspace" => {
                query.pop();
            }
            "escape" => query.clear(),
            _ => {
                let Some(text) = keystroke.key_char.as_deref() else {
                    return false;
                };
                if text.is_empty() || text.chars().any(char::is_control) {
                    return false;
                }
                query.push_str(text);
            }
        }
    }
    match slot {
        NameQuery::Blue => browser
            .blue_scroll
            .scroll_to_item_strict(0, ScrollStrategy::Top),
        NameQuery::Red => browser
            .red_scroll
            .scroll_to_item_strict(0, ScrollStrategy::Top),
        NameQuery::Champion => {}
    }
    true
}

fn query_mut(browser: &mut Browser, slot: NameQuery) -> &mut String {
    match slot {
        NameQuery::Blue => &mut browser.blue_query,
        NameQuery::Red => &mut browser.red_query,
        NameQuery::Champion => &mut browser.champion_query,
    }
}

fn name_matches(name: &str, query: &str) -> bool {
    let needle = fold(query.trim());
    needle.is_empty() || fold(name).contains(&needle)
}

fn fold(value: &str) -> String {
    value
        .chars()
        .flat_map(char::to_lowercase)
        .map(fold_char)
        .collect()
}

fn fold_char(ch: char) -> char {
    match ch {
        'à' | 'á' | 'â' | 'ä' | 'ã' | 'å' => 'a',
        'è' | 'é' | 'ê' | 'ë' => 'e',
        'ì' | 'í' | 'î' | 'ï' => 'i',
        'ò' | 'ó' | 'ô' | 'ö' | 'õ' => 'o',
        'ù' | 'ú' | 'û' | 'ü' => 'u',
        'ý' | 'ÿ' => 'y',
        'ñ' => 'n',
        'ç' => 'c',
        other => other,
    }
}

fn query_stamp(query: &str) -> usize {
    query.bytes().fold(0usize, |acc, byte| {
        acc.wrapping_mul(31).wrapping_add(byte as usize)
    })
}

#[cfg(test)]
mod tests {
    use super::name_matches;

    #[test]
    fn a_name_filter_ignores_case_and_accents() {
        assert!(name_matches("SK Gaming", "sk"));
        assert!(name_matches("Fnatic", "NAT"));
        assert!(name_matches("Équipe", "equipe"));
        assert!(!name_matches("Fnatic", "g2"));
        assert!(name_matches("Ahri", "  "));
    }
}
