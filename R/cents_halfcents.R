#' Calculate the number of centuries and half-centuries made a batsman in a given
#' season
#'
#'
#' @param player The batsman for whom the number of centuries and half-centuries
#' have to be calculated, as a character vectors
#'
#' @param yr The season (year) for which the number of centuries and
#' half-centuries for the given batsman have to be calculated, as a numeric vector
#'
#' @return `cents_halfcents` returns a tibble with one row and three columns.
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculate the number of centuries and half-centuries made by Virat Kohli
#' # in the 2016 IPL season
#'
#' cents_halfcents("V Kohli", 2016)
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export

cents_halfcents <- function(player, yr) {
  if (!is.character(player)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!is.numeric(yr)) {
    stop("Invalid input: year input should be a numeric vector")
  } else if (!(player %in% deliveries$batsman)) {
    stop(paste0(`player`, "not found!"))
  } else if (!(yr %in% deliveries$year)) {
    stop(paste0(`yr`, "Year not found"))
  } else {
    deliveries %>%
      filter(
        batsman %in% player,
        year %in% yr
      ) %>%
      group_by(id, batsman) %>%
      distinct() %>%
      summarise(
        player_runs = sum(batsman_runs),
        cents = player_runs %/% 100,
        half_cents = (player_runs - (cents * 100)) %/% 50
      ) %>%
      ungroup() %>%
      group_by(batsman) %>%
      summarise(
        centuries = sum(cents),
        half_centuries = sum(half_cents)
      )
  }
}
