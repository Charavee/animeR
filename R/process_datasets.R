#' Anime data set
#'
#' @format A data frame with 21460 rows and 28 columns
#'
#' \describe{
#' \item{id}{Unique number identifier for each anime in data set}
#' \item{title}{Full name of the anime}
#' \item{synonyms}{Alternate name of the anime}
#' \item{synopsis}{A summary of the anime's story line}
#' \item{japanese}{Name of the anime in Japanese}
#' \item{type}{The type of anime: TV show, movie, etc.}
#' \item{episodes}{The number of episodes of the anime}
#' \item{status}{Status of the anime if airing ended, is currently airing or is yet to air}
#' \item{start_aired}{The date when the anime began airing}
#' \item{end_aired}{The date when the anime stopped airing}
#' \item{premiered}{The season and year when the anime released}
#' \item{broadcast}{The weekly day and time in JST the anime would be broadcasted}
#' \item{producers}{Names of producers of the anime}
#' \item{licensors}{Names of licensors of the anime}
#' \item{studios}{Name of the studios where anime would be created}
#' \item{source}{The source the anime is based on like manga, original, novel etc.}
#' \item{genres}{The genres of the anime like comedy, horror etc. }
#' \item{themes}{The topics the anime is based on like detective, vampire etc.}
#' \item{demographics}{The audience who watches the anime}
#' \item{duration_minutes}{The length of each episode of the anime in minutes}
#' \item{rating}{The intended age group/audience for the anime}
#' \item{score}{The rating/score the anime received out of 10}
#' \item{scored_users}{abcd}
#' \item{ranked}{abcd}
#' \item{popularity}{abcd}
#' \item{members}{abcd}
#' \item{favorites}{abcd}
#' \item{english}{Name of the anime in English}
#' }
#' @source <https://www.kaggle.com/datasets/CooperUnion/anime-recommendations-database>
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
