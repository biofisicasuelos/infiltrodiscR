
infiltration_test <-
  tibble(
    time = c(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300),
    volume = c(95, 89, 86, 83, 80, 77, 74, 73, 71, 69, 67)
  )

infiltration_test_output <-
  tibble(
    time = c(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300),
    volume = c(95, 89, 86, 83, 80, 77, 74, 73, 71, 69, 67),
    sqrt_time = c(0, 5.48, 7.75, 9.49, 10.95, 12.25, 13.42, 14.49, 15.49, 16.43, 17.32),
    volume_infiltrated = c(0, 6, 9, 12, 15, 18, 21, 22, 24, 26, 28),
    infiltration = c(0, 0.38, 0.57, 0.75, 0.94, 1.13, 1.32, 1.38, 1.51, 1.63, 1.76)
  )

test_that("infiltration works", {
  expect_equal(infiltration(infiltration_test),
               infiltration_test_output)
})
