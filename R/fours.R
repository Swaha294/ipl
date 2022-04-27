#' Find a batsman's total number of fours
#'
#' @param player_name A batsman for whom we want to calculate the number of fours
#' they scored
#' @param yr The year for which the number of fours for the given batsman is to be
#' calculated
#'
#' @return `fours` return number of fours for the given player as a value
#'
#' @examples
#' library(ipl)
#' # Find the total number of fours scored by Suresh Raina in the 2014 IPL season
#' fours("SK Raina", 2014)
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
fours <- function(player_name, yr) {
  if (!is.character(player_name)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!(player_name %in% deliveries$batsman)) {
    stop("Invalid player name")
  }
  fours <- deliveries %>%
    filter(
      batsman == player_name,
      year == yr,
      batsman_runs == 4
      ) %>%
    group_by(batsman, year) %>%
    summarise(
      num_4s = n()
    )
  return(fours)
}
