#' Calculates the completed overs and remaining (legal) balls bowled by
#' the given bowler across all IPL matches from 2008-2020.
#'
#' @param player_name The bowler whose completed overs and remaining balls has to
#' be calculated, as a character vector
#'
#' @return `overs_balls` returns the number of completed overs and remaining balls
#' bowled by the given player across all IPL matches from 2008-2020
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculates the completed runs and remaining (legal) balls bowled by Rahul Sharma
#' overs_balls("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'
overs_balls <- function(player_name) {
  if (!(is.character(player_name))) {
    stop(paste0("Invalid input: ", player_name, " should be a character vector"), call. = FALSE)
  } else if (!(player_name %in% bowlers_100$player)) {
    stop("Invalid player name, please input another name", call. = FALSE)
  } else {
    overs <- bowlers_100$ov[bowlers_100$player == player_name]
    overs <- as.character(overs)
    split_overs <- unlist(strsplit(overs, "\\."))
    player <- player_name
    completed_overs <- as.numeric(split_overs[1])
    balls <- as.numeric(split_overs[2])
    output_df <- data.frame(player, completed_overs, balls)
    return(output_df)
  }
}
