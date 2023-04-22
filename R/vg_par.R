#' Tabulated VG parameters
#' Van Genuchten parameters and values of A, n and alpha for the Minidisk
#' Infiltrometer (Decagon Devices, Inc., 2005).
#' 12 soil texture classes and suction from
#' 0.5 to 7 cm are tabulated
#' @param  suction a chr or vector of chr
#' @param  texture a chr or vector of chr
#' @return A tibble giving three new columns: n_ho,
#'    alpha and value
#' @export
#' @examples
#' vg_par(suction = c("2cm", "3cm"), texture = c("sand", "clay"))


# function ----------------------------------------------------------------

vg_par <- function(suction, texture,...) {
  vg_parameters_bytexture_radius2.25 %>%
    filter(texture == {{texture}} & suction == {{suction}})
}

