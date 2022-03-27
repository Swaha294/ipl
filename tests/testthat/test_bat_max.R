context("bat_max")

library(tidyverse)
library(testthat)


df <- tibble(
  "batsman" = "MS Dhoni",
  max_runs = 84
)

test_that({
  expect_equal(df, bat_max("MS Dhoni", 2019))
})































