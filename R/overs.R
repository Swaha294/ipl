#' Calculates the number of overs for the given bowler
#'
#' @param player The bowler whose overs has to be calculated, as a character vector
#'
#' @return `overs` returns the number of overs
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculates the number of overs for Rahul Sharma
#' overs("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
overs <- function(player) {
  if (player %in% bowlers$player) {
    return(bowlers$ov[bowlers$player == player])
  } else {
    stop("Invalid player name, please input another name")
  }
}
