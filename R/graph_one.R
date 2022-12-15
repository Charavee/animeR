globalVariables(c("anime", "popularity", "genres", "title", "ranked", "rating", "anime", "title", "synopsis"))

#' animeR
#'
#' @description This function produces a side-by-side boxplot between source and score of anime based on the the time range a user inputs.
#'
#' @param start_time : A numeric vector of start time in military time format ( time in four digit).
#'
#' @param end_time : A numeric vector of end time in military time format ( time in four digit).
#'
#' @return A side-by-side boxplot
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
#' @export

graph_one <- function(start_time, end_time) {

  anime %>%
    group_by(id) %>%
    mutate(
      broadcast_time = str_split(broadcast, pattern = " ")[[1]][3]
    ) %>%
    ungroup() %>%
    filter(
      source != "Unknown",
      broadcast_time >= start_time & broadcast_time <= end_time,
      !is.na(score)
    ) %>%
    ggplot() +
    geom_boxplot(aes(x = source, y = score)) +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 90)
    )+
    labs (title = "Side-by-Side Boxplot of Score and Source",
          subtitle = "Based on user-input time range",
          x = "Source of the Anime ",
          y = "Score")

}



