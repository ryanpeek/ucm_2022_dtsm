# vis static

f_make_static_plot <- function(dat, uspan, udate){
  
  # library(terra)
  # library(rasterVis)
  # library(ggthemes)
  # library(viridis)
  
  # plot
  #p1 <- plot(dat, col=viridis::magma(n = 40)) # plot
  
  # to plot raster use "gplot" requires rasterVis
  g1 <- rasterVis::gplot(x = dat) +
   geom_tile(aes(fill = value), color=ggplot2::alpha("transparent", 0)) +
   viridis::scale_fill_viridis("EDDI", option = "A") +
   ggthemes::theme_map()+
   coord_equal()

  # saving out
  ggplot2::ggsave(plot = g1, filename = glue::glue("figs/EDDI_ETrs_{uspan}_{udate}.png"), width = 8, height = 5, dpi=300)
  
}
