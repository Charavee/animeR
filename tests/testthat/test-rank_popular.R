
# Test for input

test_that ("input is a numeric",{
  expect_error(rank_popular("charger"), "input should be a numeric")
  })

test_that ("input is a positive and greater than 0 numeric",{
  expect_error(rank_popular(-1), "input should be a positive number/greater than 0")
})


test_that ("input does not exceed maximum number of rows",{
  expect_error(rank_popular(1000000), "input cannot be greater than 21490")
})

test_that ("returns correct number of rows",{
  expect_equal(nrow(rank_popular(10)), 10)
})



