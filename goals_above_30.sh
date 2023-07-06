
#!/bin/bash

# Check if the input file exists
if [ ! -f "$1" ]; then
    echo "Error: $1 does not exist."
    exit 1
fi

# Remove the output file if it exists
if [ -f "$2" ]; then
    rm "$2"
fi

# Write headers to the output file
echo "full_name,age,birthday,birthday_GMT,league,season,position,Current Club,minutes_played_overall,minutes_played_home,minutes_played_away,nationality,appearances_overall,appearances_home,appearances_away,goals_overall,goals_home,goals_away,assists_overall,assists_home,assists_away,penalty_goals,penalty_misses,clean_sheets_overall,clean_sheets_home,clean_sheets_away,conceded_overall,conceded_home,conceded_away,yellow_cards_overall,red_cards_overall,goals_involved_per_90_overall,assists_per_90_overall,goals_per_90_overall,goals_per_90_home,goals_per_90_away,min_per_goal_overall,conceded_per_90_overall,min_per_conceded_overall,min_per_match,min_per_card_overall,min_per_assist_overall,cards_per_90_overall,rank_in_league_top_attackers,rank_in_league_top_midfielders,rank_in_league_top_defenders,rank_in_club_top_scorer" > "$2"

# Find players with age above 30 and at least 1 goal, and write them to the output file
awk -F "," '$2 > 30 && $16 >= 1' "$1" >> "$2"

