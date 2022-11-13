## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
anime<-read_csv("data-raw/anime.csv") %>%
  clean_names() %>%
  select (-english)

usethis::use_data(anime, overwrite = TRUE)
