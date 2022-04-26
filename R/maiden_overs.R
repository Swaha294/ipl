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
bowling_analysis <- function(player_name) {
  overs = overs(player_name)

  #maiden overs naming
  firstname_letter = substr(word(player_name, 1), 1, 1)
  surname = word(player_name, 2)
  player_name_MO = paste(firstname_letter, surname)
  maiden_overs = maiden_overs(player_name_MO)

  runs = runs(player_name)
  wickets_taken = wickets_taken(player_name)
  bowlingAnalysis = paste(overs, "-", maiden_overs, "-",runs, "-", wickets_taken)

  Player <- player_name
  Overs <- overs
  Maiden_Overs <- maiden_overs
  Runs <- runs
  Wickets_Taken <- wickets_taken
  Bowling_Analysis <- bowlingAnalysis

  output_df <- data.frame(Player, Overs, Maiden_Overs, Runs, Wickets_Taken, Bowling_Analysis)
  return(output_df)
}

