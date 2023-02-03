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
  it("Read name, season and league", {
    all_columns_are_in_league <- all(c("date", "league") %in% names(the_league$league))
    expect_true(all_columns_are_in_league)
  })
  it("Check the name of selected team", {
    expected <- "Inter"
    the_league$set_id_team(505)
    expect_equal(the_league$name_team, expected)
  })
  it("Check the league name", {
    expected <- "Italy - Serie A"
    expect_equal(the_league$league_name, expected)
  })
  it("", {
    expected_points <- team_from_league$point
    the_league$set_id_team(505)
    expect_equal(the_league$points, expected_point2)
  })
})
