globalVariables(c("anime", "popularity", "genres", "title", "ranked", "rating", "anime", "title", "synopsis"))
#' animeR
#'
#' @description This function generates the top 20 anime ranked by popularity.
#'
#' @return A dataframe of title and synopsis of the all the possible anime that user might indicate.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain Top 20 animes ranked by popularity
#' rank_popular()
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @export

rank_popular <- function () {
  anime_top5 <- anime %>%
    dplyr::select (popularity, genres, title, ranked, rating) %>%
    dplyr::filter (popularity == c (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20))

  print (anime_top5)
}



