#' Find a batsman's total number of sixes
#'
#' @param player_name a batsman for whom we want to calculate the number of sixes they scored
#'
#' @return `sixes` return number of sixes for the given player as a value
#'
#' @examples
#' library(ipl)
#'
#' # Find the total number of sixes scored by Rohit Sharma in the 2017 IPL season
#' sixes("RG Sharma", 2017)
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
sixes <- function(player_name, yr) {
  if (!is.character(player_name)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!(player_name %in% deliveries$batsman)) {
    stop("Invalid player name")
  }
  sixes <- deliveries %>%
    filter(
      batsman == player_name,
      year == yr,
      batsman_runs == 6
    ) %>%
    group_by(batsman, year) %>%
    summarise(
      num_6s = n()
    )
  return(sixes)
}
