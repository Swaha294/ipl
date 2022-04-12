#' This function returns the number of wickets taken for the player
#'
#' @param player_name The name of the given player for whom we want to calculate the numner of wickets taken
#'
#' @return `num_wickets` number of wickets taken
#'
#' @examples
#'
#' library(ipl)
#'
#' Returns the number of wickets taken for Rahul Sharma
#' wickets_taken("Rahul Sharma)
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'

wickets_taken <- function(player_name) {
  if (player_name %in% bowlers$PLAYER) {
    num_wickets = bowlers$Wkts[bowlers$PLAYER == player_name]
    return(num_wickets)
  }
  else {
    stop("Invalid player name, please input another name")
  }
}
