library(dplyr)
library(testthat)

df <- data.frame(
  "bowler" = "Rahul Sharma",
  "overs" = 154.4,
  "maiden_overs" = 2,
  "runs" = 1086,
  "wickets_taken" = 40
)

test_that("check bowling analysis", {
  expect_identical(df, bowling_analysis("Rahul Sharma"))
})

test_that("check for when data not found", {
  expect_error(bowling_analysis("Sharma"),regexp = "input another name")
  expect_error(bowling_analysis("Rahul"),regexp = "input another name")
})
