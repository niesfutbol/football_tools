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
      diff_xgoal = c(0.46233 - 1.41704),
      diff_point = c(0.25 - 0.75)
    )
    obtained <- get_info_from_match(all_matches, match_id, matches)
    expect_equal(obtained, expected)
  })
})

describe("auxiliar functions", {
  it(".get_xGoal_attacking_agg()", {
    obtaines <- .get_xGoal_attacking_agg(all_matches, 867999, 49)
    expected <- 0.92466
    expect_equal(obtaines, expected)
  })
  it(".get_point_agg()", {
    obtaines <- .get_point_agg(all_matches, 867999, 49)
    expected <- 1.5
    expect_equal(obtaines, expected)
  })
})
