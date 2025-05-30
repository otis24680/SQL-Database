-- Žánry
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

-- Insert Directors (rozdělené jméno a příjmení)
INSERT INTO Directors (First_Name, Last_Name, Birthdate) VALUES
('Steven', 'Spielberg',    '1946-12-18'),
('James',  'Cameron',       '1954-08-16'),
('Martin', 'Scorsese',      '1942-11-17'),
('Christopher', 'Nolan',    '1970-07-30'),
('Quentin', 'Tarantino',    '1963-03-27'),
('Ridley',  'Scott',        '1937-11-30'),
('Clint',   'Eastwood',     '1930-05-31'),
('Woody',   'Allen',        '1935-12-01');

-- Insert Actors (rozdělené jméno a příjmení)
INSERT INTO Actors (First_Name, Last_Name, Birthdate) VALUES
('Tom',        'Hanks',               '1956-07-09'),
('Natalie',    'Portman',             '1981-06-09'),
('Denzel',     'Washington',          '1954-12-28'),
('Emma',       'Stone',               '1988-11-06'),
('Matthew',    'McConaughey',         '1969-11-04'),
('Anne',       'Hathaway',            '1982-11-12'),
('Jessica',    'Chastain',            '1977-03-24'),
('Leonardo',   'DiCaprio',            '1974-11-11'),
('Kate',       'Winslet',             '1975-10-05'),
('Joe',        'Pesci',               '1943-02-09'),
('Robert',     'De Niro',             '1943-08-17'),
('Al',         'Pacino',              '1940-04-25'),
('Cillian',    'Murphy',              '1976-05-25'),
('Guy',        'Pearce',              '1967-10-05'),
('Ellen',      'Burstyn',             '1932-12-07'),
('Harry',      'Dean Stanton',        '1926-07-14'),
('Sigourney',  'Weaver',              '1949-10-08'),
('Christian',  'Bale',                '1974-01-30'),
('Hugh',       'Jackman',             '1968-10-12'),
('Jamie Lee',  'Curtis',              '1958-11-22'),
('Arnold',     'Schwarzenegger',      '1947-07-30'),
('John',       'Travolta',            '1954-02-18'),
('Samuel L.',  'Jackson',             '1948-12-21'),
('Uma',        'Thurman',             '1970-04-29'),
('Lucy',       'Liu',                 '1968-12-02'),
('Brad',       'Pitt',                '1963-12-18'),
('Christoph',  'Waltz',               '1956-10-04'),
('Jamie',      'Foxx',                '1967-12-13'),
('Kerry',      'Washington',          '1977-01-31'),
('Margot',     'Robbie',              '1990-07-02'),
('Timothy',    'Olyphant',            '1968-05-20'),
('Harrison',   'Ford',                '1942-07-13'),
('Rutger',     'Hauer',               '1944-01-23'),
('Russell',    'Crowe',               '1964-04-07'),
('Joaquin',    'Phoenix',             '1974-10-28'),
('Matt',       'Damon',               '1970-10-08'),
('Jessica',    'Chastain',            '1977-03-24'),
('Josh',       'Hartnett',            '1978-07-21'),
('Ewan',       'McGregor',            '1971-03-31'),
('Tom',        'Skerritt',            '1933-08-25'),
('Veronica',   'Cartwright',          '1949-04-20'),
('Bee',        'Vang',                '1991-11-04'),
('Ahney',      'Her',                 '1992-07-13'),
('Hilary',     'Swank',               '1974-07-30'),
('Morgan',     'Freeman',             '1937-06-01'),
('Bradley',    'Cooper',              '1975-01-05'),
('Sienna',     'Miller',              '1981-12-28'),
('Sean',       'Penn',                '1960-08-17'),
('Kevin',      'Bacon',               '1958-07-08'),
('Gene',       'Hackman',             '1930-01-30'),
('Richard',    'Harris',              '1930-10-01'),
('Diane',      'Keaton',              '1946-01-05'),
('Tony',       'Roberts',             '1939-10-22'),
('Mariel',     'Hemingway',           '1961-11-22'),
('Michael',    'Murphy',              '1938-05-05'),
('Owen',       'Wilson',              '1968-11-18'),
('Rachel',     'McAdams',             '1978-11-17'),
('Jonathan', 'Meyers',            '1977-07-27'),
('Scarlett',   'Johansson',           '1984-11-22'),
('Penélope',   'Cruz',                '1974-04-28'),
('Rebecca',    'Hall',                '1982-05-03');

-- 68 záznamů

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

--počet celkových záznamů: 86