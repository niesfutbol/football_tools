library("tidyverse")

get_info_from_match <- function(all_matches, match_id, cleaned_matches) {
  home_id <- cleaned_matches %>%
    filter(id_match == match_id) %>%
    .$home_id
  away_id <- cleaned_matches %>%
    filter(id_match == match_id) %>%
    .$away_id
  home_xgoal_agg <- all_matches %>% .get_xGoal_attacking_agg(match_id, home_id)
  away_xgoal_agg <- all_matches %>% .get_xGoal_attacking_agg(match_id, away_id)
  home_point_agg <- all_matches %>% .get_point_agg(match_id, home_id)
  away_point_agg <- all_matches %>% .get_point_agg(match_id, away_id)
  diff_xgoal_point <- tibble(
    match_id = match_id,
    home_id = home_id,
    away_id = away_id,
    diff_xgoal = home_xgoal_agg - away_xgoal_agg,
    diff_point = home_point_agg - away_point_agg
  )
  return(diff_xgoal_point)
}

.get_xGoal_attacking_agg <- function(all_matches, Match_id, team) {
  home_xgoal_agg <- all_matches %>%
    filter(match_id == Match_id & team_id == team) %>%
    .$xGoal_attacking_agg
  return(home_xgoal_agg)
}

.get_point_agg <- function(all_matches, Match_id, team) {
  point_agg <- all_matches %>%
    filter(match_id == Match_id & team_id == team) %>%
    .$point_agg
  return(point_agg)
}
