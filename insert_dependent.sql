-- Insert Films (ensure Genre_ID and Director_ID exist)
INSERT INTO Films (Title, Release_Year, Genre_ID, Director_ID, Duration, Rating) VALUES 
('Interstellar', 2014, 1, 4, 169, 8.6), 
('The Departed', 2006, 2, 3, 151, 8.5), 
('Titanic', 1997, 3, 2, 195, 7.9),
('Raging Bull', 1980, 2, 3, 129, 8.2),    
('Casino', 1995, 2, 3, 178, 8.2),        
('Gangs of New York', 2002, 2, 3, 167, 7.5),  
('Memento', 2000, 2, 4, 113, 8.4),      
('Dunkirk', 2017, 7, 4, 106, 8.0),      
('The Prestige', 2006, 2, 4, 130, 8.5),  
('Terminator 2: Judgment Day', 1991, 7, 2, 137, 8.5),  
('Aliens', 1986, 7, 2, 137, 8.4),      
('True Lies', 1994, 7, 2, 141, 7.2),    
('Saving Private Ryan', 1998, 7, 1, 169, 8.6),    
('Catch Me If You Can', 2002, 2, 1, 141, 8.1),    
('Indiana Jones and the Last Crusade', 1989, 4, 1, 127, 8.2),
('The Irishman', 2019, 2, 3, 209, 7.8),  
('Shutter Island', 2010, 2, 3, 138, 8.2),  
('The Wolf of Wall Street', 2013, 2, 3, 180, 8.2),
-- Quentin Tarantino 
('Pulp Fiction', 1994, 2, 5, 154, 8.9),
('Kill Bill: Vol. 1', 2003, 7, 5, 111, 8.1),
('Inglourious Basterds', 2009, 7, 5, 153, 8.3),
('Django Unchained', 2012, 7, 5, 165, 8.4),
('Once Upon a Time in Hollywood', 2019, 2, 5, 161, 7.6),
-- Ridley Scott 
('Blade Runner', 1982, 1, 6, 117, 8.1),
('Gladiator', 2000, 7, 6, 155, 8.5),
('The Martian', 2015, 1, 6, 144, 8.0),
('Black Hawk Down', 2001, 7, 6, 144, 7.7),
('Alien', 1979, 6, 6, 117, 8.5),
-- Clint Eastwood 
('Gran Torino', 2008, 2, 7, 116, 8.1),
('Million Dollar Baby', 2004, 3, 7, 132, 8.1),
('American Sniper', 2014, 7, 7, 133, 7.3),
('Mystic River', 2003, 2, 7, 138, 7.9),
('Unforgiven', 1992, 7, 7, 130, 8.2),
-- Woody Allen 
('Annie Hall', 1977, 5, 8, 93, 8.0),
('Manhattan', 1979, 3, 8, 96, 7.9),
('Midnight in Paris', 2011, 3, 8, 94, 7.7),
('Match Point', 2005, 2, 8, 124, 7.6),
('Vicky Cristina Barcelona', 2008, 3, 8, 96, 7.1);
--počet záznamů: 38


