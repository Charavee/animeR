search_anime <- function(title) {
  if (title %in% Anime$Title) {
    return(Anime$Synopsis[Anime$Title == title])
  } else{
    return("ERROR: Please check your input again.")
  }
}

search_anime <- function(title_short) {
  title_syn <- tryCatch(
    expr = {
     user_animedf <- anime %>%
        filter(str_detect(anime$Title, title_short)) %>%
        select(Title, Synopsis)
    },
    error = function(cond) {
      message(paste("Title does not seem to exist:", title_short))
      return(NA)
    }
  )
  return(title_syn)
}





