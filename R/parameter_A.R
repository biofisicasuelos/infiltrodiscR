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

parameter_A <- function(dataset, col_name,...) {
  dataset %>%
    mutate(
      suction_num = -as.numeric(parse_number(suction)),
      parameter_A = (11.65*(`n_ho`^(0.1)-1)*exp(ifelse(`n_ho`<1.9,7.5,2.92)*(`n_ho`-1.9)*alpha*suction_num))/((alpha*2.25)^(0.91))
    )
}
