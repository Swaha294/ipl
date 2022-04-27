#' Get a summary table of a team's wins and losses for a given year
#'
#' @param team_name A team for whom we want to calculate the number of wins and losses
#' @param yr The year for which the number of wins and losses for the given team is to be
#' calculated
#'
#' @return `winloss` return number of wins, losses, and win percentage at each starting position
#' for the given team on the given year, as a data frame
#'
#' @examples
#' library(ipl)
#'
#' # Find the total number of wins and losses for Sunrisers Hyderabad in the 2017 IPL season
#' winloss("Delhi Daredevils", 2017)
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
winloss <- function(team_name, yr) {
  '%!in%' <- Negate(`%in%`)
  if (!is.character(team_name)) {
    stop("Invalid input: team name input should be a character vector")
  } else if (!is.numeric(yr)) {
    stop("Invalid input: year input should be a numeric vector")
  } else if (yr > 2020 | yr < 2008) {
    stop("Invalid year")
  } else if (team_name %!in% ipl$team1 | team_name %!in% ipl$team2) {
    stop("Invalid team name")
  }
  start <- ipl %>%
    dplyr::filter(
      year == yr,
      team1 == team_name | team2 == team_name
    ) %>%
    group_by(toss_decision) %>%
    summarize(
      wins = sum(winner == team_name),
      losses = sum(winner != team_name),
      wpct = wins / (wins + losses),
      .groups = 'drop'
    )
  total <- ipl %>%
    dplyr::filter(
      year == yr,
      team1 == team_name | team2 == team_name
    ) %>%
    summarize(
      toss_decision = "total",
      wins = sum(winner == team_name),
      losses = sum(winner != team_name),
      wpct = wins / (wins + losses),
      .groups = 'drop'
    )
  start.df <- data.frame(start)
  total.df <- data.frame(total)
  df <- rbind(start.df, total.df)
  return(df)
}
