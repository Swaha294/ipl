#' Calculate batting average of batsmen by season
#'
#'
#' @param players a list of batsmen for whom batting average has to be calculated,
#' as character vectors
#' @param years a list of seasons (years) for which the batting average of the
#' given batsmen has to be calculated, as numeric vectors
#'
#' @return `bat_avg` returns a data frame with `nrow` equal to the product of the
#' number of players and years inputted and 5 columns.
#'
#' @examples
#' # Compute batting average of Virat Kohli in 2019
#' bat_avg("V Kohli", 2019)
#'
#' # Compute batting averages of Virat Kohli, MS Dhoni, Rohit Sharma in
#' # 2017, 2018, and 2019
#' bat_avg(c("V Kohli", "MS Dhoni", "RG Sharma"), c(2017, 2018, 2019))
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export

bat_avg <- function(players, years) {

  if (!is.character(players)) {
    stop("Invalid input: player should be a character vector", call. = FALSE)
  }
  if (!is.numeric(years)) {
    stop("Invalid input: year should be a numeric vector", call. = FALSE)
  }
  if (!all(players %in% deliveries$batsman)) {
    stop(paste0(pl, " not found! \n"), call. = FALSE)
  }
  if (!all(years %in% deliveries$year)) {
    stop(paste0(y, " year not found! \n"), call. = FALSE)
  }

  deliveries %>%
    filter(
      batsman %in% players,
      year %in% years
    ) %>%
    group_by(batsman, year) %>%
    summarise(
      player_runs = sum(batsman_runs),
#      player_wickets = length(unique(.$id[.$is_wicket == 1])),
      player_wickets = sum(is_wicket == "1"),
      batting_avg = round(player_runs / player_wickets, 2)
    ) %>%
    ungroup() %>%
    filter(!is.na(batsman)) %>%
    arrange(batsman, year) %>%
    as.data.frame()
}
