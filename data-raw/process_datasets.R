## Ball-by-ball information of IPL matches in 2008 - 2020

library(tidyverse)

deliveries <- read_csv("data-raw/ipl.csv") %>%
  janitor::clean_names() %>%
  mutate(
    date = as.Date(date, "%Y-%m-%d"),
    year = format(date, "%Y")
  ) %>%
  select(id, year, date) %>%
  right_join(read_csv("data-raw/deliveries.csv"), by = c("id")) %>%
  mutate(year = as.numeric(year))

usethis::use_data(deliveries, overwrite = TRUE)



## Creating function to create `teams` data set

winning_team <- function(teams, yr) {
  team_runs <- deliveries %>%
    filter(
      batting_team %in% teams | bowling_team %in% teams,
      yr == year
    ) %>%
    group_by(id, year, date, batting_team) %>%
    summarise(match_runs = sum(total_runs)) %>%
    mutate(winning_team = NA)


  team_overs <- deliveries %>%
    filter(
      batting_team %in% teams | bowling_team %in% teams,
      yr == year,
      extras_type %in% c("byes", "legbyes") | is.na(extras_type)
    ) %>%
    arrange(over, ball) %>%
    group_by(id, year, date, batting_team) %>%
    summarise(
      n_balls = n(),
      n_overs = length(unique(over)),
      diff = n_balls - (n_overs * 6)
    ) %>%
    mutate(n_overs2 = ifelse(diff < 0, as.numeric(paste0(
      n_overs - 1, ".",
      6 + diff
    )), n_overs)) %>%
    ungroup() %>%
    select(-c(n_balls, n_overs, diff)) %>%
    rename(n_overs = n_overs2)

  team_runs <- left_join(team_runs, team_overs, by = c(
    "id", "year", "date",
    "batting_team"
  ))


  dates <- team_runs %>%
    group_by(date) %>%
    summarise(N = n()) %>%
    filter(N == 1) %>%
    .$date

  df <- data.frame(
    id = NA,
    year = NA,
    date = NA,
    batting_team = NA,
    match_runs = NA,
    n_overs = NA,
    winning_team = NA
  )

  for (i in 1:nrow(team_runs)) {
    if (team_runs$date[i] %in% dates) {
      team_runs$winning_team[i] <- "No Result"
      df <- full_join(df, team_runs[i, ],
        by = c(
          "id", "year", "date", "batting_team", "match_runs",
          "n_overs", "winning_team"
        )
      )
      team_runs <- team_runs[-i, ]
    }
  }


  for (i in seq(1, nrow(team_runs), 2)) {
    if (team_runs$match_runs[i] < team_runs$match_runs[i + 1]) {
      team_runs$winning_team[i] <- team_runs$batting_team[i + 1]
      team_runs$winning_team[i + 1] <- team_runs$batting_team[i + 1]
    } else if (team_runs$match_runs[i] > team_runs$match_runs[i + 1]) {
      team_runs$winning_team[i] <- team_runs$batting_team[i]
      team_runs$winning_team[i + 1] <- team_runs$batting_team[i]
    } else {
      team_runs$winning_team[i] <- "Draw"
      team_runs$winning_team[i + 1] <- "Draw"
    }
  }


  team_runs <- team_runs %>%
    rbind(df) %>%
    filter(!is.na(id)) %>%
    arrange(date)

  return(team_runs)
}


## Information on winning team, overs bowled, runs made and wickets fallen for each team in
## each IPL match played in 2008-2020

teams <- map2_df((unique(deliveries$batting_team[deliveries$year == 2008])), 2008, winning_team) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2009])), 2009, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2010])), 2010, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2011])), 2011, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2012])), 2012, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2013])), 2013, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2014])), 2014, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2015])), 2015, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2016])), 2016, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2017])), 2017, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2018])), 2018, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2019])), 2019, winning_team)) %>%
  rbind(map2_df((unique(deliveries$batting_team[deliveries$year == 2020])), 2020, winning_team))

teams <- teams %>%
  distinct() %>%
  ungroup()


usethis::use_data(teams, overwrite = TRUE)
