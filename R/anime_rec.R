anime_rec <- function(user_genre, user_year) {
  anime %>%
    pivot_longer(cols = c("genres"))
}
