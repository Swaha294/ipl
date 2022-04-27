library(dplyr)
library(testthat)

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
    regexp = "Invalid"
  )
  expect_error(
    winloss("Dehli Daredevils", 2000),
    regexp = "Invalid"
  )
})
