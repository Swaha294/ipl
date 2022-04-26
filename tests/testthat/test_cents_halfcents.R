library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  year = 2016,
  batsman = "V Kohli",
  centuries = 4,
  half_centuries = 7
)

test_that("check cents and half-cents", {
  expect_equal(df, cents_halfcents("V Kohli", 2016))
})


test_that("check for invalid input types", {
  expect_error(
    cents_halfcents(00, 2016),
    regexp = "be a character"
  )
  expect_error(
    cents_halfcents("V Kohli", "2016"),
    regexp = "be a numeric"
  )
})


test_that("check for when data not found", {
  expect_error(
    cents_halfcents("Kohli", 2016),
    regexp = "not found"
  )
  expect_error(
    cents_halfcents("V Kohli", 2000),
    regexp = "not found"
  )
})
