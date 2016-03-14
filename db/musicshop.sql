DROP TABLE Stocks;
DROP TABLE Albums;
DROP TABLE Artists;

CREATE TABLE artists (
  id serial4 PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE albums (
  id serial4 PRIMARY KEY,
  artist_id int4 REFERENCES artists(id),
  title varchar(255)
);

CREATE TABLE stocks (
  id serial4 PRIMARY KEY,
  quantity INT4,
  album_id INT4 REFERENCES albums(id),
  buy_price INT4,
  sell_price INT4
);

