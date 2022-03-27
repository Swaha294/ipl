#' Calculate the maximum runs made by a batsman in a given season
#'
#'
#' @param player the batsman for whom maximum runs have to be calculated, as a character vector
#' @param yr the season for which the maximum runs of the given batsman have to be calculated, as
#' a numeric vector
#'
#'
#' @examples
#'
#' library(ipl)
#'
#' # Find maximum runs made by Virat Kohli in the year 2016
#' bat_max("V Kohli", 2016)
#'
#' # Find maximum runs made by AB de Villiers in the year 2019
#' bat_max("AB de Villiers", 2019)
#'
#'
#'
#'
#'
#'
#'
#'
#'@importFrom magrittr "%>%"
#'
#' @export
bat_max <- function(player, yr) {
  if (!is.character(player)) {
    stop("Invalid input: player input should be a character vector")
  } else if (!is.numeric(yr)) {
    stop("Invalid input: year input should be a numeric vector")
  } else if (!(player %in% deliveries$batsman)) {
    stop(paste0(`player`, "not found!"))
  } else if (!(yr %in% deliveries$year)) {
    stop(paste0(`yr`, "Year not found"))
  } else {
    deliveries %>%
      dplyr::filter(batsman == player,
             year == yr) %>%
      dplyr::group_by(id, batsman) %>%
      dplyr::summarise(match_runs = sum(batsman_runs)) %>%
      dplyr::ungroup() %>%
      dplyr::group_by(batsman) %>%
      dplyr::summarise(max_runs = max(match_runs))
  }
}




















