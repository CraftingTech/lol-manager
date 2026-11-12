mod browser;

use std::collections::HashMap;
use std::path::{Path, PathBuf};

use browser::{Browser, Catalog};
use domain::{LeagueId, OrganisationId, TeamId};
use gpui::{px, prelude::*, size, App, Application, Bounds, WindowBounds, WindowOptions};
use storage::Store;

fn main() {
    let path = database_path();
    let assets = path.parent().map(Path::to_path_buf).unwrap_or_else(|| PathBuf::from("data"));
    let catalog = load_catalog(&path);
    let title = path.display().to_string();

    Application::new().run(move |cx: &mut App| {
        let bounds = Bounds::centered(None, size(px(1280.0), px(800.0)), cx);
        let catalog = catalog.clone();
        let title = title.clone();
        let assets = assets.clone();
        cx.open_window(
            WindowOptions {
                window_bounds: Some(WindowBounds::Windowed(bounds)),
                ..Default::default()
            },
            move |_, cx| cx.new(|_| Browser::new(catalog.clone(), title.clone(), assets.clone())),
        )
        .unwrap();
        cx.activate(true);
    });
}

fn database_path() -> PathBuf {
    std::env::args().nth(1).map(PathBuf::from).unwrap_or_else(|| {
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("../../data/lol-manager.sqlite")
    })
}

fn load_catalog(path: &std::path::Path) -> Result<Catalog, String> {
    let store = Store::open(path).map_err(|error| format!("{error:?}"))?;
    let champions = store.list_champions().map_err(|error| format!("{error:?}"))?;
    let leagues = store.list_leagues().map_err(|error| format!("{error:?}"))?;
    let organisations = store.list_organisations().map_err(|error| format!("{error:?}"))?;
    let teams = store.list_teams().map_err(|error| format!("{error:?}"))?;
    let players = store.list_players().map_err(|error| format!("{error:?}"))?;
    let patches = store.list_patches().map_err(|error| format!("{error:?}"))?;
    let mut seasons = HashMap::new();
    for league in &leagues {
        if let Ok(season) = store.load_league_season(league.id, 2014) {
            seasons.insert(league.id, season);
        }
    }
    let team_names: HashMap<TeamId, String> = teams.iter().map(|team| (team.id, team.name.clone())).collect();
    let organisation_names: HashMap<OrganisationId, String> =
        organisations.iter().map(|org| (org.id, org.name.clone())).collect();
    let league_names: HashMap<LeagueId, String> =
        leagues.iter().map(|league| (league.id, league.name.clone())).collect();
    Ok(Catalog {
        champions,
        leagues,
        organisations,
        teams,
        players,
        patches,
        seasons,
        team_names,
        organisation_names,
        league_names,
    })
}
