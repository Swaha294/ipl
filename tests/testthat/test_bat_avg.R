library(tibble)
library(dplyr)
library(testthat)

df <- data.frame(
  "batsman" = "V Kohli",
  year = 2016,
  player_runs = 973,
  player_wickets = 12L,
  batting_avg = 81.08
)


df2 <- data.frame(
  "batsman" = c("V Kohli", "V Kohli", "MS Dhoni", "MS Dhoni"),
  "year" = c(2016, 2017, 2016, 2017),
  player_runs = c(973, 308, 284, 290),
  player_wickets = c(12L, 11L, 8L, 13L),
  batting_avg = c(81.08, 28.00, 35.50, 22.31)
) %>%
  arrange(batsman, year)

test_that("check batting avg", {
  expect_identical(df, bat_avg("V Kohli", 2016))
  expect_identical(df2, bat_avg(c("V Kohli", "MS Dhoni"), 2016:2017))
})


test_that("check for invalid input types", {
  expect_error(
    bat_avg(00, 2016),
    regexp = "be a character"
  )
  expect_error(
    bat_avg("V Kohli", "2016"),
    regexp = "be a numeric"
  )
})


test_that("check for when data not found", {
  expect_error(
    bat_avg("Kohli", 2016),
    regexp = "not found"
  )
  expect_error(
    bat_avg(c("V Kohli", "Dhoni"), regexp = "not found")
  )
  expect_error(
    bat_avg("V Kohli", 200)
  )
  expect_error(
    bat_avg("V Kohli", c(2016, 200017))
  )
})
