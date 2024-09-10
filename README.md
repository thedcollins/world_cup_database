# World Cup Data Analysis

This project provides insights into World Cup tournaments through data analysis. It includes data on matches, teams, players, and tournaments, allowing users to explore statistics and trends over different World Cup events.

## Project Overview

The project consists of several key components:

- **`insert_data.sh`**: A script to load data from CSV files into the PostgreSQL database, handling insertion and updates of team and game information.
- **`queries.sh`**: A script for querying the PostgreSQL database to extract and display various statistics and insights from the World Cup data.
- **`worldcup.sql`**: SQL script containing the schema definitions and table creation commands for the World Cup database.

## Schema Details

### Tables

- **`teams`**
  - `team_id`: Unique identifier for each team.
  - `name`: Name of the team.

- **`games`**
  - `game_id`: Unique identifier for each game.
  - `year`: Year of the tournament.
  - `round`: Round of the tournament (e.g., Group Stage, Final).
  - `winner_id`: Foreign key linking to the winning team.
  - `opponent_id`: Foreign key linking to the opposing team.
  - `winner_goals`: Number of goals scored by the winning team.
  - `opponent_goals`: Number of goals scored by the opposing team.

### Sequences

- Sequences are used to generate unique identifiers for the tables.

### Constraints

- Primary Key constraints ensure each record is unique.
- Foreign Key constraints maintain relationships between teams and games.

## Getting Started

To get started with this project:

1. **Clone the Repository**
   - Clone this repository to your local machine using your preferred Git client.

2. **Set Up the Database**
   - Ensure you have PostgreSQL installed on your system.
   - Use the provided SQL script (`worldcup.sql`) to create and populate the database.

3. **Insert Data**
   - Run the `insert_data.sh` script to load data from the `games.csv` file into the database.

4. **Run Queries**
   - Execute the `queries.sh` script to obtain various statistics and insights from the data.

## Example Queries

- Total number of goals in all games from winning teams.
- Average number of goals in all games from both teams combined.
- List of unique winning team names in the dataset.

## What I Learned

- Data analysis techniques for sports data.
- SQL queries for extracting meaningful insights from a database.
- Using PostgreSQL features for data management and integrity.

## Acknowledgements

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- Data sources and inspiration from various World Cup datasets and statistics.
