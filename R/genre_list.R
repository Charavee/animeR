#' The List of Genres
#'
#' @description This function helps you to find all genres that you can use as an input for other function, such as `anime_rec()`.
#'
#' @return A list of 22 unique genres.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Show the list of genres
#' genre_list()
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom tidyr "unnest"
#' @export


genre_list <- function() {
  anime_genres <- anime %>%
    dplyr::mutate(genres = strsplit(as.character(genres), ", |, ")) %>%
    tidyr::unnest(genres)%>%
    dplyr::select(genres)

  message("Here is the list of genres.")
  message("There are 22 unique genres in total.")
  unique(anime_genres$genres)
}
