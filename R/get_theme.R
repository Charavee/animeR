globalVariables(c("synopsis", "word", "type", "stop_words", "input_type"))

#' Generate a Word Cloud of the Most Common Themes in the Synopsis
#'
#' @description This function is used to generate a word cloud that shows the most popular words of in all the anime's synopsis.
#'
#' @return A word cloud visualization that present the frequency of each the
#'
#' @examples
#'
#' library(animeR)
#'
#' # # Obtain visualizations about current themes in anime movies
#' get_theme("Movie")
#'
#' @import dplyr
#' @import wordcloud
#' @import tidytext
#' @import RColorBrewer
#' @importFrom magrittr "%>%"
#' @export


get_theme<-function(input_type){
  # All the possible errors about user inputs
  if (!is.character (input_type)){
    stop (paste0 ("input should be a character"), call. = FALSE)}
  else if(!(input_type %in% anime$type)) {
    stop(paste0("Anime type, ", `input_type`, " , not found in data"), call. = FALSE)}
  else{
    #selecting for user input
    anime_theme<-anime %>%
      filter(type==input_type)
    #split up the synopsis into individual words and exclude stop words
    text_only<-anime_theme %>%
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
  }

}

