library(tibble)
library(dplyr)
library(testthat)

test_that("check wickets taken", {
  expect_equal(wickets_taken("Rahul Sharma"), 40)
  expect_equal(wickets_taken("Tim Southee"), 28)
})

test_that("check for invalid input types", {
  expect_error(wickets_taken(35), regexp = "be a character")
})

test_that("check for when data not found", {
  expect_error(
    wickets_taken("Rahul K Sharma"),
    regexp = "Invalid player name, please input another name"
  )
})
