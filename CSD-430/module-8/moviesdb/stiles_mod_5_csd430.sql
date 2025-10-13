-- Name: Andy Stiles
-- Class: CSD-430 Server Side Development
-- Assignment: Modules 5 & 6 – CRUD-READ, JDBC, & JavaBeans
-- Date: 10/12/2025
-- File: stiles_mod_5_csd430.sql
-- Purpose: Create DB CSD430, user student1/pass (local), table andy_movies_data, and seed 10 rows.

-- Create database
CREATE DATABASE IF NOT EXISTS CSD430
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;

-- Create local-only dev user and grant privileges on CSD430
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

-- Use the database
USE CSD430;

-- Drop old table if re-running
DROP TABLE IF EXISTS andy_movies_data;

-- Create table with 5+ fields (id is PK)
CREATE TABLE andy_movies_data (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  release_year INT NOT NULL,
  genre VARCHAR(100) NOT NULL,
  director VARCHAR(150) NOT NULL,
  rating DECIMAL(2,1) NULL,
  notes VARCHAR(255) NULL
);

-- Insert 10 records (feel free to change titles)
INSERT INTO andy_movies_data (title, release_year, genre, director, rating, notes) VALUES
('The Shawshank Redemption', 1994, 'Drama', 'Frank Darabont', 9.3, 'Prison drama, hope'),
('The Dark Knight', 2008, 'Action', 'Christopher Nolan', 9.0, 'Iconic Joker'),
('Inception', 2010, 'Sci-Fi', 'Christopher Nolan', 8.8, 'Dream layers'),
('Interstellar', 2014, 'Sci-Fi', 'Christopher Nolan', 8.6, 'Space and time'),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 'Fantasy', 'Peter Jackson', 8.8, 'Quest begins'),
('The Matrix', 1999, 'Sci-Fi', 'The Wachowskis', 8.7, 'Bullet time'),
('Gladiator', 2000, 'Historical', 'Ridley Scott', 8.5, 'Roman epic'),
('Whiplash', 2014, 'Drama', 'Damien Chazelle', 8.5, 'Intensity and ambition'),
('Spider-Man: Into the Spider-Verse', 2018, 'Animation', 'Persichetti/Ramsey/Rothman', 8.4, 'Stylized animation'),
('Parasite', 2019, 'Thriller', 'Bong Joon-ho', 8.5, 'Class satire');

-- Simple read test (optional to run in client)
SELECT * FROM andy_movies_data ORDER BY release_year, title;
