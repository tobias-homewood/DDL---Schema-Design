-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL REFERENCES albums(id)
);

-- this shows which producers worked on which songs
CREATE TABLE produced
(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER NOT NULL REFERENCES producers(id),
  song_id INTEGER NOT NULL REFERENCES songs(id)
);

-- this shows which artists worked on which songs
CREATE TABLE performed
(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL REFERENCES artists(id),
  song_id INTEGER NOT NULL REFERENCES songs(id)
);

INSERT INTO artists
  (name)
VALUES
  ('Destinys Child'),
  ('Avril Lavigne'),
  ('Mariah Cary'),
  ('Queen'),
  ('Christina Aguilera'),
  ('Nickelback'),
  ('Alicia Keys'),
  ('Juicy J'),
  ('Boyz II Men'),
  ('Katy Perry'),
  ('Jay Z'),
  ('Lady Gaga'),
  ('Maroon 5'),
  ('Bradley Cooper'),
  ('Hanson');

INSERT INTO producers
  (name)
VALUES
  ('The Matrix'),
  ('Dust Brothers'),
  ('Al Shux'),
  ('Benny Blanco'),
  ('Stephen Lironi'),
  ('Max Martin'),
  ('Rick Parashar'),
  ('Darkchild'),
  ('Walter Afanasieff'),
  ('Cirkut'),
  ('Benjamin Rice'),
  ('Roy Thomas Baker'),
  ('Shellback');

INSERT INTO albums
  (title, release_date)
VALUES
  ('Middle of Nowhere','04-15-1997'),
  ('A Night at the Opera','10-31-1975'),
  ('Daydream','11-14-1995'),
  ('A Star Is Born','09-27-2018'),
  ('Silver Side Up','08-21-2001'),
  ('The Blueprint 3','10-20-2009'),
  ('Prism','12-17-2013'),
  ('Hands All Over','06-21-2011'),
  ('Let Go','05-14-2002'),
  ('The Writings on the Wall','11-07-1999');


INSERT INTO songs
  (title, duration_in_seconds, album_id)
VALUES
  ('MMMBop', '238', 1),
  ('Bohemian Rhapsody', '355', 2),
  ('One Sweet Day', '282', 3),
  ('Shallow', '216', 4),
  ('How You Remind Me', '223', 5),
  ('New York State of Mind', '276', 6),
  ('Dark Horse', '215', 7),
  ('Moves Like Jagger', '201', 8),
  ('Complicated', '244', 9),
  ('Say My Name', '240', 10);

INSERT INTO performed
  (artist_id, song_id)
VALUES
  (1, 10),
  (2, 4),
  (3, 5),
  (4, 7),
  (5, 1),
  (6, 4),
  (7, 8),
  (8, 8),
  (9, 9),
  (10, 6),
  (11, 3),
  (12, 7),
  (13, 3),
  (14, 6),
  (15, 2);

INSERT INTO produced
  (producer_id, song_id)
VALUES
  (1, 1),
  (2, 8),
  (3, 9),
  (4, 5),
  (5, 7),
  (6, 3),
  (7, 8),
  (8, 10),
  (9, 1),
  (10, 6),
  (11, 4),
  (12, 2),
  (13, 7);
  