CREATE SCHEMA dev;

-- initialize tables

CREATE TABLE IF NOT EXISTS dev.user (
  id UNIQUE PRIMARY KEY
  first_name VARCHAR
  last_name VARCHAR
  date_created DATE
);

CREATE TABLE IF NOT EXISTS dev.artist (
  id UNIQUE PRIMARY KEY
  name VARCHAR
  date_created DATE
)

CREATE TABLE IF NOT EXISTS dev.performer (
  id UNIQUE PRIMARY KEY
  first_name VARCHAR
  last_name VARCHAR
  date_created DATE
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
)

-- below table might be optional, just used to store various artist information
CREATE TABLE IF NOT EXISTS dev.performer_resource (
  id UNIQUE PRIMARY KEY
  artist_id VARCHAR
  type VARCHAR -- specify the type of resource like spotify | instagram | twitter | etc
  data VARCHAR -- probably contains url to resource
  date_created DATE
  CONSTRAINT fk_performer FOREIGN KEY(performer_id) REFERENCES performer(id)
)

CREATE TABLE IF NOT EXISTS dev.show (
  id UNIQUE PRIMARY KEY
  date DATE -- when the show is
  ticket_release DATE -- when tickets are available
  location VARCHAR
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
)

CREATE TABLE IF NOT EXISTS dev.presale (
  id UNIQUE PRIMARY KEY
  presale_code VARCHAR -- this may be null until we get the code
  presale_release DATE -- when presale code available
  presale_date DATE -- when actual presale available
  date_created DATE
  CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artist(id)
  CONSTRAINT fk_show FOREIGN KEY(show_id) REFERENCES show(id)
)