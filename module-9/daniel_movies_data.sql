CREATE DATABASE CSD430;
USE CSD430;

CREATE TABLE daniel_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    director VARCHAR(100),
    release_year INT,
    rating DECIMAL(3,1)
);

INSERT INTO daniel_movies_data (title, genre, director, release_year, rating) VALUES
('The Matrix', 'Sci-Fi', 'Wachowski', 1999, 8.7),
('Inception', 'Sci-Fi', 'Christopher Nolan', 2010, 8.8),
('Titanic', 'Romance', 'James Cameron', 1997, 7.8),
('Gladiator', 'Action', 'Ridley Scott', 2000, 8.5),
('Jaws', 'Thriller', 'Steven Spielberg', 1975, 8.1),
('Avatar', 'Sci-Fi', 'James Cameron', 2009, 7.9),
('Rocky', 'Drama', 'John G. Avildsen', 1976, 8.1),
('Interstellar', 'Sci-Fi', 'Christopher Nolan', 2014, 8.6),
('The Godfather', 'Crime', 'Francis Ford Coppola', 1972, 9.2),
('Toy Story', 'Animation', 'John Lasseter', 1995, 8.3);

SELECT * FROM daniel_movies_data;