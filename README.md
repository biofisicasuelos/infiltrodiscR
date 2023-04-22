
# infiltrodiscR

<!-- badges: start -->
<!-- badges: end -->

The goal of infiltrodiscR is to provide functions for the modeling of data derived from the Minidisc Infiltrometer device

## Installation

You can install the development version of infiltrodiscR from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Saryace/infiltrodiscR")
```

## Main functions:

**`infiltration()`**

This function calculates cumulative infiltration and the square root of time, using time and volume recorded. 

**`vg_par`**

This function returns the parameter *A*, *no_h* and *alpha* related to the van Genuchten parameters (van Genuchten, 1980), from tabulated data calculated for a radius of 2.25 cm, including 12 soil texture classes and suctions from -0.5 cm to -7 cm. Data from (Decagon Devices, Inc., 2005)

**`kfs_estimate`**
This function returns the parameter *A* calculated from the equation proposed by Zhang (1997)

## Tutorial

To determine the unsaturated hydraulic conductivity at specific suctions, the Minidisc Infiltrometer data can be fitted to the method proposed by Zhang (1997). The first step is to calculate the cumulative infiltration vs. the square root of time.


``` r
library(tidyverse)
library(infiltrodiscR)
infiltration_data <- tibble(
  soil = c(rep("soil_a",11), rep("soil_b",11)),
  time = c(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300,
           0, 35, 65, 95, 125, 155, 185, 215, 245, 275, 305),
  volume = c(95, 89, 86, 83, 80, 77, 74, 73, 71, 69, 67,
             83, 77, 64, 61, 58, 45, 42, 35, 29, 17, 15)
)

infiltration_data %>% 
group_by(soil) %>% 
nest() %>% 
mutate(data = map(data, ~ infiltration(.), data = .x)) 

```

