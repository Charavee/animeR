# Tests for dataset
test_that("Number of rows", {
  expect_equal(nrow(anime), 21460)
})

test_that("Number of columns", {
  expect_equal (ncol(anime), 28)
})

