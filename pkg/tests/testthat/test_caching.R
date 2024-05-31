testthat::test_that("Checking if 7 is prime", {
  # source(here::here("R/caching.R"))

  # Act/Assert
  testthat::expect_true(is_prime(7))
})
