#' State sf data
#'
#' @description See usa_sf function in package alberusa for details
#'
#'
#' @return a sf
#'
#'
#' @export
#'

map_state_sf <- function() {
    state_sf <- albersusa::usa_sf("laea")
    return(state_sf)
}
