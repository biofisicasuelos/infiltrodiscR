#' van Genuchten parameters
#'
#' van Genuchten parameters for 12 soil texture classes and A values for a 2.25 cm disk radius
#' and suction values from 0.5 to 6 cm.
#'
#' @format ## `vg_parameters_bytexture`
#' A data frame with 12 rows and 11 columns:
#' \describe{
#'   \item{texture}{soil texture according to the USDA}
#'   \item{alpha}{values of parameter alpha}
#'   \item{n_ho}{values of parameter n}
#'   \item{0.5}{Values of parameter A at 0.5cm}
#'   \item{1cm}{Values of parameter A at 1cm}
#'   \item{2cm}{Values of parameter A at 2cm}
#'   \item{3cm}{Values of parameter A at 3cm}
#'   \item{4cm}{Values of parameter A at 4cm}
#'   \item{5cm}{Values of parameter A at 5cm}
#'   \item{6cm}{Values of parameter A at 6cm}
#'   \item{7cm}{Values of parameter A at 7cm}
#' }
#' @source <https://metergroup.com/products/mini-disk-infiltrometer/>
"vg_parameters_bytexture"
