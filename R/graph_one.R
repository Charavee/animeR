globalVariables(c("anime", "popularity", "genres", "title", "ranked", "rating", "anime", "title", "synopsis"))

#' animeR
#'
#' @description This function produces a bar graph showing the .
#'
#' @param user_num : A numeric vector of the number of anime that user wants as an output.
#'
#' @return A tibble of the specified number of anime and its synopsis, and other information?
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
    )

}




anime %>%
  filter(
    day %in% str_split(broadcast, pattern = " ")[[1]]
  ) %>%
  mutate(
    time = str_split(broadcast, pattern = " ")[[1]][3]
  ) %>%
  filter(
    !is.na(time)
  ) %>%
  ggplot() +
  geom_col(aes(x = time, y = score))


anime_graph <- anime %>%
  filter (genres != "Unknown") %>%
  filter (themes != "Unknown") %>%
  mutate(
    genres_grouped = ifelse(sum(!is.na(match(c("Action", "Comedy", "Fantasy"), str_split(genres, pattern = ",")[[1]]))) == 3,
                            "All Top 3 Genres Present", NA),
    genres_grouped = ifelse(sum(!is.na(match(c("Action", "Comedy", "Fantasy"), str_split(genres, pattern = ",")[[1]]))) == 2,
                            "Two of Top 3 Genres Present", genres_grouped),
    genres_grouped = ifelse(sum(!is.na(match(c("Action", "Comedy", "Fantasy"), str_split(genres, pattern = ",")[[1]]))) == 1,
                            "One of Top 3 Genres Present", genres_grouped),
    genres_grouped = ifelse(sum(!is.na(match(c("Action", "Comedy", "Fantasy"), str_split(genres, pattern = ",")[[1]]))) == 0,
                            "None of Top 3 Genres Present", genres_grouped)
  )


