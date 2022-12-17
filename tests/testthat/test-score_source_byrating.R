
# Testing for inputs

test_that("input is a character vector", {
  expect_error(score_source_byrating(123), "input should be a character")
})

test_that("input exists in dataset", {
  expect_error(score_source_byrating("Michiru"), regexp= "not found in data")
})




