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

continents %>%
  summarise(`Area (km2) - tot` = sum(`Area (km2)`),
            `Population - tot` = sum(Population),
            `Percent total landmass - check` = sum(`Percent total landmass`),
            `Percent total pop. - check` = sum(`Percent total pop.`))



# Exercise 2

# Manual parsing to maintain control 
df2 <- read_csv("./data/flights_02.csv",
                col_names = T,
                col_types = cols(
                  UniqueCarrier = col_character(),
                  FlightNum = col_integer(),
                  Year = col_integer(),
                  Month = col_integer(),
                  DayofMonth = col_integer(),
                  Origin = col_character(),
                  Dest = col_character(),
                  Distance = col_number()
                ))


# Exerise 3 

library(readr)

df3 <- read_delim("./data/flights_03.csv",
                  delim = "|",
                  col_names = F,
                  skip = 12,
                  comment = "#",
                  col_types = cols(.default = "c")) |> 
  
  rename(UniqueCarrier = 1,
         FlightNum = 2,
         Date = 3,
         Origin = 4,
         Dest = 5,
         Distance = 6) |> 
  # Column parsing into mutate
  mutate(UniqueCarrier = as.character(UniqueCarrier),
         FlightNum = as.integer(FlightNum),
         Date = lubridate::ymd(Date),
         Origin = as.character(Origin),
         Dest = as.character(Dest),
         Distance = as.character(Distance))

str(df3)


# Exercise 4 

system.time(
  df4.read <- read_csv2(file = "./data/big_table_04.csv",
                        col_names = T,
                        col_types = cols(.default = "c"))
  
)


system.time(
  df4.read <- data.table::fread(file = "./data/big_table_04.csv",
                                sep = ";",
                                header = T,
                                colClasses = "character")
  
)




