#' Find Top 5 Popular Anime
#'
#' @description This function helps you to find the top 5 most popular anime in its certain genre and source. There are 22 unique genres and 17 unique sources to choose from.
#'
#' @param user_genre : A character vector of genre of the anime. Users can pick one genre out of the list of 22 genres we provide.
#'
#' @param user_source: A character vector of source of the anime. Users can also pick one source out of the list of 17 sources.
#'
#' @return A tibble of top five most popular anime with their titles, synopsis, and popularity.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Top five most popular action anime that are based on manga
#' anime_rec("Action", "Manga")
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom stringr "str_detect"
#' @export


anime_rec <- function(user_genre, user_source) {
  # split genres and create new rows
  anime_genres <- anime %>%
    mutate(genres = strsplit(as.character(genres), ", |, ")) %>%
    unnest(genres)

  # Show top 5 most popular anime based on the given genre and source
  if (user_genre %in% anime_genres$genres & user_source %in% anime_genres$source) {
    user_anime_rec <- subset(anime_genres, select = c("title", "synopsis", "popularity", "genres", "source")) %>%
      dplyr::filter(genres == user_genre & source == user_source)

    user_anime_rec[order(user_anime_rec$popularity),] %>%
      dplyr::select(-c("genres", "source")) %>%
      head(n = 5)

  } else if (user_genre %in% anime_genres$genres & !(user_source %in% anime_genres$source)) {
    # Print error message
    message("ERROR: Your source, ", user_source, ", cannot be found in the dataset. Please pick one source that is in the dataset and try again.")
  } else if (!(user_genre %in% anime_genres$genres) & user_source %in% anime_genres$source) {
    # Print error message
    message("ERROR: Your genre, " , user_genre, ", cannot be found in the dataset. Please pick one genre that is in the dataset and try again.")
  } else {
    message("ERROR: Both of your inputs cannot be found in the dataset. Please select one genre and source that is in the dataset and try again.")
  }
}
