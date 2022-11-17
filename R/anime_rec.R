anime_rec <- function(user_genre, user_year) {
  anime %>%
    str_split(anime$genres, ", | ,")
}
