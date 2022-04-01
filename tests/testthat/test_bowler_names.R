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
    bowler_names(-10), regexp = "score not found"
  )
  expect_error(
    bowler_names(2000125), regexp = "score not found"
  )
})
