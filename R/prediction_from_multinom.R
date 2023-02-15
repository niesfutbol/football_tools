select_match_to_predict_by_round <- function(season, round) {
  n_round <- glue::glue("Regular Season - {round}")
  filtered_matches <- season %>%
  filter(round == n_round)
  return(filtered_matches)
}