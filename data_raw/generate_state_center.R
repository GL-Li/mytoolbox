library(data.table)
library(magrittr)
library(totalcensus)
library(ggplot2)
library(mytoolbox)

center0 <- read_acs5year(2019, states_DC, summary_level = "040")

state_center_raw <- copy(center0) %>%
    .[, .(state, lon, lat)] %>%
    .[, ":="(lon1 = lon,
             lat1 = lat,
             lon2 = lon,
             lat2 = lat)] %>%
    # (lon1, lat1) for label state names
    .[state == "VT", ":="(lon1 = -66, lat1 = 44)] %>%
    .[state == "NH", ":="(lon1 = -66.5, lat1 = 43)] %>%
    .[state == "MA", ":="(lon1 = -67.1, lat1 = 42)] %>%
    .[state == "RI", ":="(lon1 = -68, lat1 = 41)] %>%
    .[state == "CT", ":="(lon1 = -68.4, lat1 = 40)] %>%
    .[state == "NJ", ":="(lon1 = -68.8, lat1 = 39)] %>%
    .[state == "DE", ":="(lon1 = -69.3, lat1 = 38)] %>%
    .[state == "MD", ":="(lon1 = -69.8, lat1 = 37)] %>%
    .[state == "DC", ":="(lon1 = -70.2, lat1 = 36)] %>%
    # (lon2, lat2) for line end point to state names
    .[state == "VT", ":="(lon2 = -67.5, lat2 = 44.2)] %>%
    .[state == "NH", ":="(lon2 = -68, lat2 = 43.2)] %>%
    .[state == "MA", ":="(lon2 = -68.5, lat2 = 42.2)] %>%
    .[state == "RI", ":="(lon2 = -69, lat2 = 41.2)] %>%
    .[state == "CT", ":="(lon2 = -69.5, lat2 = 40.2)] %>%
    .[state == "NJ", ":="(lon2 = -70, lat2 = 39.2)] %>%
    .[state == "DE", ":="(lon2 = -70.5, lat2 = 38.2)] %>%
    .[state == "MD", ":="(lon2 = -71, lat2 = 37.2)] %>%
    .[state == "DC", ":="(lon2 = -71.5, lat2 = 36.2)]



state_center_moved <- copy(state_center_raw) %>%
    map_move_ak_hi() %>%
    map_move_ak_hi(x = "lon1", y = "lat1")  %>%
    map_move_ak_hi(x = "lon2", y = "lat2")


ggplot() +
    geom_sf(data = map_state_sf(), fill = NA, color = "grey") +
    # geom_point(data = center_moved, aes(lon, lat)) +
    geom_text(data = state_center_moved, aes(lon1, lat1, label = state),
              color = "grey", size = 5) +
    geom_segment(data = state_center_moved,
                 aes(x = lon, y = lat, xend = lon2, yend = lat2),
                 alpha = 0.3) +
    theme_bw() +
    theme(panel.grid = element_blank())



save(state_center_raw, file = "data/state_center_raw.RData")

save(state_center_moved, file = "data/state_center_moved.RData")
