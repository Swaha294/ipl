
<!-- README.md is generated from README.Rmd. Please edit that file -->

## ipl

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ipl)](https://CRAN.R-project.org/package=ipl)
<!-- badges: end -->

The goal of `ipl` is to provide data and functions related to IPL
matches and standard cricket statistics. This package allows users to
avail of IPL data and conduct analysis of cricketers using functions of
this package, which return data on the strike rate, batting average, and
other commonly used cricket statistics.

## Description

The `ipl` R package consists of datasets on all IPL matches played in
the years 2008-2020, and provides functions to calculate typical
crickets statistics.

## Installation

You can install the development version of ipl like so:

``` r
remotes::install_github("Swaha294/ipl")
#> Skipping install of 'ipl' from a github remote, the SHA1 (cbc19f5f) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Example

This is a basic example which shows you how to solve a common problem:

Load `ipl` R package

``` r
library(ipl)
```

1.  Calculate Virat Kohli’s batting average in the 2016 season

``` r
bat_avg("V Kohli", 2016)
#>   batsman year player_runs player_wickets batting_avg
#> 1 V Kohli 2016         973             12       81.08
```

2.  Calculate the maximum runs made by Virat Kohli in a match in the
    2016 IPL season

``` r
bat_max("V Kohli", 2016)
#> # A tibble: 1 × 2
#>   batsman max_runs
#>   <chr>      <dbl>
#> 1 V Kohli      113
```

3.  Calculate the number of centuries and half-centuries made by Virat
    Kohli in the 2016 IPL season

``` r
cents_halfcents("V Kohli", 2016)
#> # A tibble: 1 × 3
#>   batsman centuries half_centuries
#>   <chr>       <dbl>          <dbl>
#> 1 V Kohli         4              7
```

4.  Calculate Virat Kohli’s strike rate in the 2016 IPL season

``` r
strike_rate("V Kohli", 2016)
#> # A tibble: 1 × 2
#>   batsman strike_rate
#>   <chr>         <dbl>
#> 1 V Kohli        152.
```

5.  Calculates the number of times a team chooses to start batting and
    fielding

``` r
toss_choice("Delhi Daredevils")
#> # A tibble: 2 × 2
#>   toss_decision   num
#>   <fct>         <int>
#> 1 bat              29
#> 2 field            51
```

6.  Find the list of bowlers with bowling average above 40

``` r
bowler_score(40)
#> [1] "Murali Kartik" "Tim Southee"   "Suresh Raina"  "Brett Lee"
```

7.  Calculate Rahul Sharma’s overs

``` r
overs("Rahul Sharma")
#> [1] 154.4
```

8.  Find Rohit Sharma’s total number of sixes

``` r
sixes("Rohit Sharma")
#> # A tibble: 1 × 1
#>   num_6s
#>    <dbl>
#> 1    194
```

9.  Find Suresh Raina’s total number of fours

``` r
fours("Suresh Raina")
#> # A tibble: 1 × 1
#>   num_4s
#>    <dbl>
#> 1    493
```
