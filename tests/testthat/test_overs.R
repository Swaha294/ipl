context("overs")

library(tibble)
library(dplyr)
library(testthat)

test_that("check overs", {
  expect_equal(154.4, overs("Rahul Sharma"))
  expect_equal(163.3, overs("Siddarth Kaul"))
})

test_that("check for invalid input types", {
  expect_error(overs(400), regexp = "be a character"
  )

  expect_error(
    overs(41),
    regexp = "be a character"
  )
})

test_that("check for when data not found", {
  expect_error(
    overs("Sharma"), regexp = "not found"
  )
  expect_error(
    overs("Rahul"), regexp = "not found"
  )
})
