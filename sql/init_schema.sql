CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  password VARCHAR(100)
);

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  team_id INT REFERENCES teams(id),
  role VARCHAR(50)
);

CREATE TABLE turf (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(100),
  area VARCHAR(100),
  max_players INT,
  sports VARCHAR(50)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  timing_date DATE,
  timing_from TIME,
  turf_id INT REFERENCES turf(id),
  payment_id VARCHAR(100),
  userid INT REFERENCES users(id)
);

CREATE TABLE match (
  id SERIAL PRIMARY KEY,
  sports VARCHAR(50),
  booking INT REFERENCES bookings(id),
  team1 INT REFERENCES teams(id),
  team2 INT REFERENCES teams(id),
  from_timing TIME,
  to_timing TIME,
  turf_id INT REFERENCES turf(id)
);

CREATE TABLE innings (
  id SERIAL PRIMARY KEY,
  match_id INT REFERENCES match(id),
  innings_no INT,
  batting_team INT REFERENCES teams(id),
  bowling_team INT REFERENCES teams(id),
  total_runs INT,
  total_wickets INT
);

CREATE TABLE overs (
  id SERIAL PRIMARY KEY,
  innings_id INT REFERENCES innings(id),
  over_number INT,
  bowler_id INT REFERENCES player(id)
);

CREATE TABLE ball_events (
  id SERIAL PRIMARY KEY,
  innings_id INT REFERENCES innings(id),
  over_number INT,
  ball_number INT,
  batsman_id INT REFERENCES player(id),
  non_striker_id INT REFERENCES player(id),
  bowler_id INT REFERENCES player(id),
  runs_scored INT,
  extra_type VARCHAR(50),
  extra_runs INT,
  is_wicket BOOLEAN,
  wicket_type VARCHAR(50),
  dismissed_batsman_id INT REFERENCES player(id),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);