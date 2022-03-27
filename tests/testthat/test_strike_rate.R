context("strike_rate")

library(tidyverse)
library(testthat)


df <- tibble(
  batsman = "MS Dhoni",
  strike_rate = 134.63
)


test_that({
  expect_equal(df, strike_rate("MS Dhoni", 2019))
})




































