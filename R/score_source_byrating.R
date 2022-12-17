globalVariables(c("anime", "id", "rating", "score", "source", "user_rating", "rating_code", "str_split"))

#' animeR
#'
#' @description This function produces a side-by-side boxplot between source and score based on a given rating.
#'
#' @param user_rating : A character vector of the rating.
#'
#' @return A side-by-side boxplot comparing Score statistics for each Source of animes.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain a side-by-side boxplot of Score by Source for animes with rating G.
#' score_source_byrating("G")
#'
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#' @import ggplot2
#' @import stringr
#'
#' @export

score_source_byrating <- function (user_rating) {

  anime_rating <- anime %>%
    dplyr::filter(rating != "None") %>%
    group_by(id) %>%
    mutate(
      rating_code = str_split(rating, pattern = " ")[[1]][1]
    ) %>%
    ungroup()

    if (!is.character (user_rating)){
      stop (paste0 ("input should be a character"), call. = FALSE)}
    else if ( is.numeric (user_rating)){
      stop (paste0 ("input cannot be a numeric; should be a character"), call. = FALSE)}
    else if(!(user_rating %in% anime_rating$rating_code)) {
      stop(paste0(`user_rating`, " not found in data"), call. = FALSE)}
    else {
      anime_rating %>%
        dplyr::filter(
        source != "Unknown",
        rating_code == user_rating,
        !is.na(score)
      ) %>%
      ggplot() +
      geom_boxplot(aes(x = source, y = score)) +
      theme_bw() +
      theme(
        axis.text.x = element_text(angle = 90)
      )+
      labs (title = "Side-by-Side Boxplot of Score and Source",
            subtitle = "Based on user-input rating",
            x = "Source of the Anime ",
            y = "Score")
   }

}




