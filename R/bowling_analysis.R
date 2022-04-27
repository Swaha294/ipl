#' Returns the summary analysis for the given bowler
#'
#' @param player_name The bowler whose summary analysis has to be calculated, as a
#' character vector
#'
#' @return `bowling_analysis` returns the summary analysis of a bowler in a dataframe
#'
#' @examples
#'
#' library(ipl)
#'
#' # Summarises the bowling analysis for Rahul Sharma
#' bowling_analysis("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @importFrom stringr word
#'
#' @export
#'
bowling_analysis <- function(player_name) {
  if (!is.character(player_name)) {
    stop(paste0("Invalid input: ", player_name, " must be a character"))
  }

  if (!(player_name %in% bowlers_100$player)) {
    stop("Invalid player name, please input another name")
  }

  #maiden overs naming
  firstname_letter <- substr(word(player_name, 1), 1, 1)
  surname <- word(player_name, 2)
  player_name_MO <- paste(firstname_letter, surname)

  overs = ipl::overs(player_name)
  maiden_overs = ipl::maiden_overs(player_name_MO)
  runs = ipl::runs(player_name)
  wickets_taken = ipl::wickets_taken(player_name)
  bowler = player_name

  output_df <- data.frame(bowler, overs, maiden_overs, runs, wickets_taken)
  return(output_df)
}
