#'Find a batsman's total number of sixes
#'
#' @param player a batsman for whom we want to calculate the number of sixes they scored
#'
#' @return `sixes` return number of sixes for the given player as a value
#'
#' @examples
#' Compute the total number of sixes scored by Rohit Sharma
#' sixes("Rohit Sharma")
#'
#' library(ipl)
#'
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
sixes <- function(player_name){
  batsman$PLAYER <- trimws(gsub("[^[:alnum:]]", " ", batsman$PLAYER))
  '%!in%'<-Negate(`%in%`)
  if(player_name %!in% batsman$PLAYER){
    stop("Invalid player name")
  }
  sixes<-batsman%>%
    select(PLAYER,`6s`)%>%
    dplyr::filter(PLAYER==player_name)
  return(sixes[1,2])
}
