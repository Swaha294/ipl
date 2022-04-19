#' This function returns the number of wickets taken for the player
#'
#' @param player_name The name of the given player for whom we want to calculate
#' the number of wickets taken
#'
#' @return `num_wickets` number of wickets taken by the given bowler
#'
#' @examples
#'
#' library(ipl)
#'
#' # Returns the number of wickets taken by Rahul Sharma
#' wickets_taken("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'

wickets_taken <- function(player_name) {
  if (!is.character(player_name)) {
    stop(paste0("Invalid input: ", player_name, " must be a character"))
  } else if (!(player_name %in% bowlers$player)) {
    stop("Invalid player name, please input another name")
  } else {
    num_wickets <- bowlers$wkts[bowlers$player == player_name]
    return(num_wickets)
  }
}
