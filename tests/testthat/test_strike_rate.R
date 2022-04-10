library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  batsman = "MS Dhoni",
  strike_rate = 134.63
)


test_that("check strike rate", {
  expect_equal(df, strike_rate("MS Dhoni", 2019))
})


test_that("check for invalid input types", {
  expect_error(
    strike_rate(00, 2016),
    regexp = "be a character"
  )
  expect_error(
    strike_rate("V Kohli", "2016"),
    regexp = "be a numeric"
  )
})


test_that("check for when data not found", {
  expect_error(
    strike_rate("Kohli", 2016),
    regexp = "not found"
  )
  expect_error(
    strike_rate("V Kohli", 2000),
    regexp = "not found"
  )
})
