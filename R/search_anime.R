#' animeR
#'
#' @description This function can be used as a search engine for an anime. It helps you find a specific anime and give its overview, as well as give a list of anime that might be interesting for user and their information.
#'
#' @param title_short : A character vector of name of the anime title. It can be either full title or a word that is a part of the title.
#'
#' @return A dataframe of title and synopsis of the all the possible anime that user might indicate.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain the synopsis for all anime that contains "Naruto" in their title
#' search_anime("Naruto")
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @export

search_anime <- function(title_short) {
  if (is.character(title_short)){
    title_syn <- tryCatch(
      expr = {
        user_animedf <- anime %>%
          dplyr::filter(str_detect(anime$Title, title_short)) %>%
          dplyr::select(Title, Synopsis)
      },
      error = function(cond) {
        message(paste("Title does not seem to exist:", title_short))
        return(NA)
      }
    )
    return(title_syn)
  } else{
    stop("title_short should be a character", call. = FALSE)
  }

}





