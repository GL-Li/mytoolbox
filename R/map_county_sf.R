#' County sf data
#'
#' @description See counties_sf function in package alberusa for details
#'
#'
#' @return a sf
#'
#'
#' @export
#'

map_county_sf <- function() {
    county_sf <- albersusa::counties_sf("aeqd")
    return(county_sf)
}
