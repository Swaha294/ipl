
<!-- README.md is generated from README.Rmd. Please edit that file -->

## ipl <img src="data-raw/sticker/hex_ipl.png" align="right" height=140/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ipl)](https://CRAN.R-project.org/package=ipl)
[![R-CMD-check](https://github.com/Swaha294/ipl2/workflows/R-CMD-check/badge.svg)](https://github.com/Swaha294/ipl2/actions)
<!-- badges: end -->

The goal of `ipl` is to provide data and functions related to the Indian
Premier Leage (IPL) matches and standard cricket statistics. This
package allows users to avail of IPL data and conduct analysis of
cricketers and IPL teams using functions of this package.

This is package is important because there isn’t a consolidated database
where one can find all the data to analyse past IPL matches and players.
These functions will also aid in conducting data analysis for those who
are interested in analysing IPL trends.

## Description

The `ipl` R package consists of datasets on all IPL matches played in
the years 2008-2020, and provides functions to calculate typical
crickets statistics.

Our package includes datasets on IPL matches played and cricketers in
the years 2008-2020, acquired primarily from
[Kaggle](https://www.kaggle.com/), which have been cleaned so users can
use it directly for data analysis. Moreover, it comprises functions for
analysis of individual cricketers and games, as well as summary
statistics for the same.

## Installation

You can install the development version of `ipl` like so:

``` r
remotes::install_github("Swaha294/ipl")
#> Skipping install of 'ipl' from a github remote, the SHA1 (4acf56a3) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Datasets Included

-   `deliveries`: Ball-by-ball data of IPL matches played in 2008-2020
-   `teams`: Winning team, overs bowled, runs made and wickets fallen
    for each match played by each IPL team in 2008-2020
-   `ipl`: More information on matches from 2008 to 2020
-   `batsman_100`: Information of top 100 batsmen of IPL
-   `bowlers_100`: Informayion of top 100 bowlers of IPL

## Functions Included

The following functions allow for individual analyses of cricketers and
IPL matches, as well as for combined statistical analysis of the same.

-   `bat_avg` \~ 134,112 B
-   `bat_max` \~ 113,136 B
-   `batsman_summary` \~ 130,616 B
-   `bowler_score` \~ 81,216 B
-   `bowler_summary` \~ 90,000 B
-   `cents_halfcents` \~ 120,688 B
-   `fours` \~ 87,072 B
-   `overs_balls` \~ 90,600 B
-   `overs` \~ 77,240 B
-   `partnership_runs` \~ 93,000 B
-   `runs` \~ 76,984 B
-   `sixes` \~ 87,072
-   `strike_rate` \~ 118,520 B
-   `toss_choice` \~ 87,016 B
-   `wickets_taken` \~ 77,888 B
-   `winloss` \~ 120,768 B

## Basic Usage

These are a few examples of how to use the package to compute different
statistics for cricketers and IPL matches

Load `ipl` R package

``` r
library(ipl)
```

1.  Visualize the number of runs made by Mumbai Indians in their match
    against Delhi Capitals on 2019-03-24, by partnerships

``` r
partnership_runs(1175358, "Mumbai Indians")
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

2.  Get the summary table of all batting statistics for MS Dhoni for all
    IPL matches he played between 2008 and 2020

``` r
batsman_summary("MS Dhoni")
#>    year player_runs player_wickets batting_avg max_runs strike_rate centuries
#> 1  2020         200              8       25.00       47      116.28         0
#> 2  2019         416              5       83.20       84      134.63         0
#> 3  2018         455              7       65.00       79      150.66         0
#> 4  2017         290             13       22.31       61      116.00         0
#> 5  2016         284              8       35.50       64      135.24         0
#> 6  2015         372             14       26.57       53      121.97         0
#> 7  2014         371              5       74.20       57      148.40         0
#> 8  2013         461             11       41.91       67      162.90         0
#> 9  2012         358             11       32.55       51      128.78         0
#> 10 2011         392             10       39.20       70      158.70         0
#> 11 2010         287              9       31.89       66      136.67         0
#> 12 2009         332              8       41.50       58      127.20         0
#> 13 2008         414             10       41.40       65      133.55         0
#>    half_centuries num_4s num_6s
#> 1               0     16      7
#> 2               3     22     23
#> 3               3     24     30
#> 4               1     15     16
#> 5               1     18     14
#> 6               1     27     17
#> 7               1     22     20
#> 8               4     32     25
#> 9               1     26      9
#> 10              2     25     23
#> 11              2     26      8
#> 12              2     22      9
#> 13              2     38     15
```

3.  Get the summary table of wins and losses for Sunrisers Hyderabad in
    2017

``` r
winloss("Sunrisers Hyderabad", 2017)
#>   toss_decision wins losses      wpct
#> 1           bat    2      0 1.0000000
#> 2         field    6      6 0.5000000
#> 3         total    8      6 0.5714286
```

4.  Get the bowling analysis for Rahul Sharma

``` r
bowling_analysis("Rahul Sharma")
#>         bowler overs runs wickets_taken
#> 1 Rahul Sharma 154.4 1086            40
```

More examples can be found in the vignette.

## Contributors

-   [Swaha Bhattacharya](https://github.com/Swaha294)
-   [Anushree Goswami](https://github.com/agoswa)
-   [Haley Schmidt](https://github.com/heschmidt)
