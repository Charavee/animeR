#' The List of Sources
#'
#' @description This function helps you to find all sources that you can use as an input for other function, such as `anime_rec()`.
#'
#' @return A list of 17 unique genres, including Unknown.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Show the list of sources
#' source_list()
#'
#' @export

source_list <- function(){
  unique(anime$source)
}
