library(tibble)
library(dplyr)
library(testthat)


df <- data.frame(
  "statistic" = c("most_overs", "most_runs", "most_wickets", "most_matches", "most_innings"),
  "bowler" = c("Harbhajan Singh", "Piyush Chawla", "Lasith Malinga", "Suresh Raina", "Harbhajan Singh"),
  "value" = c(562.2, 4072.0, 170.0, 193.0, 157.0)
)

test_that("check bowler summary", {
  expect_identical(df, bowler_summary())
})
