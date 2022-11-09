## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
anime<-read_csv("data-raw/Anime.csv") %>%
  clean_names()

usethis::use_data(anime, overwrite = TRUE)
