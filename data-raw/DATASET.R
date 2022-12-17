## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
anime<-read_csv("data-raw/anime.csv") %>%
  clean_names()

#stop_words<-read_csv("data-raw/stop_words.csv") %>%
  #clean_names()

usethis::use_data(anime, overwrite = TRUE)

usethis::use_data(stop_words, overwrite = TRUE)

