# Testing for inputs

test_that("input is a character vector", {
  expect_error(get_theme(123), "input should be a character")
})

test_that("input exists in dataset", {
  expect_error(get_theme("Comedy"), "Anime type, Comedy , not found in data")
})
