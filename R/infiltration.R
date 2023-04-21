library(tidyverse)

infiltration <- function(dataset, col_name) {
  dataset %>%
    mutate(sqrt_time = round(sqrt(time),2),
          volume_infiltrated = round(first(volume) - volume, 2),
          infiltration = round(volume_infiltrated / (pi * 2.25 ^ 2),2))
}


infiltration(infiltration_test)
