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

League <- R6::R6Class("League",
  public = list(
    names = NULL,
    league = NULL,
    team_name = NULL,
    league_name = NULL,
    team = NULL,
    initialize = function(league, season, names) {
      self$names <- names
      self$league <- league %>%
        left_join(season, by = c("match_id" = "id_match"))
      self$league_name <- get_league_name_from_season(season)
    },
    set_id_team = function(id_team) {
      private$id_team <- id_team
      private$set_name()
      points <- extract_point_from_league(self$league, id_team)
      xpoints <- extract_xpoint_from_league(self$league, id_team)
      date <- extract_date_from_league(self$league, id_team)
      self$team <- tibble(date, xpoints, points) %>% arrange(date)
    }
  ),
  private = list(
    id_team = NULL,
    set_name = function() {
      self$team_name <- self$names %>%
        filter(ids == private$id_team) %>%
        .$names
    }
  )
)
