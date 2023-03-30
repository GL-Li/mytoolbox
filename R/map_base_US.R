#' base ggplot2 map of all states
#'
#' @description The map is based on the data in package albersusa
#'
#' @param textsize integer, text size
#' @param textcolor string, text color
#'
#'
#' @return a ggplot2 objecct
#'
#'
#' @export
#'

map_base_usa <- function(textsize = 5, textcolor = "grey") {

    # mute no visible biding
    lon <- lat <- lon1 <- lat1 <- lon2 <- lat2 <- state <- NULL

    ggplot2::ggplot() +
        ggplot2::geom_sf(data = gltools::map_state_sf(),
                         fill = NA,
                         color = "grey") +
        # geom_point(data = center_moved, ggplot2::aes(lon, lat)) +
        ggplot2::geom_text(data = gltools::state_center_moved,
                           ggplot2::aes(lon1, lat1, label = state),
                           color = textcolor,
                           size = textsize) +
        ggplot2::geom_segment(data = gltools::state_center_moved,
                              ggplot2::aes(x = lon,
                                           y = lat,
                                           xend = lon2,
                                           yend = lat2),
                              alpha = 0.3)
}
