library(dplyr)
library(testthat)

test_that("check sixes", {
  expect_length(sixes("Suresh Raina"), 1)
})

test_that("check for invalid input types", {
  expect_error(
    sixes(00),
    regexp = "be a character"
  )})

test_that("check for when data not found", {
  expect_error(
    sixes("Suresh"),
    regexp = "Invalid player name"
  )})
