rm(list = ls())
graphics.off()



install.packages("tibble")

library(dplyr)
library(tidyr)
library(ggplot2)
library(tibble)

# build in tables 
ggplot2::diamonds
class(ggplot2::diamonds)

ggplot2::economics
class(ggplot2::economics)


hflights::hflights
class(hflights::hflights)


# convert to tibble 
library(hflights)
class(hflights)

dft <- as_tibble(hflights)
class(dft)


df <- data.frame(x = 1:10,
                 y = seq.Date(from = as.Date("2024-01-01"),
                              to = as.Date("2024-01-10"),
                              by = "day"))

View(df)
df
class(df)

dft <- as_tibble(df)
dft

class(dft)

# tibble
tibble(v1 = seq(from = 1, to = 100, by = 1),
       v2 = pi,
       v3 = sqrt(v1),
       v4 = seq.Date(from = as.Date("2024-01-01"),
                     length.out = 100,
                     by = "day"))



