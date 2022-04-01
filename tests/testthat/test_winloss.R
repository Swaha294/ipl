context("winloss")

library(dplyr)
library(testthat)

test_that("check winloss", {
  expect_length(winloss("Sunrisers Hyderabad", 2017), 4)
})

test_that("check for invalid input types", {
  expect_error(
    winloss(00, 2017),
    regexp = "be a character"
  )
  expect_error(
    winloss("Dehli Daredevils", "2016"),
    regexp = "be a numeric"
  )
})

test_that("check for when data not found", {
  expect_error(
    winloss("Dehli", 2017),
    regexp = "not found"
  )
  expect_error(
    bat_max("Dehli Daredevild", 2000),
    regexp = "not found"
  )
})
