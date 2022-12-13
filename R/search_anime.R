globalVariables(c("title", "anime", "synopsis"))

#' Search Anime
#'
#' @description This function can be used as a search engine for an anime. It helps you find a specific anime and give its overview, as well as give a list of anime that might be interesting for user and their information.
#'
#' @param user_title : A character vector of name of the anime title. It can be either full title or a word that is a part of the title.
#'
#' @return A table of title and synopsis of the all the possible anime that user might indicate. The table will be shown in the viewer.
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
#' @importFrom stringr "str_detect"
#' @importFrom flextable "flextable"
#' @export

search_anime <- function(user_title) {
  if (is.character(user_title)) {
    title_syn <- tryCatch(
      expr = {
        user_animedf <- anime %>%
          dplyr::filter(str_detect(anime$title, user_title)) %>%
          dplyr::select(title, synopsis)

        # return error message since user's input did not match with any of titles in the dataset
          if(nrow(user_animedf) == 0) {
            message("ERROR: Title, ", user_title, ", does not seem to exist in the dataset.")
          } else{
            # return a list of anime in Viewer
            flextable::flextable(user_animedf, cwidth = c(0.5,7,0.5))
          }
      },

      warning = function(cond) {
        message("There is a warning message: ")
        message(cond)
        return(NULL)
      },

      error = function(cond) {
        message("There is an error message: ")
        message(cond)
        return(NA)
      }
    )
    return(print(title_syn, n = nrow(title_syn)))
  } else{
    # stop if user's input is not character
    stop("user_title should be a character", call. = FALSE)
  }

}






