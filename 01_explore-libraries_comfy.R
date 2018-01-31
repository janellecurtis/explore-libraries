#' Which libraries does R search for packages?

# try .libPaths(), .Library

.libPaths()


#' Installed packages

## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View() or similar to inspect

## how many packages?

packsInstalled <- as.data.frame(installed.packages(), row.names = FALSE)


#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both

packsInstalled %>%
  count(LibPath, Priority)

##   * what proportion need compilation?

packsInstalled %>%
  count(NeedsCompilation) %>%
  mutate(prop = n / sum(n))

##   * how break down re: version of R they were built on

packsInstalled %>%
  count(Built)

## for tidyverts, here are some useful patterns
# data %>% count(var)
# data %>% count(var1, var2)
# data %>% count(var) %>% mutate(prop = n / sum(n))

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration

######-Use count(variable) instead of group_by and summarise n() to get counts by variables

##   * does the number of base + recommended packages make sense to you?

#####-Yes, based on what Jenny mentioned in class

##   * how does the result of .libPaths() relate to the result of .Library?

#####-.libPaths() has a second directory where it stores all the packages I download


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?

#####-All but the translations package (what's this?)

## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!

packsInstalledMore <- as.data.frame(installed.packages(fields = "URL"))
