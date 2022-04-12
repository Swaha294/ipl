#' Calculates the number of overs for the given bowler
#'
#' @param player_name The bowler whose overs has to be calculated, as a character vector
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
overs <- function(player_name) {
  if (!is.character(player_name)) {
    stop(paste0("Invalid input: ", player_name, " must be a numeric character"))
  }

  if (player_name %in% bowlers$player) {
    return(bowlers$ov[bowlers$player == player_name])
  } else {
    stop("Invalid player name, please input another name")
  }
}
