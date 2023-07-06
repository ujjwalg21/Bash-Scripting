
#!/bin/bash

# Check if input file exists
if [ ! -f $1 ]; then
  echo "Error: Input file not found!"
  exit 1
fi

# Sort the players based on goals_overall column
sorted_players=$(cat $1 | awk -F ',' '{print $1","$16}' | sort -t ',' -k2 -nr)

# Get unique top 10 goals
top_goals=$(echo "$sorted_players" | awk -F ',' '{print $2}' | uniq | sort -nr | head -n 10)

# Print headers to output file
echo "full_name,age,birthday,birthday_GMT,league,season,position,Current Club,minutes_played_overall,minutes_played_home,minutes_played_away,nationality,appearances_overall,appearances_home,appearances_away,goals_overall,goals_home,goals_away,assists_overall,assists_home,assists_away,penalty_goals,penalty_misses,clean_sheets_overall,clean_sheets_home,clean_sheets_away,conceded_overall,conceded_home,conceded_away,yellow_cards_overall,red_cards_overall,goals_involved_per_90_overall,assists_per_90_overall,goals_per_90_overall,goals_per_90_home,goals_per_90_away,min_per_goal_overall,conceded_per_90_overall,min_per_conceded_overall,min_per_match,min_per_card_overall,min_per_assist_overall,cards_per_90_overall,rank_in_league_top_attackers,rank_in_league_top_midfielders,rank_in_league_top_defenders,rank_in_club_top_scorer" > $2

# Print players with top 10 goals to output file
for goal in $top_goals
do
  echo "$sorted_players" | awk -F ',' -v goal="$goal" '$2 == goal {print $1}' | while read player
  do
    grep "^$player," $1 >> $2
  done
done

