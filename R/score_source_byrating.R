globalVariables(c("anime", "popularity", "genres", "title", "ranked", "rating", "anime", "title", "synopsis"))

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
#' # Obtain a boxplot of score statistics for each Source for animes with rating G.
#' score_source_byrating("G")
#'
#'
#' @import dplyr
#' @importFrom magrittr "%>%"
#'
#' @export

score_source_byrating <- function (user_rating) {

  anime %>%
    dplyr::filter(rating != "None") %>%
    dplyr::group_by(id) %>%
    dplyr::mutate(
      rating_code = str_split(rating, pattern = " ")[[1]][1]
    ) %>%
    dplyr::ungroup() %>%
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