-- Insert Film_Actors (ensure Film_ID and Actor_ID exist)
INSERT INTO Film_Actors (Film_ID, Actor_ID, Role) VALUES 
--interstellar
(1, 2, 'Dr. Brand'), 
(1, 3, 'Cooper'), 
-- The Departed
(2, 3, 'Frank Costello'), 
(2, 4, 'Madolyn'), 
-- Titanic
(3, 1, 'Jack Dawson'), 
(3, 4, 'Rose DeWitt Bukater'),
-- Pulp Fiction
(19, 22, 'Vincent Vega'),
(19, 23, 'Jules Winnfield'),
-- Kill Bill: Vol. 1
(20, 24, 'The Bride'),
(20, 25, 'O-Ren Ishii'),
-- Inglourious Basterds
(21, 26, 'Lt. Aldo Raine'),
(21, 27, 'Hans Landa'),
-- Django Unchained
(22, 28, 'Django'),
(22, 29, 'Broomhilda'),
-- Once Upon a Time in Hollywood
(23, 30, 'Sharon Tate'),
(23, 31, 'James Stacy'),
-- Blade Runner
(24, 32, 'Rick Deckard'),
(24, 33, 'Roy Batty'),
-- Gladiator
(25, 34, 'Maximus'),
(25, 35, 'Commodus'),
-- The Martian
(26, 36, 'Mark Watney'),
(26, 7, 'Melissa Lewis'),
-- Black Hawk Down
(27, 38, 'SSgt. Eversmann'),
(27, 39, 'Grimes'),
-- Alien
(28, 40, 'Dallas'),
(28, 41, 'Lambert'),
-- Gran Torino
(29, 42, 'Thao'),
(29, 43, 'Sue'),
-- Million Dollar Baby
(30, 44, 'Maggie Fitzgerald'),
(30, 45, 'Eddie Scrap-Iron Dupris'),
-- American Sniper
(31, 46, 'Chris Kyle'),
(31, 47, 'Taya Kyle'),
-- Mystic River
(32, 48, 'Jimmy Markum'),
(32, 49, 'Sean Devine'),
-- Unforgiven
(33, 50, 'Little Bill'),
(33, 51, 'English Bob'),
-- Annie Hall
(34, 52, 'Annie Hall'),
(34, 53, 'Rob'),
-- Manhattan
(35, 54, 'Tracy'),
(35, 55, 'Yale'),
-- Midnight in Paris
(36, 56, 'Gil'),
(36, 57, 'Inez'),
-- Match Point
(37, 58, 'Chris Wilton'),
(37, 59, 'Nola Rice'),
-- Vicky Cristina Barcelona
(38, 60, 'Maria Elena'),
(38, 61, 'Vicky');

--počet záznamů: 46

-- Insert Reviews (ensure Film_ID and User_ID exist)
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment) VALUES 
(1, 1, 10, 'Amazing visuals and story!'), 
(2, 2, 9, 'A crime thriller masterpiece.'), 
(3, 3, 8, 'Classic love story.'),
(4, 5, 9, 'Great performances and intense story.'),
(5, 1, 7, 'Good, but pacing was a bit off.'),
(6, 7, 8, 'Visually stunning with a solid plot.'),
(7, 2, 6, 'Interesting concept but slow in parts.'),
(8, 6, 10, 'One of the best I have ever seen!'),
(9, 4, 5, 'Some good moments, but overall forgettable.'),
(10, 8, 9, 'Fantastic direction and acting.'),
(11, 9, 6, 'Mediocre execution of a good idea.'),
(12, 10, 8, 'Solid movie with great atmosphere.'),
(13, 3, 4, 'Disappointing, expected more.'),
(14, 11, 7, 'Not bad, not amazing either.'),
(15, 12, 9, 'Surprisingly good! Well written.'),
(16, 13, 10, 'Masterpiece in every sense.'),
(17, 2, 5, 'A bit boring but well made.'),
(18, 1, 8, 'Impressive from start to finish.'),
(5, 4, 9, 'Really enjoyed the atmosphere and soundtrack.'),
(6, 5, 7, 'Good performances, but lacked emotional impact.'),
(7, 6, 8, 'Solid direction with great cinematography.'),
(8, 7, 10, 'Blew me away. Everything was perfect.'),
(9, 8, 6, 'Some cool scenes, but not very memorable.'),
(10, 9, 8, 'Great pacing and solid acting.'),
(11, 10, 5, 'Didn’t live up to the hype for me.'),
(12, 11, 9, 'Very compelling and well-executed.'),
(13, 12, 7, 'Had fun watching it. A bit predictable though.'),
(14, 13, 6, 'Decent film but dragged at times.'),
(15, 3, 9, 'Loved the tension and character work.'),
(16, 4, 10, 'Absolutely brilliant. Would watch again.'),
(17, 5, 8, 'Impressive visuals and engaging plot.'),
(18, 6, 4, 'Not my cup of tea.'),
(4, 11, 7, 'Enjoyed the story, some scenes were too long.'),
(5, 12, 8, 'Well acted and entertaining.'),
(6, 13, 6, 'Cool idea, but didn’t hit emotionally.'),
(7, 1, 5, 'Nice visuals, weak script.'),
(8, 9, 9, 'Excellent film overall.'),
(9, 2, 8, 'Surprisingly good with great pacing.');


--počet záznamů: 37

--počet celkových záznamů: 121