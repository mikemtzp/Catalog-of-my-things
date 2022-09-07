CREATE DATABASE Catalog;

CREATE TABLE Item (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre INT NOT NULL,
  label INT NOT NULL,
  author INT NOT NULL,
  source INT NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  FOREIGN KEY (label) REFERENCES Label (id),
);

CREATE TABLE Label (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  color VARCHAR(50) NOT NULL,
)

CREATE TABLE Book ( 
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  publisher VARCHAR(50) NOT NULL, 
  cover_state VARCHAR(7) NOT NULL,
  FOREIGN KEY (id) REFERENCES Item (id), 
);

--  add all properties and associations from the parent Item class as table columns

CREATE TABLE Music_Albums (
  item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  title VARCHAR(50) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  on_spotify BOOLEAN NOT NULL
  FOREIGN KEY (item_id) REFERENCES Item (id)
)

CREATE TABLE Genres (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
  FOREIGN KEY (id) REFERENCES Item (id)
  );
  
CREATE TABLE Game (
    id INT GENERATED ALWAYS AS IDENTITY,
    game_name varchar(50),
    mutiplayer varchar(3) NOT NULL,
    last_played_at DATE,
    date_created DATE,
    FOREIGN KEY (id) REFERENCES items (id)
);

CREATE TABLE Author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL
);
