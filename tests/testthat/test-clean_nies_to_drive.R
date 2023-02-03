library(tidyverse)

data_to_test <- tibble(
  home_team = "home_team",
  away_team = "away_team",
  home = c(0.6, 0.3, 0.1),
  draw = c(0.3, 0.1, 0.6),
  away = c(0.1, 0.6, 0.3)
)

test_that("Mutate who did win", {
  expected <- tibble(
    home_team = "home_team",
    away_team = "away_team",
    home = c(0.6, 0.3, 0.1),
    draw = c(0.3, 0.1, 0.6),
    away = c(0.1, 0.6, 0.3),
    won = c("Home", "Away", "Draw")
  )
  obtained <- did_who_win(data_to_test)
  expect_equal(obtained, expected)
})

test_that("What's the name of the one who won?", {
  expected <- tibble(
    home_team = "home_team",
    away_team = "away_team",
    home = c(0.6, 0.3, 0.1),
    draw = c(0.3, 0.1, 0.6),
    away = c(0.1, 0.6, 0.3),
    name = c("home_team", "away_team", "Draw")
  )
  obtained <- what_name_of_who_won(data_to_test)
  expect_equal(obtained, expected)
})

test_that("Calculate the nies fee", {
  expected <- tibble(
    home_team = "home_team",
    away_team = "away_team",
    home = c(0.6, 0.3, 0.1),
    draw = c(0.3, 0.1, 0.6),
    away = c(0.1, 0.6, 0.3),
    nies_cuota = 1 / 0.6
  )
  obtained <- calculate_nies_fee(data_to_test)
  expect_equal(obtained, expected)
})
