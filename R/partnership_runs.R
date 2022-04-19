#' Calculate the runs made by all batting partnerships in a given IPL match for
#' a given team
#'
#' @param match_id The unique match id for the desired IPL match, according to
#' ESPNCricInfo
#' @param batting_side The particular batting team in the given IPL match for whom
#' partenrship runs have to be calculated
#'
#' @return `partnership_runs` returns a stacked bar plot with the batting
#' partnerships on the x-axis, the total runs made by the partnership on the
#' y-axis, and the bars filled in by the number of runs made by each batsman in the
#' partnership
#'
#' @examples
#'
#' library(ipl)
#'
#' # Calculate the number of runs made by Mumbai Indians in their match against
#' Delhi Capitals on 2019-03-24, by partnerships
#' partnership_runs(1175358, "Mumbai Indians")
#'
#' @importFrom magrittr "%>%"
#' @import dplyr
#'
#'
#'
options(dplyr.summarise.inform = FALSE)

batsmen <- function(match_id, batting_side) {
deliveries %>%
  filter(
    id == match_id,
    batting_team == batting_side,
    extras_type %in% c("byes", "legbyes") | is.na(extras_type)
  ) %>%
  select(batsman, non_striker) %>%
  distinct()
}

pair_runs <- function(n, match_id, df){
  deliveries %>%
    filter(
      extras_type %in% c("byes", "legbyes") | is.na(extras_type),
      id == match_id,
      batsman %in% c(df$batsman[n], df$non_striker[n]),
      non_striker %in% c(df$batsman[n], df$non_striker[n])
    ) %>%
    group_by(batsman, non_striker) %>%
    summarise(
      runs = sum(batsman_runs),
      balls = n()
    )
}

partnerships <- function(df) {
  i <- 1

  while (i <= (nrow(df))) {
    if (i + 1 > (nrow(df))) {
      df$group[i] <- paste0(
        df$non_striker[i], ", ",
        df$batsman[i]
      )
      break
    } else if (df$batsman[i] == df$non_striker[i + 1] &
               df$non_striker[i] == df$batsman[i + 1]) {
      df$group[i] <- paste0(
        df$batsman[i], ", ",
        df$batsman[i + 1]
      )
      df$group[i + 1] <- i

      df$runs2[i] <- df$runs[i + 1]
      df$runs2[i + 1] <- df$runs[i]

      i <- i + 1
    } else {
      df$group[i] <- paste0(
        df$non_striker[i], ", ",
        df$batsman[i]
      )
      df$runs2[i + 1] <- 0

      i <- i + 1
    }
  }

  return(df)
}

partnership_runs_plot <- function(match_id, batting_side) {

  batting_df <- batsmen(match_id, batting_side)

  pairs <- map_df(seq(1, nrow(batting_df)), pair_runs, match_id, batting_df) %>%
    distinct() %>%
    mutate(
      group = NA,
      runs2 = NA
    )

  pairs <- partnerships(pairs)

  pairs %>%
    group_by(group, batsman) %>%
    summarise(
      runs = runs
    ) %>%
    ggplot(aes(x = group, y = runs, fill = batsman)) +
    geom_col() +
    scale_fill_manual(
      values = c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f",
                 "#ff7f00", "#cab2d6", "#6a3d9a", "#ffff99")
    ) +
    theme_linedraw() +
    theme(
      axis.text.x = element_text(angle = 90)
    ) +
    labs(
      title = "Runs by Partnership",
      x = "",
      y = "Runs made"
    )

}

#' @export
#'
partnership_runs <- function(match_id, batting_side) {

  if (!is.numeric(match_id)) {
    stop("Invalid input: match id should be a numeric vector", call. = FALSE)
  } else if (!is.character(batting_side)) {
    stop("Invalid input: batting side input should be a character vector", call. = FALSE)
  } else if (!(match_id %in% deliveries$id)) {
    stop(paste0(`match_id`, " not found!"), call. = FALSE)
  } else if (!(batting_side %in% deliveries$batting_team)) {
    stop(paste0(`batting_side`, " not found!"), call. = FALSE)
  } else if (!(batting_side %in% deliveries$batting_team[deliveries$id == match_id])) {
    stop("Wrong team for given match", call. = FALSE)
  } else {
    partnership_runs_plot(match_id, batting_side)
  }
}
