globalVariables(c("synopsis", "word", "stop_words"))

#' Generate a Word Cloud
#'
#' @description This function is used to generate a word cloud that shows the most popular words of in all the anime's synopsis.
#'
#' @return A word cloud visualization that present the frequency of each the
#'
#' @examples
#'
#' library(animeR)
#'
#' # Obtain a word cloud that shows the most frequent words appeared in all anime's synopsis.
#' get_trend()
#'
#' @import dplyr
#' @import wordcloud
#' @import tidytext
#' @import RColorBrewer
#' @import gridExtra
#' @importFrom magrittr "%>%"
#' @export

get_trend<-function(){
  # split up the synopsis into individual words and exclude stop words
  text_only<-anime %>%
    select(synopsis) %>%
    tidytext::unnest_tokens(word, synopsis) %>%
    anti_join(stop_words) %>%
    filter(word!="source" & word!="unknown" & word!="rewrite" & word!="written" & word!="mal" & word!="form" & word!="series" & word!="episode")
  #calculate the frequency of each word
  text_only_count <-text_only %>%
    group_by(word) %>%
    summarise(count=n()) %>%
    arrange(desc(count))
  #generate word cloud
  set.seed(1234)
  wordcloud::wordcloud(words = text_only_count$word, freq = text_only_count$count, min.freq = 1,
                       max.words=200, random.order=FALSE, rot.per=0.35,
                       colors=RColorBrewer::brewer.pal(8, "Dark2"))

  #visualizing duration of minute
  plot1<-ggplot(data = anime, mapping = aes(x= duration_minutes))+
    geom_histogram(binwidth=1, color="darkblue", fill="lightblue")+
    xlim(c(0, 125))+
    labs(x="Duration of the Anime (minutes)", y="Number of Animes")+
    ggtitle("The Distribution of Anime Duration")+
    theme(plot.title=element_text(size=8))

  #distribution of anime score across producers
  anime_top5_producers<-anime %>%
    filter(producers == "NHK" | producers == "Aniplex"| producers == "TV Tokyo" | producers == "Lantis" | producers == "Bandai Visual")
  plot2<-ggplot(data = anime_top5_producers, mapping = aes(x = score))+
    geom_boxplot()+
    facet_wrap(~ producers, ncol = 1)+
    labs(x="Anime Score")+
    ggtitle("The Distribution of Anime Score of the Top Five Anime Producers")+
    theme(plot.title=element_text(size=8))

  #average anime score across genre
  anime_genres_all<-anime %>%
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

  grid.arrange(plot0, plot1, plot2, ncol=3)
}
