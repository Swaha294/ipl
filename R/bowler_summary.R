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

  # most innings
  value_mostInns <- max(bowlers_100$inns)
  bowler_mosInns <- bowlers_100$player[bowlers_100$inns == value_mostInns]

  # most matches
  value_mostMat <- max(bowlers_100$mat)
  bowler_mosMat <- bowlers_100$player[bowlers_100$mat == value_mostMat]

  # most overs
  value_mostOvers <- max(bowlers_100$ov)
  bowler_mostOvers <- bowlers_100$player[bowlers_100$ov == value_mostOvers]

  # most runs
  value_mostRuns <- max(bowlers_100$runs)
  bowler_mostRuns <- bowlers_100$player[bowlers_100$runs == value_mostRuns]

  # most wickets
  value_mostWkts <- max(bowlers_100$wkts)
  bowler_mostWkts <- bowlers_100$player[bowlers_100$wkts == value_mostWkts]

  # building each column
  statistic <- c("Most Overs", "Most Runs", "Most Wickets", "Most Matches", "Most Innings")
  bowler <- c(bowler_mostOvers, bowler_mostRuns, bowler_mostWkts, bowler_mosMat, bowler_mosInns)
  value <- c(value_mostOvers, value_mostRuns, value_mostWkts, value_mostMat, value_mostInns)

  # creating the df
  summary_df <- data.frame(statistic, bowler, value)

  return(summary_df)
}
