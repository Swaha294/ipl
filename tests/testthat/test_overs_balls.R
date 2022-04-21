library(tibble)
library(dplyr)
library(testthat)

df1 <- data.frame(
  "player" = "Rahul Sharma",
  completed_overs = 154,
  balls = 4
)

test_that("check completed overs and legal balls", {
  expect_equal(df1, overs_balls("Rahul Sharma"))
})

test_that("check for invalid input types", {
  expect_error(overs_balls(400), regexp = "must be a character")
})

test_that("check for when data not found", {
  expect_error(
    overs_balls("Sharma"),
    regexp = "input another name"
  )
  expect_error(
    overs_balls("Rahul"),
    regexp = "input another name"
  )
})
