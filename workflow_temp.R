library(usethis)
library(devtools)
library(aneData)
library(rrtools)
library(sinew)
library(sf)
library(spData)
#re-sources
# https://r-pkgs.org/index.html
# https://www.erikhoward.net/blog/how-to-create-an-r-data-package/
# https://blog.r-hub.io/2020/05/29/distribute-data/
#  DESCRIPTION file - metadata about the package
#  R - folder that contains R code
#  data - folder for the final datasets
# data - raw -
install.packages("spData")
devtools::install_github("mdlincoln/docthis")
# create a package
usethis::create_package("~/Documents/aneData/")
#
rrtools::use_readme_rmd()
# create data-raw
usethis::use_data_raw()
# This script in the R directory will contain the documentation.
# You can use any name you want.
# When you load a package with library or require, R looks in the package directory and runs the stuff.R files in R/.
file.create("R/data.R")
#make documentation - to be copied into data.R code
sinew::makeOxygen(n_mesopotamia_sites_NJS)
# generate roxygen documentation
devtools::document()

devtools::load_all()

#st_read(system.file("vector", "tellspotting_sites.kml", package = "aneData"))
