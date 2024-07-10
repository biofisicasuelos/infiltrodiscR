library(tidyverse)

vg_par_test <- tibble(suction = c("2cm", "3cm"), texture = c("sand", "clay"))

vg_par_test_output <- tibble(suction = c("2cm", "3cm"),
                             texture = c("sand", "clay"),
                             alpha = c(0.145, 0.008),
                             n_ho = c(2.68, 1.09),
                             value_A = c(1.72790757,4.51456209))

test_that("vg_par works", {
  expect_equal(vg_par(vg_par_test),
               vg_par_test_output)
})
