globalVariables(c("genres"))
#' Find *n* most Popular Anime Based on Given Genre and Source
#'
#' @description This function helps you to find the top *n* most popular anime in its certain genre and source. There are 21 unique genres and 16 unique sources to choose from. Please use `unique_list(user_variable)` to see the list of unique genres and sources that you can choose from.
#'
#' @param user_genre : A character vector of genre of the anime. Users can pick one genre out of the list of 21 genres we provide.
#'
#' @param user_source : A character vector of source of the anime. Users can also pick one source out of the list of 16 sources.
#'
#' @param user_num : A numeric vector of the number of anime that user want as an output.
#'
#' @return A table of top *n* most popular anime of given genre and source with their titles, synopsis, and popularity.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Check the list of genres
#' unique_list("genres")
#'
#' # Check the list of sources
#' unique_list("sources")
#'
#' # Top 15 most popular action anime that are based on manga
#' anime_rec("Action", "Manga", 15)
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @importFrom tidyr "unnest"
#' @importFrom utils "head"
#' @importFrom flextable "flextable"
#' @export


anime_rec <- function(user_genre, user_source, user_num) {
  # All the possible errors about user inputs
  if (is.character(user_genre) == FALSE & is.character(user_source) == TRUE & is.numeric(user_num) == TRUE) {
    # user_genre has to be a character, print error message
    message("ERROR: Please make sure that your genre is a character vector.")
  } else if (is.character(user_genre) == TRUE & is.character(user_source) == FALSE & is.numeric(user_num) == TRUE){
    # user_source has to be a character, print an error message
    message("ERROR: Please make sure that your source is a character vector.")
  } else if (is.character(user_genre) == TRUE & is.character(user_source) == TRUE & is.numeric(user_num) == FALSE){
    # user_num has to be a numeric, print an error message
    message("ERROR: Please make sure that your inputted number is a numeric.")
  } else if (is.character(user_genre) == FALSE & is.character(user_source) == FALSE & is.numeric(user_num) == TRUE){
    # user_genre and user_source have to be character vectors, print an error message
    message("ERROR: Please make sure that your genre and source are character vectors.")
  } else if(is.character(user_genre) == FALSE & is.character(user_source) == TRUE & is.numeric(user_num) == FALSE){
    # user_genre has to be a character vector and user_num has to be a numeric, print an error message
    message("ERROR: Please make sure that your genre is a character and the inputed number is a numeric.")
  } else if(is.character(user_genre) == FALSE & is.character(user_source) == FALSE & is.numeric(user_num) == FALSE){
    # all of the inputs are not correct
    message("ERROR: Please make sure that your genre and soure are the character vectors and the inputed number is a numeric.")
  } else{
    # When all the user inputs are in a correct format
    # split genres and create new rows
    anime_genres <- anime %>%
      dplyr::mutate(genres = strsplit(as.character(genres), ", |, ")) %>%
      tidyr::unnest(genres)

    # Show top user specified number most popular anime based on the given genre and source
    if (user_genre %in% anime_genres$genres & user_source %in% anime_genres$source) {
      user_anime_rec <- subset(anime_genres, select = c("title", "synopsis", "popularity", "genres", "source")) %>%
        dplyr::filter(genres == user_genre & source == user_source)

      user_anime_rec <- user_anime_rec[order(user_anime_rec$popularity),] %>%
        dplyr::select(-c("genres", "source")) %>%
        utils::head(n = user_num)

      # return a table in a Viewer

      flextable::flextable(user_anime_rec, cwidth = c(0.5,7,0.5))

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
}
