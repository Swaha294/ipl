context("bat_max")

library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  "batsman" = "MS Dhoni",
  max_runs = 84
)

test_that("check maximum runs", {
  expect_identical(df, bat_max("MS Dhoni", 2019))
})































