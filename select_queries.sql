-- list all films with their genres and directors
SELECT Films.Title, Genres.Genre_Name, Directors.Name AS Director  
FROM Films  
INNER JOIN Genres ON Films.Genre_ID = Genres.Genre_ID  
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID;


-- list all films along with their actors
SELECT Films.Title, Actors.Name AS Actor, Film_Actors.Role  
FROM Film_Actors  
INNER JOIN Films ON Film_Actors.Film_ID = Films.Film_ID  
INNER JOIN Actors ON Film_Actors.Actor_ID = Actors.Actor_ID;

-- list all reviews with the reviewers username and film title
SELECT Users.Username, Films.Title, Reviews.Rating, Reviews.Comment  
FROM Reviews  
INNER JOIN Users ON Reviews.User_ID = Users.User_ID  
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID;

--show all films, even if they dont have reviews (left join)
SELECT Films.Title, Reviews.Rating, Reviews.Comment  
FROM Films  
LEFT JOIN Reviews ON Films.Film_ID = Reviews.Film_ID;


