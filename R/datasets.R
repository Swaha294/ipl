#' Ball-by-ball data of IPL matches played in 2008-2020
#'
#' @format A data frame of 193468 rows representing each ball bowled/ played in
#' all IPL matches from 2008-2020.
#' \describe{
#' \item{id}{Unique match ID of the IPL match as per ESPNCricinfo}
#' \item{year}{Season (year) the IPL match is played in}
#' \item{date}{Date of IPL match}
#' \item{inning}{Binary variable indicating inning number of match}
#' \item{over}{Over number in an inning of the match}
#' \item{ball}{Ball number in an over of an inning of the match}
#' \item{batsman}{Batsman on strike}
#' \item{non_striker}{Batsman at non-striker}
#' \item{bowler}{Bowler}
#' \item{batsman_runs}{Runs made off the bat by the batsman}
#' \item{extra_runs}{Extra runs}
#' \item{total_runs}{Total runs made off bat and extra runs}
#' \item{non_boundary}{Binary vector indicating whether there are overthrows}
#' \item{is_wicket}{Binary vector indicating whether the delivery is a wicket}
#' \item{dismissal_kind}{Type of dismissal}
#' \item{player_dismissed}{Player dismissed if delivery is a wicket}
#' \item{fielder}{Fielder involved in dismissal if delivery is a wicket}
#' \item{extras_type}{Type of extra ball}
#' \item{batting_team}{Batting team on strike}
#' \item{bowling_team}{Bowling team}
#' }
#'
#' @source This dataset was obtained from Kaggle: [Ball-by-ball](https://www.kaggle.com/datasets/patrickb1912/ipl-complete-dataset-20082020?select=IPL+Ball-by-Ball+2008-2020.csv).
"deliveries"


#' Winning team, overs bowled, runs made and wickets fallen for each match played
#' by each IPL team in 2008-2020.
#'
#' @format A data frame of 1630 rows representing the result, runs made, overs
#' played, and wickets fallen for each match played by each IPL team in 2008-2020.
#' \describe{
#' \item{id}{Unique match ID of the IPL match as per ESPNCricinfo}
#' \item{year}{Season (year) of the IPL match}
#' \item{date}{Date of IPL match}
#' \item{batting_team}{Batting team on strike}
#' \item{match_runs}{Runs made by the batting team in the given IPL match}
#' \item{winning_team}{Winning team of given IPL match}
#' \item{n_overs}{Number of overs faced by the batting team in the given IPL match}
#' }
#'
#' @seealso This data set was created from the `deliveries` data set of the `ipl`
#' package.
"teams"

#' Information on matches from 2008 to 2020
#'
#' @format A data frame of 816 rows containing the information about all matches from 2008 to 2020
#' \describe{
#' \item{id}{Unique match ID of the IPL match as per ESPNCricinfo}
#' \item{city}{City in which the match took place}
#' \item{date}{Date of the match}
#' \item{year}{Year (season) of IPL match}
#' \item{player_of_match}{Recipient of the player of match award}
#' \item{venue}{Venue where the match took place}
#' \item{neutral_venue}{Neutral }
#' \item{team1}{First team name}
#' \item{team2}{Second team name}
#' \item{toss_winner}{Winner of the coin toss}
#' \item{toss_decision}{Whether toss winning team chose to bat or field first}
#' \item{winner}{Winning team}
#' \item{result}{Wickets or Runs}
#' \item{result_margin}{Margin won by}
#' \item{eliminator}{Y/N advanced to The Humdred Eliminator}
#' \item{method}{Method used to calculate the target score}
#' \item{umpire1}{Name of first umpire}
#' \item{umpire2}{Name of second umpire}
#' }
#' @source This dataset was obtained from Kaggle: [IPL Matches 2008-2020](https://www.kaggle.com/datasets/patrickb1912/ipl-complete-dataset-20082020?select=IPL+Matches+2008-2020.csv)
"ipl"



#' This file contains all the details of the top 100 batsmen
#'
#' @format A data frame of 100 rows representing the stats of the top 100 batsman
#' \describe{
#' \item{pos}{The position of the player in the 1 to 100 ranking}
#' \item{player}{Player name}
#' \item{mat}{Number of matches played by the batsman}
#' \item{inns}{The number of innings played by the batsman}
#' \item{no}{Number of times the batsman was not out at the end of an inning}
#' \item{runs}{The total number of runs made by the batsman}
#' \item{hs}{Highest score ever made by the batsman}
#' \item{avg}{Average batting score}
#' \item{bf}{Number of balls faced by the batsman}
#' \item{sr}{The overall strike rate of the batsman}
#' \item{num_100}{The number of innings where the batsman scored one hundred or more runs}
#' \item{num_50}{The number of innings where the batsman scored fifty to ninety runs}
#' \item{num_4s}{Number of 4s scored by the batsman}
#' \item{num_6s}{Number of 6s scored by the batsman}
#' }
#' @source This dataset was obtained from Kaggle: [Top_100_Batsman](https://www.kaggle.com/datasets/nkitgupta/ipl-auction-and-ipl-dataset?select=Top_100_bowlers.xlsx).
"batsman"


#' This file contains all the details of the top 100 bowlers
#'
#' @format A data frame of 100 rows for all the bowlers
#' \describe{
#' \item{pos}{The position of the player in the 1 to 100 ranking}
#' \item{player}{Player name}
#' \item{mat}{Number of matches played by bowler}
#' \item{inns}{The number of innings}
#' \item{ov}{The number of overs}
#' \item{runs}{The number of runs}
#' \item{wkts}{The number of wickets}
#' \item{bbi}{Best Bowling in Innings (BBI) gives the score for one inning}
#' \item{avg}{The average bowling score for the player}
#' \item{econ}{bowler economy}
#' \item{sr}{The strike rate of the bowler}
#' \item{num_4w}{The number of innings in which the bowler took exactly four wickets}
#' \item{num_5w}{the number of innings in which the bowler took exactly five wickets}
#' }
#' @source This dataset was obtained from Kaggle: [Bowlers](https://www.kaggle.com/datasets/nkitgupta/ipl-auction-and-ipl-dataset).
"bowlers"
