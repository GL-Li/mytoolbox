#' Extract columns from a sf object and return a dataframe
#'
#' @param dat_sf a sf data frame
#' @param cols string vector of selected columns
#'
#' @return a non-sf data frame
#'
#' @import sf
#' @export
#'

extract_sf_columns <- function(dat_sf, cols){
    data <- dat_sf[, cols]
    sf::st_geometry(data) <- NULL

    return(data)
}
