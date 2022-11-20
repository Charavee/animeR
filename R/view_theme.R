globalVariables("synopsis")

#' animeR
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
#' view_theme()
#'
#' @import dplyr
#' @import wordcloud
#' @import tidytext
#' @importFrom magrittr "%>%"
#' @export

view_theme<-function(){
  # initializing the common stop words data from tidytext
  data(stop_words)
  # split up the synopsis into individual words and exclude stop words
  text_only<-anime %>%
    select(synopsis) %>%
    unnest_tokens(word, synopsis) %>%
    anti_join(stop_words)
  #calculate the frequency of each word
  text_only_count <-text_only %>%
    group_by(word) %>%
    summarise(count=n()) %>%
    arrange(desc(count))
  #generate word cloud
  set.seed(1234)
  wordcloud(words = text_only_count$word, freq = text_only_count$count, min.freq = 1,
            max.words=200, random.order=FALSE, rot.per=0.35,
            colors=brewer.pal(8, "Dark2"))
}
