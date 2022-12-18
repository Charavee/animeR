# Testing for inputs

test_that("input is a character vector", {
  expect_error(get_trend(123), "input should be a character")
})

test_that("input exists in dataset", {
  expect_error(get_trend("Comedy"), "Rating, Comedy , not found in data")
})
