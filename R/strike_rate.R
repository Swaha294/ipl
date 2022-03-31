#' Calculate strike rate of a given batsman in a given season
#'
#' @param player The batsman whose strike rate has to be calculated, as a character vector
#' @param yr The year for which the strike rate of the given batsman has to be calculated,
#' as a numeric vector
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculate the strike rate of MS Dhoni in the 2016 IPL season
#' strike_rate("MS Dhoni", 2016)
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
strike_rate <- function(player, yr) {
  if (!is.character(player)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!is.numeric(yr)) {
    stop("Invalid input: year input should be a numeric vector")
  } else if (!(player %in% deliveries$batsman)) {
    stop(paste0(`player`, "not found!"))
  } else if (!(yr %in% deliveries$year)) {
    stop(paste0(`yr`, "Year not found"))
  } else {
    balls_faced <- function(player, yr) {
      deliveries %>%
        filter(
          batsman %in% player,
          year %in% yr,
          extras_type != "wides" | is.na(extras_type)
        ) %>%
        nrow()
    }

    deliveries %>%
      filter(
        batsman == player,
        year == yr
      ) %>%
      group_by(batsman) %>%
      summarise(
        strike_rate = round(100 * sum(batsman_runs) / balls_faced(player, yr), 2)
      )
  }
}
