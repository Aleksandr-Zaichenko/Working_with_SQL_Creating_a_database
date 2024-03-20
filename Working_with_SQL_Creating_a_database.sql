CREATE TABLE IF NOT EXISTS genres (
  genre_id SERIAL PRIMARY KEY, 
  genre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS performers (
  performer_id SERIAL PRIMARY KEY, 
  genre INTEGER REFERENCES genres(genre_id) NOT NULL,
  performer VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
  album_id SERIAL PRIMARY KEY, 
  performer INTEGER REFERENCES performers(performer_id) NOT NULL,
  album VARCHAR(100) NOT NULL, 
  release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_performers ( 
  performer_id INTEGER REFERENCES performers(performer_id) NOT NULL, 
  genres_id INTEGER REFERENCES genres(genre_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_performers ( 
  performer_id INTEGER REFERENCES performers(performer_id) NOT NULL, 
  album_id INTEGER REFERENCES albums(album_id) NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks (
  track_id SERIAL PRIMARY KEY, 
  album INTEGER REFERENCES albums(album_id) NOT NULL,
  track VARCHAR(20) NOT NULL, 
  duration VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
  collection_id SERIAL PRIMARY KEY, 
  name VARCHAR(20) NOT NULL, 
  release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collections_tracks (
  collection_id INTEGER REFERENCES collections(collection_id) NOT NULL, 
  track_id INTEGER REFERENCES tracks(track_id) NOT NULL
);