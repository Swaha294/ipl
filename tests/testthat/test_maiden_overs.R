library(tibble)
library(dplyr)
library(testthat)

test_that("calculate maiden overs", {
  expect_equal(2, maiden_overs("R Sharma"))
  expect_equal(3, maiden_overs("S Kaul"))
})

test_that("check for invalid input types", {
  expect_error(maiden_overs(400), regexp = "must be a character")
  expect_error(maiden_overs(41), regexp = "must be a character")
})

test_that("check for when data not found", {
  expect_error(
    maiden_overs("Sharma"),
    regexp = "input another name"
  )
  expect_error(
    maiden_overs("Rahul"),
    regexp = "input another name"
  )
})
