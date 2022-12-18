# Test for unique_list()
test_that("unique_list function outputs tests", {
  expect_message(unique_list(1), "Please input a character vector, not a numeric vector.")
  expect_message(unique_list("id"), "Please check the variable name that you inputed. It must be one of the following: genres, sources, themes, demographics, licensors, producers, studios.")
  expect_equal(length(unique_list("sources")), 16)
})
