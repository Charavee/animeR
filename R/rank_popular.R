
globalVariables(c("anime", "popularity", "genres", "title", "ranked", "rating", "anime", "title", "synopsis", "source"))

#' animeR
#'
#' @description This function generates a number (user-specified) of the top animes ranked by popularity.
#'
#' @param user_num : A numeric vector of the number of anime the user seeks.
#'
#' @return A tibble of the specified number of anime and its genre, source, rank and rating.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain Top 20 animes ranked by popularity
#' rank_popular(20)
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom tidyr "unnest"
#' @importFrom utils "head"
#' @importFrom magrittr "%>%"
#' @export

rank_popular <- function (user_num) {

  if (!is.numeric (user_num)){
    stop (paste0 ("input should be a numeric"))}
  else if ( is.character (user_num)){
    stop (paste0 ("input should be a numeric"))}
  else if ( user_num< 1 ){
    stop (paste0 ("input should be a positive number/greater than 0"))}
  else if (user_num > 21490){
    stop (paste0 ("input cannot be greater than 21490"))}

  else {
    anime_topn <- anime[order(anime$popularity),] %>%
      dplyr::select (popularity, title, genres, source, ranked, rating) %>%
      utils::head(n = user_num)

    print (anime_topn)
  }

}



