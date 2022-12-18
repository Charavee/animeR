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
