library(tidyverse)


describe("get_league_name_from_season", {
  it("Serie A", {
    path <- glue::glue("/workdir/tests/data/season_135_2022.csv")
    season <- read_csv(path, show_col_types = FALSE)
    expected <- "Italy - Serie A"
    obtained <- get_league_name_from_season(season)
    expect_equal(obtained, expected)
  })
  it("Bundesliga", {
    path <- glue::glue("/workdir/tests/data/season_78_2022.csv")
    season <- read_csv(path, show_col_types = FALSE)
    expected <- "Germany - Bundesliga"
    obtained <- get_league_name_from_season(season)
    expect_equal(obtained, expected)
  })
})

describe("team_from_league", {
  names <- read_csv("/workdir/tests/data/names_135_2022.csv", show_col_types = FALSE)
  season <- read_csv("/workdir/tests/data/season_135_2022.csv", show_col_types = FALSE) %>%
    select(c(id_match, date, league))
  league <- read_csv("/workdir/tests/data/league_135_2022.csv", show_col_types = FALSE)
  the_league <- League$new(league, season, names)
  team_from_league <- read_csv("/workdir/tests/data/team_from_league_505.csv", show_col_types = FALSE)
  the_league$set_id_team(505)
  it("Read name, season and league", {
    all_columns_are_in_league <- all(c("date", "league") %in% names(the_league$league))
    expect_true(all_columns_are_in_league)
  })
  it("Check the name of selected team", {
    expected <- "Inter"
    expect_equal(the_league$team_name, expected)
  })
  it("Check the league name", {
    expected <- "Italy - Serie A"
    expect_equal(the_league$league_name, expected)
  })
  it("Check points of a team", {
    expected_points <- team_from_league$point
    expect_equal(the_league$team$point, expected_points)
    expected_xpoints <- team_from_league$xpoint
    expect_equal(the_league$team$xpoint, expected_xpoints)
    expected_date <- team_from_league$date
    expect_equal(the_league$team$date, expected_date)
    the_league$set_id_team(492)
    expected <- "Napoli"
    expect_equal(the_league$team_name, expected)
    team_from_league <- read_csv("/workdir/tests/data/team_from_league_492.csv", show_col_types = FALSE)
    expected_points <- team_from_league$point
    expect_equal(the_league$team$point, expected_points)
  })
  it("Check the aggregate variable", {
    the_league$set_id_team(505)
    expected <- "Inter"
    expect_equal(the_league$team_name, expected)
    expected_points <- team_from_league$point_agg
    expect_equal(the_league$team$point_agg, expected_points)
  })
})
