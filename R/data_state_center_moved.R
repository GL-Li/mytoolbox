#' State center coordinates moved according to albersusa package
#'
#' This data is slightly different from the trun geographic state center as some
#' small state at east coast have been offset for better labeling.
#'
#' @docType data
#'
#' @usage data("state_center_moved")
#'
#' @format A data.table with 51 rows and three variable:
#' \describe{
#'   \item{state}{postal code of state such as "CA" and "TX"}
#'   \item{lon}{longitude, directly from ACS data}
#'   \item{lat}{latitude, directly from ACS data}
#'   \item{lon1}{longitude, shift some states for text label}
#'   \item{lat1}{latitude, shift some states for text label}
#'   \item{lon2}{longitude, shift some states for line label}
#'   \item{lat2}{latitude, shift some states for line label}
#' }
#'
#' @keywords datasets
#'
#'

"state_center_moved"
