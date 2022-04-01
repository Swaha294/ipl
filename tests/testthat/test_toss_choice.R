library(dplyr)
library(testthat)

df <- tibble(
  "toss_decision" = c("bat", "field"),
  "num" = c(24, 33)
)

test_that("check toss choice", {
  expect_length(toss_choice("Sunrisers Hyderabad"), 2)
})

test_that("check for invalid input types", {
  expect_error(
    toss_choice(00),
    regexp = "be a character"
  )
})

test_that("check for when data not found", {
  expect_error(
    toss_choice("Dehli"),
    regexp = "Invalid team name"
  )
})
