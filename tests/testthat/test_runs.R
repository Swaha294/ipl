library(tibble)
library(dplyr)
library(testthat)

test_that("check runs", {
  expect_equal(1086, runs("Rahul Sharma"))
  expect_equal(1385, runs("Siddarth Kaul"))
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
