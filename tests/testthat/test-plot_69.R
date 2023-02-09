library("tidyverse")
matches <- read_csv("/workdir/tests/data/cleaned_matches.csv", show_col_types = FALSE)
all_matches <- read_csv("/workdir/tests/data/all_teams.csv", show_col_types = FALSE)

describe("get_info_from_match", {
  it("get the some info", {
    match_id <- 867986
    expected <- tibble(
      match_id = c(867986),
      home_id = c(35),
      away_id = c(39),
      diff_xgoal = c(1.41704 - 0.46233),
      diff_point = c(0.75 - 0.25)
    )
    obtained <- get_info_from_match(all_matches, match_id, matches)
    expect_equal(obtained, expected)
  })
})
