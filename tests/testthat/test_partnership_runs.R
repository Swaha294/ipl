library(dplyr)
library(ggplot2)
library(testthat)
library(purrr)

batters <- deliveries %>%
  filter(
    year == 2019,
    batting_team == "Mumbai Indians",
    extras_type %in% c("byes", "legbyes") | is.na(extras_type),
    id == 1175358
  ) %>%
  select(batsman, non_striker) %>%
  distinct()

pair_runs <- function(n) {
  deliveries %>%
    filter(
      year == 2019,
      batting_team == "Mumbai Indians",
      extras_type %in% c("byes", "legbyes") | is.na(extras_type),
      id == 1175358,
      batsman %in% c(batters$batsman[n], batters$non_striker[n]),
      non_striker %in% c(batters$batsman[n], batters$non_striker[n])
    ) %>%
    group_by(batsman, non_striker) %>%
    summarise(
      runs = sum(batsman_runs),
      balls = n()
    )
}


pairs_mi_dc_2019 <- map_df(seq(1, nrow(batters)), pair_runs) %>%
  distinct()

pairs_mi_dc_2019_2 <- pairs_mi_dc_2019 %>%
  mutate(
    group = NA,
    runs2 = NA
  )

i <- 1

while (i <= (nrow(pairs_mi_dc_2019_2))) {
  if (i + 1 > (nrow(pairs_mi_dc_2019_2))) {
    pairs_mi_dc_2019_2$group[i] <- paste0(pairs_mi_dc_2019_2$non_striker[i], ", ", pairs_mi_dc_2019_2$batsman[i])
    break
  } else if (pairs_mi_dc_2019_2$batsman[i] == pairs_mi_dc_2019_2$non_striker[i + 1] & pairs_mi_dc_2019_2$non_striker[i] == pairs_mi_dc_2019_2$batsman[i + 1]) {
    pairs_mi_dc_2019_2$group[i] <- paste0(pairs_mi_dc_2019_2$batsman[i], ", ", pairs_mi_dc_2019_2$batsman[i + 1])
    pairs_mi_dc_2019_2$group[i + 1] <- i

    pairs_mi_dc_2019_2$runs2[i] <- pairs_mi_dc_2019_2$runs[i + 1]
    pairs_mi_dc_2019_2$runs2[i + 1] <- pairs_mi_dc_2019_2$runs[i]

    i <- i + 1
  } else {
    pairs_mi_dc_2019_2$group[i] <- paste0(pairs_mi_dc_2019_2$non_striker[i], ", ", pairs_mi_dc_2019_2$batsman[i])
    pairs_mi_dc_2019_2$runs2[i + 1] <- 0

    i <- i + 1
  }
}

pairs_mi_dc_2019_2 <- pairs_mi_dc_2019_2 %>%
  group_by(group, batsman) %>%
  summarise(
    runs = runs
  )

runs_plot <- partnership_runs(1175358, "Mumbai Indians")

test_that("ggplot created", {
  expect_equal(class(runs_plot), c("gg", "ggplot"))
})

test_that("labels are correct", {
  expect_identical(runs_plot$labels$y, "Runs made")
  expect_identical(runs_plot$labels$title, "Runs by Partnership")
  expect_identical(runs_plot$labels$fill, "batsman")
})

test_that("correct data is used", {
  expect_equal(runs_plot$data[, -4], pairs_mi_dc_2019_2)
})
