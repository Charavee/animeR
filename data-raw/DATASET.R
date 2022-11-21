## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(janitor)
anime<-read_csv("data-raw/anime.csv") %>%
  clean_names() %>%
  select (-english)

stop_words<-read_csv("data-raw/stop_words.csv") %>%
  clean_names()

usethis::use_data(anime, overwrite = TRUE)
