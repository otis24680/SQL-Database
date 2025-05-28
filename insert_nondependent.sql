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
('Arnold Schwarzenegger', '1947-07-30'),     -- True Lies

-- Pulp Fiction
('John Travolta', '1954-02-18'),
('Samuel L. Jackson', '1948-12-21'),

-- Kill Bill: Vol. 1
('Uma Thurman', '1970-04-29'),
('Lucy Liu', '1968-12-02'),

-- Inglourious Basterds
('Brad Pitt', '1963-12-18'),
('Christoph Waltz', '1956-10-04'),

-- Django Unchained
('Jamie Foxx', '1967-12-13'),
('Kerry Washington', '1977-01-31'),

-- Once Upon a Time in Hollywood
('Margot Robbie', '1990-07-02'),
('Timothy Olyphant', '1968-05-20'),

-- Blade Runner
('Harrison Ford', '1942-07-13'),
('Rutger Hauer', '1944-01-23'),

-- Gladiator
('Russell Crowe', '1964-04-07'),
('Joaquin Phoenix', '1974-10-28'),

-- The Martian
('Matt Damon', '1970-10-08'),
('Jessica Chastain', '1977-03-24'),

-- Black Hawk Down
('Josh Hartnett', '1978-07-21'),
('Ewan McGregor', '1971-03-31'),

-- Alien
('Tom Skerritt', '1933-08-25'),
('Veronica Cartwright', '1949-04-20'),

-- Gran Torino
('Bee Vang', '1991-11-04'),
('Ahney Her', '1992-07-13'),

-- Million Dollar Baby
('Hilary Swank', '1974-07-30'),
('Morgan Freeman', '1937-06-01'),

-- American Sniper
('Bradley Cooper', '1975-01-05'),
('Sienna Miller', '1981-12-28'),

-- Mystic River
('Sean Penn', '1960-08-17'),
('Kevin Bacon', '1958-07-08'),

-- Unforgiven
('Gene Hackman', '1930-01-30'),
('Richard Harris', '1930-10-01'),

-- Annie Hall
('Diane Keaton', '1946-01-05'),
('Tony Roberts', '1939-10-22'),

-- Manhattan
('Mariel Hemingway', '1961-11-22'),
('Michael Murphy', '1938-05-05'),

-- Midnight in Paris
('Owen Wilson', '1968-11-18'),
('Rachel McAdams', '1978-11-17'),

-- Match Point
('Jonathan Rhys Meyers', '1977-07-27'),
('Scarlett Johansson', '1984-11-22'),

-- Vicky Cristina Barcelona
('Penélope Cruz', '1974-04-28'),
('Rebecca Hall', '1982-05-03');
--počet záznamů: 61

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