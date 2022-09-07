CREATE TABLE game (
    id INT GENERATED ALWAYS AS IDENTITY,
    game_name varchar(50),
    mutiplayer varchar(3) NOT NULL,
    last_played_at DATE,
    date_created DATE,
    FOREIGN KEY (id) REFERENCES items (id)
);

CREATE TABLE author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL
);