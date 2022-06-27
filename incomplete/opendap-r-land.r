# OpenDAP demo
# 2022-06-25

# this is interesting, but not what I want. Map projections and land data only.

# devtools::install_github("ptaconet/opendapr", build_vignettes = F, build_manual = T)
# https://github.com/ropensci/MODISTools
library(opendapr)

odr_list_collections()

collection <- "MCD15A2H.006"

# create account https://urs.earthdata.nasa.gov/
username <- Sys.getenv("earthdata_un")
password <- Sys.getenv("earthdata_pw")
username <- "andrewirwin"
password <- "RaSG5mApK$cV4bv"
odr_login(credentials = c(username,password),source = "earthdata")


odr_list_variables(collection)

roi = sf::st_as_sf(data.frame(
  geom="POLYGON ((-5.82 9.54, -5.42 9.55, -5.41 8.84, -5.81 8.84, -5.82 9.54))"),
  wkt="geom",crs = 4326)

time_range = as.Date(c("2017-01-01","2017-01-30"))


df_2_dl <- odr_get_url(collection, roi = roi, time_range = time_range)
df <- odr_download_data(df_2_dl)
