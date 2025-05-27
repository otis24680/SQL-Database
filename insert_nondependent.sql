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
--počet záznamů: 8

-- Insert Directors
INSERT INTO Directors (Name, Birthdate) VALUES 
('Steven Spielberg', '1946-12-18'), 
('James Cameron', '1954-08-16'), 
('Martin Scorsese', '1942-11-17'),
('Christopher Nolan', '1970-07-30'),
('Quentin Tarantino', '1963-03-27'),
('Ridley Scott', '1937-11-30'),
('Clint Eastwood', '1930-05-31'),
('Woody Allen', '1935-12-01');
--počet záznamů: 8

-- Insert Actors
INSERT INTO Actors (Name, Birthdate) VALUES 
('Tom Hanks', '1956-07-09'), 
('Natalie Portman', '1981-06-09'), 
('Denzel Washington', '1954-12-28'), 
('Emma Stone', '1988-11-06'),
('Matthew McConaughey', '1969-11-04'),
('Anne Hathaway', '1982-11-12'),
('Jessica Chastain', '1977-03-24'),
('Leonardo DiCaprio', '1974-11-11'),         -- Titanic, The Departed
('Kate Winslet', '1975-10-05'),              -- Titanic
('Joe Pesci', '1943-02-09'),                 -- The Irishman, Raging Bull
('Robert De Niro', '1943-08-17'),            -- The Irishman, Raging Bull
('Al Pacino', '1940-04-25'),                 -- The Irishman
('Cillian Murphy', '1976-05-25'),            -- Dunkirk
('Guy Pearce', '1967-10-05'),                -- Memento
('Ellen Burstyn', '1932-12-07'),             -- Interstellar
('Harry Dean Stanton', '1926-07-14'),        -- Alien
('Sigourney Weaver', '1949-10-08'),          -- Alien
('Christian Bale', '1974-01-30'),            -- The Prestige
('Hugh Jackman', '1968-10-12'),              -- The Prestige
('Jamie Lee Curtis', '1958-11-22'),          -- True Lies
('Arnold Schwarzenegger', '1947-07-30');     -- True Lies
--počet záznamů: 21

-- Insert Users
INSERT INTO Users (Username, Email) VALUES 
('FilmBuff2025', 'filmbuff2025@example.com'), 
('ReviewerX', 'reviewerx@example.com'), 
('CineGeek', 'cinegeek@example.com'),
('MovieFanatic', 'moviefanatic@example.com'),
('ClassicLover', 'classiclover@example.com'),
('IndieWatcher', 'indiewatcher@example.com'),
('BlockbusterDude', 'blockbusterdude@example.com'),
('SilentCinema', 'silentcinema@example.com'),
('ActionAddict', 'actionaddict@example.com'),
('DramaQueen', 'dramaqueen@example.com'),
('OscarHunter', 'oscarhunter@example.com'),
('Cinephile98', 'cinephile98@example.com'),
('TheRealCritic', 'therealcritic@example.com');
--počet záznamů: 13

--počet celkových záznamů: 46