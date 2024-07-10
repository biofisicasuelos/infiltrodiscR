#' Cumulative infiltration and sqrt of time
#' Using time and volume from field spreadsheets, the
#' Cumulative infiltration and sqrt of time are calculated
#'
#' @param dataset A [tibble()] or [data.frame()] including time and volume
#' @param col_name [vars()] including time and volume
#'
#' @return A [tibble()] giving three new columns: sqrt_time,
#'    volume_infiltrated and infiltration
#'
#' @export
#'
#' @examples
#' infiltration(data.frame(time = c(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300,
#' 0, 35, 65, 95, 125, 155, 185, 215, 245, 275, 305),
#' volume = c(95, 89, 86, 83, 80, 77, 74, 73, 71, 69, 67,
#'            83, 77, 64, 61, 58, 45, 42, 35, 29, 17, 15)))

infiltration <- function(dataset, col_name) {
  # Calculate sqrt_time
  dataset$sqrt_time <- round(sqrt(dataset$time), 2)

  # Calculate volume_infiltrated
  dataset$volume_infiltrated <- round(dataset$volume[1] - dataset$volume, 2)

  # Calculate infiltration
  dataset$infiltration <- round(dataset$volume_infiltrated / (pi * 2.25 ^ 2), 2)

  return(dataset)
}



