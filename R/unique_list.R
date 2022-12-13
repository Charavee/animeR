#' The List of Unique Genres, Sources, Themes, Licensors, Producers, or Studios
#'
#' @description This function helps you to find all genres and sources that you can use as an input for other function, such as `anime_rec()`. In addition to genres and sources, users can check the list of unique themes, licensors, producers, and studios as well.
#'
#' @return A list of unique genres, sources, themes, licensors, producers, or studios.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Show the list of genres
#' genre_list()
#'
#' # Show the list of themes
#' unique_list("themes")
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom tidyr "unnest"
#' @export

unique_list <- function(user_variable){
  if (is.character(user_variable) == FALSE){
    errorCondition(message = "Please input a character vector, not a numeric vector.")
  }else{
    if (tolower(user_variable) == "genres" || tolower(user_variable) == "genre"){
      anime_genres <- anime %>%
        dplyr::filter(anime$genres != "Unknown") %>%
        dplyr::mutate(genres = strsplit(as.character(genres), ", |, ")) %>%
        tidyr::unnest(genres) %>%
        dplyr::select(genres)

      message("Here is the list of genres.")
      message("There are 21 unique genres in total.")
      unique(anime_genres$genres)
    }else if (tolower(user_variable) == "sources" || tolower(user_variable) == "source"){
      anime <- anime %>%
        dplyr::filter(anime$source != "Unknown")
      message("Here is the list of sources.")
      message("There are 16 unique sources.")
      unique(anime$source)
    }else if (tolower(user_variable) == "themes" || tolower(user_variable) == "theme"){
      anime_themes <- anime %>%
        dplyr::filter(anime$themes != "Unknown") %>%
        dplyr::mutate(themes = strsplit(as.character(themes), ", |, ")) %>%
        tidyr::unnest(themes) %>%
        dplyr::select(themes)

      message("Here is the list of themes.")
      message("There are 50 unique themes.")
      unique(anime_themes$themes)
    }else if (tolower(user_variable) == "demographics" || tolower(user_variable) == "demographic"){
      anime <- anime %>%
        dplyr::filter(anime$demographics != "Unknown")
      message("Here is the list of demographics.")
      message("There are 9 unique demographics.")
      unique(anime$demographics)
    }else if (tolower(user_variable) == "licensors" || tolower(user_variable) == "licensor"){
      anime <- anime %>%
        dplyr::filter(anime$licensors != "Unknown") %>%
        dplyr::mutate(licensors = strsplit(as.character(licensors), ", |, ")) %>%
        tidyr::unnest(licensors) %>%
        dplyr::select(licensors)

      message("Here is the list of unique licensors.")
      message("There are 86 unique licensors.")
      unique(anime$licensors)
    }else if (tolower(user_variable) == "producers" || tolower(user_variable) == "producer"){
      anime <- anime %>%
        dplyr::filter(anime$producers != "Unknown") %>%
        dplyr::mutate(producers = strsplit(as.character(producers), ", |, ")) %>%
        tidyr::unnest(producers) %>%
        dplyr::select(producers)

      options(max.print = 1500)
      message("Here is the list of unique producers.")
      messgae("There are 1465 unique producers.")
      unique(anime$producers)
    }else if (tolower(user_variable) == "studios" || tolower(user_variable) == "studio"){
      anime <- anime %>%
        dplyr::filter(anime$studios != "Unknown") %>%
        dplyr::mutate(studios = strsplit(as.character(studios), ", |, ")) %>%
        tidyr::unnest(studios) %>%
        dplyr::select(studios)

      message("Here is the list of unique studios.")
      message("There are 965 unique studio.")
      unique(anime$studios)
    }else{
      errorCondition(message = "Please check the variable name that you inputed. It must be one of the following: genres, sources, themes, demographics, licensors, producers, studios.")
    }
  }
}
