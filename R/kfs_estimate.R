
# kfs_estimate ------------------------------------------------------------


parameter_A <- function(dataset, col_name,...) {
  dataset %>%
    mutate(suction_num = -as.numeric(parse_number(suction))) %>%
  transmute(
    parameter_A = (11.65*(`n_ho`^(0.1)-1)*exp(ifelse(`n_ho`<1.9,7.5,2.92)*(`n_ho`-1.9)*alpha*suction_num))/((alpha*2.25)^(0.91)),
  )
 }

