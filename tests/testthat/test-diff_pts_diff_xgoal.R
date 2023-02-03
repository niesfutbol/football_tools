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
  it("Read name, season and league", {
    league <- League$new(league, season, names)
    all_columns_are_in_league <- all(c("date", "league") %in% names(league$league))
    expect_true(all_columns_are_in_league)
  })
  it("Check the name is selected", {
    expected <- "Inter"
    league$set_id_team(505)
    expect_equal(league$name_team, expected)
  })
})
