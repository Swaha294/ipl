
<!-- README.md is generated from README.Rmd. Please edit that file -->

## ipl

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ipl)](https://CRAN.R-project.org/package=ipl)
<!-- badges: end -->

The goal of ipl is to …

## Description

The `ipl` R package consists of datasets on all IPL matches played in
the years 2008-2020, and provides functions to calculate typical
crickets statistics.

## Installation

You can install the development version of ipl like so:

``` r
remotes::install_github("Swaha294/ipl")
#> Downloading GitHub repo Swaha294/ipl@HEAD
#> vctrs    (0.3.8 -> 0.4.0) [CRAN]
#> magrittr (2.0.2 -> 2.0.3) [CRAN]
#> Installing 2 packages: vctrs, magrittr
#> 
#>   There are binary versions available but the source versions are later:
#>          binary source needs_compilation
#> vctrs     0.3.8  0.4.0              TRUE
#> magrittr  2.0.2  2.0.3              TRUE
#> installing the source packages 'vctrs', 'magrittr'
#> * checking for file ‘/private/var/folders/0p/hkwpsbqj047d4nq34kz3_wdr0000gn/T/Rtmpnkk3Fx/remotes4c553827b24f/Swaha294-ipl-de1ae2f/DESCRIPTION’ ... OK
#> * preparing ‘ipl’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘ipl_0.0.0.9000.tar.gz’
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
