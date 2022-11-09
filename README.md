
<!-- README.md is generated from README.Rmd. Please edit that file -->

# animeR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/animeR)](https://CRAN.R-project.org/package=animeR)
<!-- badges: end -->

## Purpose

The goal of animeR is to help anime directors and anime lovers to understand the current trend in the anime industry. The package builds on the dataset Anime.csv which includes information about over 20,000 different animes regarding their name, time aired, producers, genres, synopsis, score, popularity, etc. Our goal for this package is to provide tools for anime lovers and directors to easily filter for their desired criteria, understand recurring themes, and predict the popularity of a anime.

## Target Audience

Our target audience would be people interested in anime trying to look for suggestions on what anime should they watch or directors who want to understand the trend of the anime industry.

## Project Proposal

1) find_anime(...): This function serve as an filtering tool for anime lovers to locate the list of anime of their interest. 

2) anime_rec(x, y):  The function takes in genre x and year y and output a list of five anime with their synopsis based on popularity rating.

3) get_trend(x, y): This function takes in genre x and year y and output a wordcloud that shows the most recurring themes and words in the anime’s synopsis. 

4) info( ): This function returns the top five anime of all time based on popularity, the visualization of anime popularity by genre, and number of anime by top producers using a bar chart. 

5) predict_popularity( ): this function produces a multiple regression model predicting the popularity rating of an anime as well as model analysis to help anime directors and investors to predict the popularity of a potential anime. 


## Installation

You can install the development version of animeR like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Group Members

-   Charavee Basnet Chettri
-   Michiru Nozawa

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(animeR)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
