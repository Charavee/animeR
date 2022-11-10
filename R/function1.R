search_anime <- function(title) {
  if (title %in% Anime$Title) {
    return(Anime$Synopsis[Anime$Title == title])
  } else{
    return("ERROR: Please check your input again.")
  }
}
