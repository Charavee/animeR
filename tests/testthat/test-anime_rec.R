# Test for anime_rec()
test_that("anime_rec function outputs tests", {
  #expect_equal(nrow(anime_rec("Action", "Manga", 5)), 5)
  expect_message(anime_rec(2, "Manga", 10), "ERROR: Please make sure that your genre is a character vector.")
  expect_message(anime_rec(1, 2, 3), "ERROR: Please make sure that your genre and source are character vectors.")
  expect_message(anime_rec("Action", "Manga", "10"), "ERROR: Please make sure that your inputted number is a numeric.")
})
