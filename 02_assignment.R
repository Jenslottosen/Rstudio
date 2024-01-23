rm(list = ls())
graphics.off()


#libraries 

library(tibble)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)



# Exercise 1

continents <- tribble(
  ~`Date (data published)`, ~Continent,  ~`Area (km2)`,  ~`Percent total landmass`,  ~`Population`, ~`Percent total pop.`, # header
  #----------------------------------------------------------------------------------------------------------------------#
  "2017-11-10",              "Africa",        30370000,   20.4,                       1287920000,    16.9,
  "2017-11-10",              "Antarctica",    14000000,    9.2,                             4490,     0.1,
  "2017-11-10",              "Asia",          44579000,   29.5,                       4545133000,    59.5,
  "2017-11-10",              "Europe",        10180000,    6.8,                        742648000,     9.7,
  "2017-11-10",              "North America", 24709000,   16.5,                        587615000,     7.7,
  "2017-11-10",              "South America", 17840000,   12.0,                        428240000,     5.6,
  "2017-11-10",              "Australia",      8600000,    5.9,                         41264000,     0.5
)


# calculate summaries

continents |> 
  summarise(`Area (km2) - tot` = sum(`Area (km2)`),
            `Population - tot` = sum(Population),
            `Percent total landmass - check` = sum(`Percent total landmass`),
            `Percent total Population - check` = sum(`Percent total Population`))


  



