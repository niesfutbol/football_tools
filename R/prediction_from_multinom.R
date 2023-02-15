select_match_to_predict_by_round <- function(season, round) {
  n_round <- glue::glue("Regular Season - {round}")
  filtered_matches <- season %>%
    filter(round == n_round)
  return(filtered_matches)
}

select_match_to_predict_by_date <- function(season, initial_date, final_date) {
  february <- season %>%
    filter((date > lubridate::ymd(initial_date)) & (date < lubridate::ymd(final_date)))
  return(february)
}
