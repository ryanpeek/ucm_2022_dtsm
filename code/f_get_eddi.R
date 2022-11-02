# get eddi

# library(dplyr)
# library(terra)
# library(glue)

# to test
#span <- "09mn"
#date <- "20221024"

# function
f_get_eddi <- function(date, span){
  
  epsg_rast <- 3310
  epsg_vect <- 4326 # or 4269 or 4326
  rast_proj_crs <- glue('+init=EPSG:{epsg_rast}')
  # year
  year <- substr(date, 1, 4)

  # read EDDI from link
  eddi1 <- terra::rast(glue("https://downloads.psl.noaa.gov/Projects/EDDI/CONUS_archive/data/{year}/EDDI_ETrs_{span}_{date}.asc"))
  
  # print res
  glue("resolution_{c('x','y')}: {res(eddi1)}")
  cat(crs(eddi1), "\n")
  
  # write out a tif
  print("Saving out...")
  terra::writeRaster(eddi1, overwrite=TRUE,
                     filename = glue("data_raw/EDDI_ETrs_{span}_{date}.tif"))
  
  return(eddi1)
}
