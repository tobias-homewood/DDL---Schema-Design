-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL REFERENCES countries(id)
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL REFERENCES passengers(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines(id),

  from_city_id INTEGER NOT NULL REFERENCES cities(id),
  
  to_city_id INTEGER NOT NULL REFERENCES cities(id)
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities
  (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Bristol', 3),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Versailles', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Rio de Janeiro', 9),
  ('Santiago', 10),
  ('Chicago', 1);

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00',   1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00',    2, 5, 6),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',   3, 3, 4),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00',   3, 2, 8),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00',   4, 9, 11),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00',   5, 12, 13),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00',    1, 14, 15),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00',    6, 15, 21),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00',   6, 15, 17),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00',   7, 18, 20);



-- ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');