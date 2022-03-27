context("cents_halfcents")

library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  batsman = "V Kohli",
  centuries = 4,
  half_centuries = 7
)

test_that("check cents and half-cents", {
  expect_equal(df, cents_halfcents("V Kohli", 2016))
})















































