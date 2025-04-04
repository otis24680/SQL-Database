-- Insert Genres
INSERT INTO Genres (Genre_Name) VALUES 
('Sci-Fi'), 
('Thriller'), 
('Romance'), 
('Adventure'),
('Comedy'),
('Horror'),
('Action'),
('Fantasy');

-- Insert Directors
INSERT INTO Directors (Name, Birthdate) VALUES 
('Steven Spielberg', '1946-12-18'), 
('James Cameron', '1954-08-16'), 
('Martin Scorsese', '1942-11-17'),
('Christopher Nolan', '1970-07-30');

-- Insert Actors
INSERT INTO Actors (Name, Birthdate) VALUES 
('Tom Hanks', '1956-07-09'), 
('Natalie Portman', '1981-06-09'), 
('Denzel Washington', '1954-12-28'), 
('Emma Stone', '1988-11-06'),
('Matthew McConaughey', '1969-11-04'),
('Anne Hathaway', '1982-11-12'),
('Jessica Chastain', '1977-03-24');

-- Insert Users
INSERT INTO Users (Username, Email) VALUES 
('FilmBuff2025', 'filmbuff2025@example.com'), 
('ReviewerX', 'reviewerx@example.com'), 
('CineGeek', 'cinegeek@example.com');
