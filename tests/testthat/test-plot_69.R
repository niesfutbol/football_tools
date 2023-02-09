library("tidyverse")
matches <- read_csv("/workdir/tests/data/cleaned_matches.csv", show_col_types = FALSE)
all_matches <- read_csv("/workdir/tests/data/all_teams.csv", show_col_types = FALSE)

describe("get_info_from_match", {
  it("get the some info", {
    match_id = 867986
    expected <- tibble(
      match_id = c(867986),
      home_id = c(35),
      away_id = c(39))
    obtained <- get_info_from_match(all_matches, match_id)
  })
})