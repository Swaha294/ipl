context("Dimensions of data")

library(testthat)


test_that("number of columns of deliveries is correct", {
  expect_equal(ncol(deliveries), 20)
})

test_that("number of rows of deliveries is correct", {
  expect_equal(nrow(deliveries), 193468)
})

test_that("class of deliveries is correct", {
  expect_identical(class(deliveries), c("tbl_df", "tbl", "data.frame"))
})

test_that("number of columns of teams is correct", {
  expect_equal(ncol(teams), 7)
})

test_that("number of rows of teams is correct", {
  expect_equal(nrow(teams), 1630)
})

test_that("class of teams is correct", {
  expect_identical(class(teams), c("tbl_df", "tbl", "data.frame"))
})
