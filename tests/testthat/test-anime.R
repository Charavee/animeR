# Tests for dataset
test_that("Number of rows", {
  expect_equal(nrow(anime), 21460)
})

test_that("Number of columns", {
  expect_equal (ncol(anime), 28)
})

# Test1 for search_anime()
test_that("Search Anime Function only takes character vector", {
  expect_error(search_anime(123), "user_title should be a characte")
})

# Test2 for search_anime()
test_that("search_anime function returns an error message when there is no anime that matches with user's input", {
  expect_message(search_anime("Charavee"), "ERROR: Title, Charavee, does not seem to exist in the dataset.")
})

# Test for anime_rec()
test_that("anime_rec function outputs tests", {
  #expect_equal(nrow(anime_rec("Action", "Manga", 5)), 5)
  expect_message(anime_rec(2, "Manga", 10), "ERROR: Please make sure that your genre is a character vector.")
  expect_message(anime_rec(1, 2, 3), "ERROR: Please make sure that your genre and source are character vectors.")
  expect_message(anime_rec("Action", "Manga", "10"), "ERROR: Please make sure that your inputted number is a numeric.")
})
