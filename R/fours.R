#' Find a batsman's total number of fours
#'
#' @param player_name a batsman for whom we want to calculate the number of fours they scored
#'
#' @return `sixes` return number of fours for the given player as a value
#'
#' @examples
#' library(ipl)
#' # Find the total number of fours scored by Suresh Raina
#' fours("Suresh Raina")
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
fours <- function(player_name) {
  if (!is.character(player_name)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!(player_name %in% batsman$player)) {
    stop("Invalid player name")
  }
  fours <- batsman %>%
    select(player, num_4s) %>%
    filter(player == player_name)
  return(fours[1, 2])
}
