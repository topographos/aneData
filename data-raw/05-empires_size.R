# Filename: 01-tell_spotting_sites (2020-08-22)
#
# TO DO: Download and save tell dataset
#
# Author(s): Michal Michalski

library(dplyr)

# read the csv file

empires_size_3000_600_raw = read.csv("inst/vector/empsizes_3000_600.csv")

# add columns with minimum and maximum values
empires_size_3000_600 = empires_size_3000_600_raw %>%
  mutate(
    Min = Area - Error,
    Max = Area + Error,
  )

# save in a data folder
usethis::use_data(empires_size_3000_600, overwrite = TRUE)
