#' The number of times a team chooses to start batting and fielding
#'
#' @param team_name a team for whom number batting versus fielding statistics have to be calculated
#' @param year a list of seasons (years) for which the statistics of the given team have to be calculated
#'
#' @return `toss_choice` returns a tibble with 2 columns and 1 rows
#'
#' @examples
#' library(ipl)
#'
#' # The number of times Dehli Daredevils chooses to start batting and fielding
#' toss_choice("Delhi Daredevils")
#'
#'
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
toss_choice <- function(team_name){
  '%!in%' <- Negate(`%in%`)
  if (!is.character(team_name)) {
    stop("Invalid input: team name input should be a character vector")
  } else if (team_name %!in% ipl$team1 | team_name %!in% ipl$team2) {
    stop("Invalid team name")
  }
  toss_decision <- ipl %>%
    dplyr::filter(
      toss_winner == team_name
    ) %>%
    summarize(
      bat = sum(toss_decision == "bat"),
      field = sum(toss_decision == "field")
    )
  return(toss_choice)
}
