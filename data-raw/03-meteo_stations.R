# Filename: 03-meteo_stations (2020-10-17)
#
#
# Author(s): Michal Michalski

library(readxl)
library(dplyr)
library(sf)
library(biogeo)


# load excel workbook
meteo_stations_raw = read_excel("inst/vector/excl_meteo.xlsx",
                                sheet = 1)
# create a table
meteo_stations = meteo_stations_raw %>%
  mutate(
    lat = biogeo::dms2dd(meteo_stations_raw$lat_dd,meteo_stations_raw$lat_mm, 0,"N"),
    long = biogeo::dms2dd(meteo_stations_raw$long_dd,meteo_stations_raw$long_mm, 0,"E")
  ) %>%
  select(-lat_dd, -lat_mm, -long_dd, -long_mm)

# write.csv(meteo_stations, "meteo_stations.csv")

# save in a data folder
usethis::use_data(meteo_stations, overwrite = TRUE)

# create a sf object

meteo_stations_sf = meteo_stations %>%
  st_as_sf(coords = c("long", "lat"), crs = 4326)




