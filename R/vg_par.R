#' Tabulated VG parameters
#' Van Genuchten parameters and values of A, n and alpha for the Minidisk
#' Infiltrometer (Decagon Devices, Inc., 2005).
#' 12 soil texture classes and suction from
#' 0.5 to 7 cm are tabulated
#' @param dataset A [tibble()] or [data.frame()] including suction and texture
#' @param col_name [vars()] including suction and texture
#' @return A tibble giving three new columns: n_ho,
#'    alpha and A value
#' @export
#' @examples
#' vg_par(data.frame(suction = c("2cm", "3cm"), texture = c("sand", "clay")))


# function ----------------------------------------------------------------

vg_par <- function(dataset, col_name) {

suction <- tabulated_cm <- "0.5cm" <- "7cm" <- NULL


# join data nested with the VG parameter
dataset_join <- dplyr::left_join(dataset, vg_parameters_bytexture)

dataset_pivoted <- tidyr::pivot_longer(dataset_join,
                                `0.5cm`:`7cm`,
                                names_to = "tabulated_cm",
                                values_to = "value_A")
#select data tabulated
filtered_data <- subset(dataset_pivoted, suction == tabulated_cm,
                        select = -tabulated_cm)

# return filtered_data

return(filtered_data)

}

