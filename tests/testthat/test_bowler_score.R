library(tibble)
library(dplyr)
library(testthat)

test_that("check bowler score", {
  expect_equal(bowler_score(45), "Tim Southee")
  expect_length(bowler_score(40), 4)
})

test_that("check for invalid input types", {
  expect_error(bowler_score("Rahul Sharma"), regexp = "be a numeric")
})

test_that("check for when data not found", {
  expect_error(
    bowler_score(-10), regexp = "greater than 0"
  )
  expect_error(
    bowler_score(2000125), regexp = "input a lower number"
  )
})
