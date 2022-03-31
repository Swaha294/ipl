#' Calculates the wins, losses, and win percentage for a team based on their starting position (batting or fielding)
#'
#' @param team_name a team for whom number of wins, losses, and win percentage has to be calculated
#' @param year a list of seasons (years) for which number of wins, losses, and win percentage of the
#' given team has to be calculated
#'
#' @return `winloss` returns a tibble with 3 columns and 3 rows
#'
#' @examples
#' Calculates the wins, losses, and win percentage for Sunrisers Hyderabad in 2017
#' winloss("Sunrisers Hyderabad", 2017)
#'
#' library(ipl)
#'
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @import janitor
#' @export
#'
winloss <- function(team_name, year) {
  '%!in%' <- Negate(`%in%`)
  if (year > 2020 | year < 2008) {
    stop("Invalid year (try a year between 2008 and 2020)")
  }
  if (team_name %!in% ipl$team1 | team_name %!in% ipl$team2) {
    stop("Invalid team name")
  }
  winloss_tbl <- ipl %>%
    dplyr::filter(
      year == year,
      team1 == team_name | team2 == team_name
    ) %>%
    group_by(toss_decision) %>%
    summarize(
      wins = sum(winner == team_name),
      losses = sum(winner != team_name),
      wpct = wins / (wins + losses),
      .groups = 'drop'
    ) %>%
    adorn_totals("row")

  winloss_tbl[3, 4] = winloss_tbl[3, 4]/2

  return(winloss_tbl)
}
