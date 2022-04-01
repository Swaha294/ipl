#' Find a batsman's total number of fours
#'
#' @param player a batsman for whom we want to calculate the number of fours they scored
#'
#' @return `sixes` return number of fours for the given player as a value
#'
#' @examples
#' library(ipl)
#' # Find the total number of fours scored by Suresh Raina
#' fours("Suresh Raina")
#'
#'
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
fours <- function(player){
  batsman$PLAYER <- trimws(gsub("[^[:alnum:]]", " ", batsman$PLAYER))
  '%!in%' <- Negate(`%in%`)
  if (!is.character(player)) {
    stop("Invalid input: player input should be a character vector")
  } else if (player %!in% batsman$PLAYER) {
    stop("Invalid player name")
  }
  fours <- batsman %>%
    select(PLAYER, `4s`)%>%
    dplyr::filter(PLAYER == player)
  return(fours[1, 2])
}

