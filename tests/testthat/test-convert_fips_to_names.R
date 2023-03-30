test_that("It works", {
  state_1 <- convert_state_names(c("Alabama",  "California","Connecticut"), "abbr")
  expect_equal(state_1, c("AL", "CA", "CT"))
})

test_that("Warning works", {
  expect_warning(state_2 <- convert_state_names(c("DC", "AA","MA"), "full"),
  "One or more state names are")
  expect_equal(state_2, c("District of Columbia", NA, "Massachusetts"))
})
