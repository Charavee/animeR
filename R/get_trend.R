globalVariables(c("synopsis", "word", "stop_words", "duration_minutes", "type", "mean_score", "reorder", "plot1", "plot2", "plot3"))

#' Generate three visualizations regarding duration, score across producers, and score across different genre
#'
#' @description This function is used to generate visualizations to show the trend of anime duration and score distributions.
#'
#' @return Three visualizations about anime duration, score across different genre and score across different producers.
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain a word cloud that shows the most frequent words appeared in all anime's synopsis.
#' get_trend()
#'
#' @import dplyr
#' @import RColorBrewer
#' @importFrom gridExtra "grid.arrange"
#' @importFrom magrittr "%>%"
#' @export

get_trend<-function(input_type){
  # All the possible errors about user inputs
  if (!is.character (input_type)){
    stop (paste0 ("input should be a character"), call. = FALSE)}
  else if(!(input_type %in% anime$type)) {
    stop(paste0("Anime type, ", `input_type`, " ,not found in data"), call. = FALSE)}
  else{
    anime_type<-anime %>%
      filter(type==input_type)

  #visualizing duration of minute
  plot1<-ggplot(data = anime_type, mapping = aes(x= duration_minutes))+
    geom_histogram(binwidth=1, color="darkblue", fill="lightblue")+
    xlim(c(0, 125))+
    labs(x="Duration of the Anime (minutes)", y="Number of Animes")+
    ggtitle("The Distribution of Anime Duration")+
    theme(plot.title=element_text(size=8))

  #distribution of anime score across producers
  anime_top5_producers<-anime_type %>%
    filter(producers == "NHK" | producers == "Aniplex"| producers == "TV Tokyo" | producers == "Lantis" | producers == "Bandai Visual")
  plot2<-ggplot(data = anime_top5_producers, mapping = aes(x = score))+
    geom_boxplot()+
    facet_wrap(~ producers, ncol = 1)+
    labs(x="Anime Score")+
    ggtitle("The Distribution of Anime Score of the Top Five Anime Producers")+
    theme(plot.title=element_text(size=8))

  #average anime score across genre
  anime_genres_all<-anime_type %>%
    mutate(genres = strsplit(as.character(genres), ", |, ")) %>%
    unnest(genres) %>%
    group_by(genres) %>%
    filter(!is.na(score)) %>%
    summarize(mean_score = mean(score)) %>%
    arrange(desc(mean_score))
  plot3<-ggplot(data = anime_genres_all, aes(x = reorder(genres, + mean_score), y = mean_score))+
    geom_bar(stat="identity", color="darkblue", fill="lightblue")+
    ylim(0, 7.2)+
    labs(x="Genre", y="Average Anime Score")+
    ggtitle("Average Anime Score Across Genre") +
    theme_bw() +
    theme(
      axis.text.x = element_text(angle = 90),
      axis.ticks.x = element_blank()
    )+
    theme(plot.title=element_text(size=8))

  grid.arrange(plot1, plot2, plot3, ncol=3)
  }
}
