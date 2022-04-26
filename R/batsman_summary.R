#' Get the summary table of all batting statistics of a batsman by year
#' (across all IPL matches between 2008 and 2020)
#'
#' @param player The name of the batsman for whom the batting summary table is
#' desired
#'
#' @return `batsman_summary` returns the a data frame with all batting statistics
#' of the batsman for all years
#'
#' @examples
#'
#' library(ipl)
#'
#' # Get the summary table of all batting statistics for MS Dhoni
#' batsman_summary("MS Dhoni")
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @import ggplot2
#' @importFrom purrr map2_df
#'
#' @export
#'

batsman_summary <- function(player) {
  if (!(is.character(player))) {
    stop(paste0("Invalid input: ", player, " should be a character vector"), call. = FALSE)
  } else if (!(player %in% deliveries$batsman)) {
    stop(paste0(player, " not found!"), call. = FALSE)
  } else {
    ipl::bat_avg(player, 2008:2020) %>%
      left_join(map2_df(player, 2008:2020, ipl::bat_max), by = c("batsman", "year")) %>%
      left_join(map2_df(player, 2008:2020, ipl::strike_rate), by = c("batsman", "year")) %>%
      left_join(map2_df(player, 2008:2020, ipl::cents_halfcents), by = c("batsman", "year")) %>%
      left_join(map2_df(player, 2008:2020, ipl::fours), by = c("batsman", "year")) %>%
      left_join(map2_df(player, 2008:2020, ipl::sixes)) %>%
      select(-batsman) %>%
      arrange(desc(year))
  }
}
