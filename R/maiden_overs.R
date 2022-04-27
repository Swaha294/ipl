#' Returns the maiden overs for the given bowler
#'
#' @param player_name The bowler whose maiden overs has to be calculated, as a
#' character vector
#'
#' @return `maidenOvers` returns the maiden overs
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculates the maiden overs for Rahul Sharma
#' maiden_overs("R Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
maiden_overs <- function(player_name) {

  if (!is.character(player_name)) {
    stop(paste0("Invalid input: ", player_name, " must be a character"))
  }

  if (!(player_name %in% bowlers_100$player)) {
    stop("Invalid player name, please input another name. Make sure the player `Rahul Sharma ` is denoted as `R Sharma`.")
  }

  maiden_overs_df <- deliveries %>%
    select(id, ball, batsman, bowler, batsman_runs) %>%
    filter(batsman_runs == 0, bowler == player_name)

  ballcount = 1
  maiden_over = 0

  for (ballnum in maiden_overs_df$ball) {
    if (ballcount == ballnum) {
      ballcount = ballcount+1

      if (ballcount == 6) {
        maiden_over = maiden_over+1
      }
    }
    else {
      ballcount = 1
    }
  }
  return(maiden_over)
}
