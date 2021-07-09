#' base ggplot2 map of all states
#'
#' @description The map is based on the data in package albersusa
#'
#'
#' @return a ggplot2 objecct
#'
#'
#' @export
#'

map_basse_US <- function(textsize = 5, textcolor = "grey"){
    ggplot() +
        geom_sf(data = map_state_sf(), fill = NA, color = "grey") +
        # geom_point(data = center_moved, aes(lon, lat)) +
        geom_text(data = state_center_moved, aes(lon1, lat1, label = state),
                  color = textcolor, size = textsize) +
        geom_segment(data = state_center_moved,
                     aes(x = lon, y = lat, xend = lon2, yend = lat2),
                     alpha = 0.3)
}
