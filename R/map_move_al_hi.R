#' Move the locations in Alaska and Hawaii
#'
#' @description Move (lon, lat) in AK and HI to new locations match the state
#' map provided by the albersusa package (github)
#'
#' @param df a data.frame containing coordinates
#' @param x specify longitude column
#' @param y specify latitude column
#'
#' @details This function will identify those coordinates belongs to AK or HI
#' and moves them to the US map provided by the albersusa package. Coordinates
#' belong to other states will not moved.
#'
#' @return The same data frame with altered coordimates in AK and HI
#'
#' @examples
#' \dontrun{
#' counties <- totalcensus::read_acs1year(
#'   2019, c("AK", "HI", "RI"), summary_level = "county"
#' )
#'
#' counties_moved <- map_move_ak_hi(counties)
#' }
#'
#' @export
#'

map_move_ak_hi <- function(df, x = "lon", y = "lat") {
    # move the lon and lat of Alaska and Hawaii to the location of 50 states US
    # map and also convert their value to those match the results of usa_sf()
    is_datatable <- data.table::is.data.table(df)

    df <- as.data.frame(df)

    xy <- df[, c(x, y)]
    xy <- albersusa::points_elided(xy)
    df[x] <- xy[, 1]
    df[y] <- xy[, 2]

    if (is_datatable) data.table::setDT(df)

    return(df)
}
