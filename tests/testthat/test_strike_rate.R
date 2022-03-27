context("strike_rate")

library(tibble)
library(dplyr)
library(testthat)


df <- tibble(
  batsman = "MS Dhoni",
  strike_rate = 134.63
)


test_that("check strike rate", {
  expect_equal(df, strike_rate("MS Dhoni", 2019))
})




































