
# polynomial_fit ----------------------------------------------------------

infiltration_data %>%
  group_by(soil) %>%
  nest() %>%
  mutate(data = map(data, ~ infiltration(.), data = .x
  )) %>%
  mutate(fit = map(data, ~ lm(
    infiltration ~ poly(sqrt_time, 2, raw = TRUE), data = .x)))
