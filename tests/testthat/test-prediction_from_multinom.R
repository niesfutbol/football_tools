library(tidyverse)


describe("select_match_to_predict", {
  it("by round", {
    season <- read_csv("/workdir/tests/data/season_78_2022.csv", show_col_types = FALSE)
    obatined_matches <- select_match_to_predict_by_round(season, "22")
    round_22 <- read_csv("/workdir/tests/data/season_78_2022_round_22.csv", show_col_types = FALSE)
    expect_equal(obatined_matches, round_22)
  })
  it("by date", {
    season <- read_csv("/workdir/tests/data/season_78_2022.csv", show_col_types = FALSE)
    obatined_matches <- select_match_to_predict_by_date(season, "2023-01-31", "2023-02-28")
    february <- read_csv("/workdir/tests/data/season_78_2022_february.csv", show_col_types = FALSE)
    expect_equal(obatined_matches, february)
  })
  it("all at once", {
    season <- read_csv("/workdir/tests/data/season_78_2022.csv", show_col_types = FALSE)
    options <- list("round" = "22", "initial_date" = "2023-01-31", "final_date" = "2023-02-28")
    obatined_matches <- select_match_to_predict(season, options)
    round_22 <- read_csv("/workdir/tests/data/season_78_2022_round_22.csv", show_col_types = FALSE)
    expect_equal(obatined_matches, round_22)
  })
})
