library(tidyverse)


describe("select_match_to_predict", {
  season <- read_csv("/workdir/tests/data/season_78_2022.csv", show_col_types = FALSE)
  round_22 <- read_csv("/workdir/tests/data/season_78_2022_round_22.csv", show_col_types = FALSE)
  it("by round", {
    obatined_matches <- select_match_to_predict_by_round(season, "22")
    expect_equal(obatined_matches, round_22)
  })
  it("by date", {
    obatined_matches <- select_match_to_predict_by_date(season, "2023-02-01", "2023-02-28")
    february <- read_csv("/workdir/tests/data/season_78_2022_february.csv", show_col_types = FALSE)
    expect_equal(obatined_matches, february)
  })
  it("all at once", {
    options <- list("round" = "22", "initial_date" = "2023-01-31", "final_date" = "2023-02-28")
    obatined_matches <- select_match_to_predict(season, options)
    expect_equal(obatined_matches, round_22)
    options <- list("round" = "0", "initial_date" = "2023-01-31", "final_date" = "2023-02-28")
    obatined_matches <- select_match_to_predict(season, options)
    february <- read_csv("/workdir/tests/data/season_78_2022_february.csv", show_col_types = FALSE)
    expect_equal(obatined_matches, february)
  })
})
