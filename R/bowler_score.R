#' Returns all the bowlers with an average score higher than the given score
#'
#' @param given_score The avg score for which we want all the bowler's names for, as a numeric vector
#'
#' @return `bowler_score` returns a list of names.
#'
#' @examples
#'
#' library(ipl)
#'
#' # Finds all the bowlers with an average score higher than 30
#' bowler_score(30)
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'

bowler_score <- function(given_score) {
    bowlers_list <- list()

    # Ensures that it is a valid score
    if (!is.numeric(given_score)) {
      stop(paste0("Invalid input: ", given_score, " must be a numeric vector"))
    } else if (given_score < 0) {
      stop("Invalid score. Must be greater than 0.")
    } else if (given_score >= 0 & given_score <= max(bowlers$avg)) {
      # Retrieves all the bowlers with an avg score greater than given_score
      bowlers_list <- bowlers$player[bowlers$avg > given_score]
      return(bowlers_list)
    } else if (given_score > max(bowlers$avg)) {
      stop("Invalid score. Please input a lower number.")
    }
}
