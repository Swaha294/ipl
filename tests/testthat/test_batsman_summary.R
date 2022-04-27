library(testthat)
library(dplyr)

test_that("check for invalid input", {
  expect_error(batsman_summary(99),
    regexp = "should be a character"
  )
})

test_that("check when data not found", {
  expect_error(batsman_summary("V Kohlu"),
    regexp = "not found"
  )
})
