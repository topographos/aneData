# Filename: 04- north-mesopotamia_sites
#
# TO DO:
#
# Author(s): Michal Michalski

library(sf)
library(dplyr)

# read the geopackage file
n_mesopotamia_sites = sf::st_read("inst/vector/surveys.gpkg",
                                      query = "select * from north_mesopotamia_sites")

# load periods
periods = read.csv("inst/vector/periods.csv") %>%
  mutate(
    Start = Start * -1,
    End = End * -1
  )

# select a North Jazira Survey
n_mesopotamia_sites_NJS = n_mesopotamia_sites %>%
  dplyr::filter(Source == 'Wilkinson and Tucker 1995')

# make a join
n_mesopotamia_sites_NJS = left_join(n_mesopotamia_sites_NJS, periods,
                                    by = c("StartDate" ="Start", "EndDate" = "End"))

# select columns and rename

n_mesopotamia_sites_NJS = n_mesopotamia_sites_NJS %>%
  select(Id, SizeHa, StartDate, EndDate, Longitude, Latitude, Name) %>%
  rename(
    Period = Name
  )

# save in a data folder
usethis::use_data(n_mesopotamia_sites_NJS, overwrite = TRUE)

?aneData::n_mesopotamia_sites_NJS
