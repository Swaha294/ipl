#' Returns all the bowlers with an average score higher than the given score
#'
#' @param score The score for which we want all the bowler's names for, as a numeric vector
#'
#' @return `bowlers_list` returns a list of names.
#'
#' @examples
#'
#' library(ipl)
#'
#' # Finds all the bowlers with a score higher than 30
#' bowler_names(30)
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#' @export
#'

bowlers_score <- function(given_score) {
    bowlers_list <- list()

    # Ensures that it is a valid score
    if (given_score < 0) {
      stop("Invalid score. Must be greater than 0.")
    } else if (given_score >= 0 & given_score <= max(bowlers$avg)) {
      # Retrieves all the bowlers with a score equal to/greater than given_score
      bowlers_list <- bowlers$player[bowlers$avg > given_score]
      return(bowlers_list)
    } else if (given_score > max(bowlers$avg)) {
      stop("Invalid score. Please input a lower number.")
    }
}
