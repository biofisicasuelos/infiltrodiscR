library(tidyverse)

infiltration <- function(dataset, col_name, ...) {
  dataset %>%
    mutate(sqrt_time = round(sqrt(time),2),
          volume_infiltrated = round(first(volume) - volume, 2),
          infiltration = round(volume_infiltrated / (pi * 2.25 ^ 2),2))
}

infiltration_data <- tibble(
  soil = c(rep("soil_a",11), rep("soil_b",11)),
  time = c(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300,
           0, 35, 65, 95, 125, 155, 185, 215, 245, 275, 305),
  volume = c(95, 89, 86, 83, 80, 77, 74, 73, 71, 69, 67,
             83, 77, 64, 61, 58, 45, 42, 35, 29, 17, 15)
)




