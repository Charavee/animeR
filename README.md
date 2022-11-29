
<!-- README.md is generated from README.Rmd. Please edit that file -->

# animeR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/animeR)](https://CRAN.R-project.org/package=animeR)
<!-- badges: end -->

## Purpose

The goal of animeR is to help anime directors and anime lovers to
understand the current trend in the anime industry. The package builds
on the dataset Anime.csv which includes information about over 20,000
different animes, such as their name, time aired, producers, genres,
synopsis, score, popularity, and more. Our goal for this package is to
provide tools for anime lovers and directors to easily filter for their
desired criteria, understand recurring themes, and predict the
popularity of a anime.

## Target Audience

Our target audience would be people interested in anime or newly
exploring anime who may be looking for detailed anime information and/or
recommendations, and creative professionals, such as directors and
people who works in anime or media industry, who want to understand the
trends in their industry.

## Installation

You can install the development version of animeR like so:

``` r
devtools::install_github("cbasnetchettri/animeR")
library(animeR)
```

## Example

This is a basic example for `search_anime()`:

``` r
library(animeR)

# Search all the anime that has "Naruto" in their title. Please make sure to have a character as an input.
search_anime("Naruto")
#> Here is the list of anime.
#> # A tibble: 27 × 2
#>    title                                                               synopsis 
#>    <chr>                                                               <chr>    
#>  1 Naruto                                                              "Moments…
#>  2 Naruto: Shippuuden                                                  "It has …
#>  3 Boruto: Naruto Next Generations                                     "Followi…
#>  4 The Last: Naruto the Movie                                          "Two yea…
#>  5 Boruto: Naruto the Movie                                            "The spi…
#>  6 Naruto: Shippuuden Movie 6 - Road to Ninja                          "Returni…
#>  7 Naruto: Shippuuden Movie 1                                          "A group…
#>  8 Naruto Movie 1: Dai Katsugeki!! Yuki Hime Shinobu Houjou Dattebayo! "Naruto …
#>  9 Naruto: Shippuuden Movie 2 - Kizuna                                 "Unleash…
#> 10 Naruto: Shippuuden Movie 4 - The Lost Tower                         "Led by …
#> # … with 17 more rows
```

## Project Proposal

We will be creating the followng functions for this project. Two
functions are mainly targeting anime lovers, one helping them to search
information about specific anime and another one helping them to get
anime recommendation according to their preference. The rest of the
functions help anime producers to understand the the general info of the
anime industry, under stand the current trend reflected by the synopsis,
and use a model to predict the popularity of a specific anime.

1)  `search_anime(...)`: This function serves as a tool to obtain an
    overview of filtering tool for anime lovers to locate the list of
    anime of their interest.

2)  `anime_rec(x, y)`: The function outputs a list of five anime with
    their synopsis based on popularity rating.

3)  `get_trend()`: This function takes in genre x and year y and output
    a wordcloud that shows the most recurring themes and words in the
    anime’s synopsis.

4)  `info( )`: This function returns the top five anime of all time
    based on popularity, the visualization of anime popularity by genre,
    and number of anime by top producers using a bar chart.

5)  `predict_popularity( )`: this function fits a multiple regression
    model predicting the popularity rating of an anime based on
    categorical variables like the Source of the anime. Also, this
    function conducts model analysis to help anime directors and
    investors to predict the popularity of a potential anime.

## Group Members

- Charavee Basnet Chettri
- Michiru Nozawa
- Lily Diao
