test_that("Number of rows", {
  expect_equal(nrow(anime), 21460)
})

test_that("Number of columns", {
  expect_equal (ncol(anime), 28)
})

test_that("Search Anime Function only takes character vector", {
  expect_error(search_anime(123), "user_title should be a characte")
})

