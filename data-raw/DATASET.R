## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
anime.csv<-read_csv("data-raw/Anime.csv") %>%
  clean_names()

usethis::use_data(DATASET, overwrite = TRUE)
