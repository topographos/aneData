# Filename: 01-tell_spotting_sites (2020-08-22)
#
# TO DO: Download and save tell dataset
#
# Author(s): Michal Michalski

library(sf)
library(stringr)
library(dplyr)

#download data
url <- "http://home.in.tum.de/~menze/habur_org/data/tellspotting_sites.kml"
destination_filename = "inst/vector/tellspotting_sites.kml"
download.file(url, destination_filename)
# load data as sf

tellspotting_sites_raw = st_read("inst/vector/tellspotting_sites.kml")

tellspotting_sites = tellspotting_sites_raw %>%
  mutate(
    elevation = as.numeric(str_sub(Description, start = 19, end = -2)) # create new attribute only with height value
  ) %>%
  select(-Name,-Description) %>% # deselect columns
  st_zm() #remove z dimension

# save in a data folder
usethis::use_data(tellspotting_sites, overwrite = TRUE)
