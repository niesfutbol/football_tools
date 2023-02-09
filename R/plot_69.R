library("tidyverse")

get_info_from_match <- function(all_matches, match_id, cleaned_matches) {
  home_id <- cleaned_matches %>%
    filter(id_match == match_id) %>%
    .$home_id
  away_id <- cleaned_matches %>%
    filter(id_match == match_id) %>%
    .$away_id
  return(tibble(match_id = match_id, home_id = home_id, away_id = away_id))
}
