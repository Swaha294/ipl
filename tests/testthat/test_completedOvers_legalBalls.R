library(tibble)
library(dplyr)
library(testthat)

df1 <- data.frame(
  "Player" = "Rahul Sharma",
  Completed_Overs = 154,
  Legal_Balls = 4,
)

test_that("check completed overs and legal balls", {
  expect_equal(df1, completedOvers_legalBalls("Rahul Sharma"))
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
