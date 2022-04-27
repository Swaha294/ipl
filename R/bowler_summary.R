#' Get the summary table of the bowling statistics of a batsman
#' (across all IPL matches between 2008 and 2020)
#'
#'
#' @return `summary_df` returns the a data frame with the bowling statistics
#'
#' @examples
#'
#' library(ipl)
#'
#' # Get the summary table of the bowler statistics for Rahul Sharma
#' bowler_summary("Rahul Sharma")
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @import ggplot2
#' @importFrom purrr map2_df
#'
#' @export
bowler_summary <- function() {
  # most innings
  value_mostInns = max(bowlers$Inns)
  bowler_mosInns = bowlers$PLAYER[bowlers$Inns == value_mostInns]

  # most matches
  value_mostMat = max(bowlers$Mat)
  bowler_mosMat = bowlers$PLAYER[bowlers$Mat == value_mostMat]

  # most overs
  value_mostOvers = max(bowlers$Ov)
  bowler_mostOvers = bowlers$PLAYER[bowlers$Ov == value_mostOvers]

  # most runs
  value_mostRuns = max(bowlers$Runs)
  bowler_mostRuns = bowlers$PLAYER[bowlers$Runs == value_mostRuns]

  # most wickets
  value_mostWkts = max(bowlers$Wkts)
  bowler_mostWkts = bowlers$PLAYER[bowlers$Wkts == value_mostWkts]

  # building each column
  Statistic <- c("Most Overs", "Most Runs", "Most Wickets", "Most Matches", "Most Innings")
  Bowler <- c(bowler_mostOvers, bowler_mostRuns, bowler_mostWkts, bowler_mosMat, bowler_mosInns)
  Value <- c(value_mostOvers, value_mostRuns, value_mostWkts, value_mostMat, value_mostInns)

  # creating the df
  summary_df <- data.frame(Statistic, Bowler, Value)

  return(summary_df)
}
