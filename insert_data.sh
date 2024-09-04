#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Truncate the tables
echo "$($PSQL "TRUNCATE teams, games;")"

# Process the CSV file
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  # Skip the header row
  if [[ "$year" != "year" ]]
  then
    # Check and insert winner
    select_winner=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    if [[ -z $select_winner ]]
    then
      insert_winner=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
      if [[ $insert_winner == "INSERT 0 1" ]]
      then
        echo "$winner has been inserted into teams table."
        select_winner=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
      else
        echo "Failed to insert $winner into teams table."
      fi
    fi

    # Check and insert opponent
    select_opponent=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    if [[ -z $select_opponent ]]
    then
      insert_opponent=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
      if [[ $insert_opponent == "INSERT 0 1" ]]
      then
        echo "$opponent has been inserted into teams table."
        select_opponent=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
      else
        echo "Failed to insert $opponent into teams table."
      fi
    fi

    # Insert the game data
    insert_game=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$year', '$round', $select_winner, $select_opponent, $winner_goals, $opponent_goals)")
    if [[ $insert_game == "INSERT 0 1" ]]
    then
      echo "Game between $winner and $opponent in $year has been inserted into games table."
    else
      echo "Failed to insert game between $winner and $opponent in $year into games table."
    fi
  fi
done
