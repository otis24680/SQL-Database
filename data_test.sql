-- Insert 20 new Films (5 od každého režiséra ID 5–8)
INSERT INTO Films (Title, Release_Year, Genre_ID, Director_ID, Duration, Rating) VALUES 
-- Quentin Tarantino (ID 5)
('Pulp Fiction', 1994, 2, 5, 154, 8.9),
('Kill Bill: Vol. 1', 2003, 7, 5, 111, 8.1),
('Inglourious Basterds', 2009, 7, 5, 153, 8.3),
('Django Unchained', 2012, 7, 5, 165, 8.4),
('Once Upon a Time in Hollywood', 2019, 2, 5, 161, 7.6),

-- Ridley Scott (ID 6)
('Blade Runner', 1982, 1, 6, 117, 8.1),
('Gladiator', 2000, 7, 6, 155, 8.5),
('The Martian', 2015, 1, 6, 144, 8.0),
('Black Hawk Down', 2001, 7, 6, 144, 7.7),
('Alien', 1979, 6, 6, 117, 8.5),

-- Clint Eastwood (ID 7)
('Gran Torino', 2008, 2, 7, 116, 8.1),
('Million Dollar Baby', 2004, 3, 7, 132, 8.1),
('American Sniper', 2014, 7, 7, 133, 7.3),
('Mystic River', 2003, 2, 7, 138, 7.9),
('Unforgiven', 1992, 7, 7, 130, 8.2),

-- Woody Allen (ID 8)
('Annie Hall', 1977, 5, 8, 93, 8.0),
('Manhattan', 1979, 3, 8, 96, 7.9),
('Midnight in Paris', 2011, 3, 8, 94, 7.7),
('Match Point', 2005, 2, 8, 124, 7.6),
('Vicky Cristina Barcelona', 2008, 3, 8, 96, 7.1);
