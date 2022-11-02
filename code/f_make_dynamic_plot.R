# vis dynamic

f_make_dynamic_plot <- function(counties, udate, uspan){
  library(mapview)
  dat_r <- raster::raster(glue("data_raw/EDDI_ETrs_{uspan}_{udate}.tif"))
  m1 <- mapview(dat_r, layer.name=glue("EDDI {udate}_{uspan}")) +
    mapview(counties, layer.name="Counties", lwd=0.8,
            alpha.regions=0, color="gray80")
  mapview::mapshot(m1, url = "figs/demo_raster_eddi.html")
}