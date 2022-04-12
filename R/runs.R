#' Calculates the number of runs for the given bowler
#'
#' @param player_name The bowler whose runs has to be calculated, as a character vector
#'
#' @return `runs` returns the number of runs
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculates the number of runs for Rahul Sharma
#' runs("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
runs <- function(player_name) {
  if (!is.character(player_name)) {
    stop(paste0("Invalid input: ", player_name, " must be a character"))
  }

  if (player_name %in% bowlers$PLAYER) {
    return(bowlers$Runs[bowlers$PLAYER == player_name])
  }
  else {
    stop("Invalid player name, please input another name")
  }
}
