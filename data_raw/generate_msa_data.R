library(tigris)
library(data.table)
library(magrittr)
library(mytoolbox)

aaa <- core_based_statistical_areas()


cbsa_coord <- extract_sf_columns(aaa, c("CBSAFP", "NAME", "INTPTLON", "INTPTLAT")) %>%
    setDT() %>%
    .[, .(msa_fips = CBSAFP,
          msa = NAME,
          lon = as.numeric(INTPTLON),
          lat = as.numeric(INTPTLAT))]

save(cbsa_coord,
     file = "data/cbsa_coord.RData",
     compress = "xz", compression_level = 9)
