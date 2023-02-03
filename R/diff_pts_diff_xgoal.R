read_league_from_options_cli <- function(opciones) {
  read_file_from_options_cli(opciones, "league")
}

read_names_from_options_cli <- function(opciones) {
  read_file_from_options_cli(opciones, "names")
}

read_season_from_options_cli <- function(opciones) {
  read_file_from_options_cli(opciones, "season")
}

read_file_from_options_cli <- function(opciones, file) {
  league_season <- opciones[["league-season"]]
  directory <- opciones[["directory"]]
  path <- glue::glue("{directory}/{file}_{league_season}.csv")
  return(read_csv(path, show_col_types = FALSE))
}

get_league_name_from_season <- function(season) {
  return(season$league[1])
}

League <- R6::R6Class("League", list(
  names = NULL,
  season = NULL,
  league = NULL,
  initialize = function(league, season, names) {
    self$names <- names
    self$league <- league %>%
      left_join(season, by = c("match_id" = "id_match"))
    self$season <- season
  }
))
