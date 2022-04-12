library(tibble)
library(dplyr)
library(testthat)

test_that("check completed overs and legal balls", {
  expect_equal("Completed overs: 154  Legal balls: 4", completedOvers_legalBalls("Rahul Sharma"))
  expect_equal("Completed overs: 163  Legal balls: 3", completedOvers_legalBalls("Siddarth Kaul"))
})

test_that("check for invalid input types", {
  expect_error(runs(400), regexp = "must be a character")
  expect_error(runs(41), regexp = "must be a character")
})

test_that("check for when data not found", {
  expect_error(
    runs("Sharma"),
    regexp = "input another name"
  )
  expect_error(
    runs("Rahul"),
    regexp = "input another name"
  )
})
