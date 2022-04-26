library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  year = 2019,
  "batsman" = "MS Dhoni",
  max_runs = 84
)

test_that("check maximum runs", {
  expect_identical(df, bat_max("MS Dhoni", 2019))
})


test_that("check for invalid input types", {
  expect_error(
    bat_max(00, 2016),
    regexp = "be a character"
  )
  expect_error(
    bat_max("V Kohli", "2016"),
    regexp = "be a numeric"
  )
})


test_that("check for when data not found", {
  expect_error(
    bat_max("Kohli", 2016),
    regexp = "not found"
  )
  expect_error(
    bat_max("V Kohli", 2000),
    regexp = "not found"
  )
})
