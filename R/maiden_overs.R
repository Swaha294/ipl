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
#' maiden_overs("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
maiden_overs <- function(player_name) {

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
