library(usethis)
library(devtools)
library(aneData)
library(rrtools)

install.packages("spDataLarge")

install.packages("sinew")
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
#make documentattion
sinew::makeOxygen(tellspotting_sites)
# generate roxygen documentation
devtools::document()

devtools::load_all()

st_read(system.file("vector", "tellspotting_sites.kml", package = "aneData"))

plot(tellspotting_sites)
