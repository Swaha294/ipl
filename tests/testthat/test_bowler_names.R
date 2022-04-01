context("bowler_names")

library(tibble)
library(dplyr)
library(testthat)

test_that("check bowler score", {
  expect_equal(bowler_names(45), 46.17)
  expect_length(bowler_names(40), 4)
})

test_that("check for invalid input types", {
  expect_error(bowler_names("Rahul Sharma"), regexp = "be a numeric")
})

test_that("check for when data not found", {
  expect_error(
<<<<<<< HEAD:tests/testthat/test_bowler_score.R
    bowler_score(-10), regexp = "Invalid score. Must be greater than 0."
  )
  expect_error(
    bowler_score(2000125), regexp = "Invalid score. Please input a lower number."
=======
    bowler_names(-10), regexp = "score not found"
  )
  expect_error(
    bowler_names(2000125), regexp = "score not found"
>>>>>>> dbb4dd07880eabf78f6fe503cce1edbcf0eb92d7:tests/testthat/test_bowler_names.R
  )
})
