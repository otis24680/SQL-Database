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
('Indiana Jones and the Last Crusade', 1989, 4, 1, 127, 8.2);  


-- Insert Film_Actors (ensure Film_ID and Actor_ID exist)
INSERT INTO Film_Actors (Film_ID, Actor_ID, Role) VALUES 
(1, 2, 'Dr. Brand'), 
(1, 3, 'Cooper'), 
(2, 3, 'Frank Costello'), 
(2, 4, 'Madolyn'), 
(3, 1, 'Jack Dawson'), 
(3, 4, 'Rose DeWitt Bukater');

-- Insert Reviews (ensure Film_ID and User_ID exist)
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment) VALUES 
(1, 1, 10, 'Amazing visuals and story!'), 
(2, 2, 9, 'A crime thriller masterpiece.'), 
(3, 3, 8, 'Classic love story.');
