context("cents_halfcents")

library(tidyverse)
library(testthat)


df <- tibble(
  batsman = "V Kohli",
  centuries = 4,
  half_centuries = 7
)

test_that({
  expect_equal(df, cents_halfcents("V Kohli", 2016))
})















































