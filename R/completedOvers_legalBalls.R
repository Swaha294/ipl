#' Calculates the completed overs and legal balls for the given bowler
#'
#' @param player_name The bowler whose completed overs and legal balls has to
#' be calculated, as a character vector
#'
#' @return `combined_output` returns the completed overs and legal balls
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculates the completed runs and legal balls for Rahul Sharma
#' completedOvers_legalBalls("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
completedOvers_legalBalls <- function(player_name) {
  if (player_name %in% bowlers$PLAYER) {
    overs = bowlers$Ov[bowlers$PLAYER == player_name]
    overs = as.character(overs)
    split_overs = unlist(strsplit(overs, "\\."))
    Completed_Overs <- split_overs[1]
    Legal_Balls <- split_overs[2]
    output_df <- data.frame(Completed_Overs, Legal_Balls)
    return(output_df)
  }
  else{
    stop("Invalid player name, please input another name")
  }
}
