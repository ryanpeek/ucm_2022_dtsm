# targets raw

library(targets)
library(tarchetypes)

# Set target options:
options(tidyverse.quiet = TRUE)
tar_option_set(
  packages = c("tidyverse", "glue", "viridis", "here", "fs",
               "terra", "units", "janitor","tigris","raster",
               "lubridate","rasterVis", "sf"))
options(dplyr.summarise.inform = FALSE)

# make the default dir
fs::dir_create("data_raw")
#fs::dir_create("data_out")
fs::dir_create("figs")

# Load all functions (or source one by one if needed)
for (file in list.files("code", full.names = TRUE)) 
  source(file)

udate <- "20221024"
uspan <- "09mn"

list(
  tar_target(name = eddi_data,
             command = f_get_eddi(udate, uspan)),
  tar_target(counties,
             f_get_counties()),
  tar_target(plot_static,
             f_make_static_plot(eddi_data, uspan, udate)),
  tar_target(plot_mapview,
             f_make_dynamic_plot(counties, udate, uspan))
)

  