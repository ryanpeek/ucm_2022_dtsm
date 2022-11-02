# get county data
library(tigris)
options(tigris_use_cache = TRUE)

f_get_counties <- function(){
  
  if(!file.exists("data_raw/ca_counties.rds")){
    cnty <- counties()
    # filter to CA:
    cnty_ca <- dplyr::filter(cnty, STATEFP=="06") 
    readr::write_rds(cnty_ca, "data_raw/ca_counties.rds")
  } else({
    cnty_ca <- readr::read_rds("data_raw/ca_counties.rds")
    return(cnty_ca)})
}
    
