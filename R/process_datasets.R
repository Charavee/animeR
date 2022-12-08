#' Anime data set
#'
#' @format A data frame with 21460 rows and 28 columns
#'
#' \describe{
#' \item{id}{ID anime at MyAnimeList.net}
#' \item{title}{The original name of the anime}
#' \item{synonyms}{The synonym name of the anime}
#' \item{synopsis}{The overview of the anime}
#' \item{japanese}{The title of the anime in Japanese}
#' \item{type}{Anime type: TV show, movie, etc.}
#' \item{episodes}{Number of episodes in anime}
#' \item{status}{The status of whether the anime has not, is currently, or has been aired}
#' \item{start_aired}{The date or year when the anime started airing}
#' \item{end_aired}{The date or year when the anime ended airing}
#' \item{premiered}{Season premiered}
#' \item{broadcast}{Anime broadcast schedule}
#' \item{producers}{List of producers}
#' \item{licensors}{List of licensors}
#' \item{studios}{List of studios}
#' \item{source}{The source the anime is based on like manga, original, novel etc.}
#' \item{genres}{The genres of the anime like comedy, horror etc. }
#' \item{themes}{The topics the anime is based on like detective, vampire etc.}
#' \item{demographics}{List of demographics}
#' \item{duration_minutes}{Total duration per minute on each episode}
#' \item{rating}{Age rate}
#' \item{score}{Average score of the anime given from users in MyAnimeList.net}
#' \item{scored_users}{Number of users giving scores to the anime}
#' \item{ranked}{Ranking based on the score}
#' \item{popularity}{Ranking based on the popularity in which users have added the anime to their list}
#' \item{members}{Number of users who have added the anime to their list}
#' \item{favorites}{Number of users who have marked the anime as their favorite anime}
#' \item{english}{The title of the anime in English}
#' }
#' @source <https://www.kaggle.com/datasets/harits/anime-database-2022>
"anime"

#' stop_words data set
#'
#' @format A data frame with 21460 rows and 27 columns
#'
#' \describe{
#' \item{word}{Common stopwords used in writing}
#' \item{lexicon}{common stopwords}
#' }
#' @source <https://rdrr.io/cran/tidytext/man/stop_words.html>
"stop_words"
