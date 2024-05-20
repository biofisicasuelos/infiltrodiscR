#' Calculates parameter A from (Philip, 1957)
#'
#' @param  dataset tibble or dataset
#' @param  col_name including suction, n_ho, alpha and suction
#'
#' @return A tibble giving two new columns: suction_num,
#'    and parameter_A
#' @export
#' @examples
#' parameter_A(tibble(alpha = c(0.145, 0.008), n_ho = c(2.68, 1.09),suction = c("2cm","3cm")))

parameter_A <- function(dataset, col_name, ...) {
  # Parse suction for numeric calculations
  dataset$suction_num <- -as.numeric(gsub("[^0-9.-]", "", dataset$suction))

  # Calculate parameter_A based on n value over or under 1.9
  dataset$parameter_A <- (11.65 * (dataset$n_ho^(0.1) - 1) * exp(ifelse(dataset$n_ho < 1.9, 7.5, 2.92) * (dataset$n_ho - 1.9) * dataset$alpha * dataset$suction_num)) / ((dataset$alpha * 2.25)^(0.91))

  return(dataset)
}
