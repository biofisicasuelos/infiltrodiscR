library(tidyverse)

parameter_A_test <- tibble(
  alpha = c(0.145, 0.008),
  n_ho = c(2.68, 1.09),
  suction = c("2cm", "3cm")
)

parameter_A_test_output <- tibble(
  alpha = c(0.145, 0.008),
  n_ho = c(2.68, 1.09),
  suction = c("2cm", "3cm"),
  suction_num = c(-2, -3),
  parameter_A = c(1.72790757,4.51456209)
)

test_that("parameter_A works", {
  expect_equal(parameter_A(parameter_A_test),
               parameter_A_test_output)
})
