#' Get the summary table of the bowling statistics of a batsman
#' (across all IPL matches between 2008 and 2020)
#'
#'
#' @return `bowler_summary` returns the a data frame with the bowling statistics
#'
#' @examples
#'
#' library(ipl)
#'
#' # Get the summary table of the bowler statistics for Rahul Sharma
#' bowler_summary()
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @import ggplot2
#' @importFrom purrr map2_df
#'
#' @export
bowler_summary <- function() {
  # most overs
  value_mostOvers = max(bowlers_100$ov)
  bowler_mostOvers = bowlers_100$player[bowlers_100$ov == value_mostOvers]

  # most runs
  value_mostRuns = max(bowlers_100$runs)
  bowler_mostRuns = bowlers_100$player[bowlers_100$runs == value_mostRuns]

  # most wickets
  value_mostWkts = max(bowlers_100$wkts)
  bowler_mostWkts = bowlers_100$player[bowlers_100$wkts == value_mostWkts]

  # building each column
  statistic <- c("most_overs", "most_runs", "most_wickets")
  bowler <- c(bowler_mostOvers, bowler_mostRuns, bowler_mostWkts)
  value <- c(value_mostOvers, value_mostRuns, value_mostWkts)

  # creating the df
  summary_df <- data.frame(statistic, bowler, value)

  return(summary_df)
}
