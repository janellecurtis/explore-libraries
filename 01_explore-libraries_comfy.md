01\_explore-libraries\_comfy.R
================
jleut
Wed Jan 31 14:05:27 2018

Which libraries does R search for packages?

``` r
# try .libPaths(), .Library

.libPaths()
```

    ## [1] "C:/Users/jleut/OneDrive/Documents/R/win-library/3.4"
    ## [2] "C:/Program Files/R/R-3.4.3/library"

Installed packages

``` r
## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View() or similar to inspect

## how many packages?

packsInstalled <- as.data.frame(installed.packages(), row.names = FALSE)
```

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------------------------------ tidyverse 1.2.1 --

    ## v ggplot2 2.2.1     v purrr   0.2.4
    ## v tibble  1.4.2     v dplyr   0.7.4
    ## v tidyr   0.7.2     v stringr 1.2.0
    ## v readr   1.1.1     v forcats 0.2.0

    ## -- Conflicts --------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
packsInstalled %>%
  count(LibPath, Priority)
```

    ## # A tibble: 5 x 3
    ##   LibPath                                             Priority        n
    ##   <fct>                                               <fct>       <int>
    ## 1 C:/Program Files/R/R-3.4.3/library                  base           14
    ## 2 C:/Program Files/R/R-3.4.3/library                  recommended    15
    ## 3 C:/Program Files/R/R-3.4.3/library                  <NA>            1
    ## 4 C:/Users/jleut/OneDrive/Documents/R/win-library/3.4 recommended     3
    ## 5 C:/Users/jleut/OneDrive/Documents/R/win-library/3.4 <NA>           91

``` r
##   * what proportion need compilation?

packsInstalled %>%
  count(NeedsCompilation) %>%
  mutate(prop = n / sum(n))
```

    ## # A tibble: 3 x 3
    ##   NeedsCompilation     n   prop
    ##   <fct>            <int>  <dbl>
    ## 1 no                  53 0.427 
    ## 2 yes                 65 0.524 
    ## 3 <NA>                 6 0.0484

``` r
##   * how break down re: version of R they were built on

packsInstalled %>%
  count(Built)
```

    ## # A tibble: 3 x 2
    ##   Built     n
    ##   <fct> <int>
    ## 1 3.4.1     8
    ## 2 3.4.2     4
    ## 3 3.4.3   112

``` r
## for tidyverts, here are some useful patterns
# data %>% count(var)
# data %>% count(var1, var2)
# data %>% count(var) %>% mutate(prop = n / sum(n))
```

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
```

``` r
##   * does the number of base + recommended packages make sense to you?
```

``` r
##   * how does the result of .libPaths() relate to the result of .Library?
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
```

``` r
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!

packsInstalledMore <- as.data.frame(installed.packages(fields = "URL"))
```
