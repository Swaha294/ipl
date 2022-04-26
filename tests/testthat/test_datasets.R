library(testthat)


test_that("number of columns of datasets is correct", {
  expect_equal(ncol(deliveries), 20)
  expect_equal(ncol(teams), 7)
  expect_equal(ncol(ipl), 18)
  expect_equal(ncol(bowlers_100), 13)
  expect_equal(ncol(batsman_100), 14)
})

test_that("number of rows of datasets is correct", {
  expect_equal(nrow(deliveries), 193468)
  expect_equal(nrow(teams), 1630)
  expect_equal(nrow(ipl), 816)
  expect_equal(nrow(bowlers_100), 100)
  expect_equal(nrow(batsman_100), 100)
})

test_that("class of deliveries is correct", {
  expect_identical(class(deliveries), c("tbl_df", "tbl", "data.frame"))
  expect_identical(class(teams), c("tbl_df", "tbl", "data.frame"))
  expect_identical(class(ipl), c("tbl_df", "tbl", "data.frame"))
  expect_identical(class(bowlers_100), c("spec_tbl_df", "tbl_df", "tbl", "data.frame"))
  expect_identical(class(batsman_100), c("spec_tbl_df", "tbl_df", "tbl", "data.frame"))
})
