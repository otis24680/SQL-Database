-- 1. Přehled filmů a jejich režisérů
CREATE OR REPLACE VIEW film_director_summary AS
SELECT 
    Films.Title,  
    Films.Release_Year,  
    Directors.First_Name || ' ' || Directors.Last_Name AS Director  -- spojíme jméno a příjmení
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID;

-- 2. Filmy s herci a jejich rolemi
CREATE OR REPLACE VIEW film_actor_summary AS
SELECT 
    Films.Title AS Film_Title,  
    Actors.First_Name || ' ' || Actors.Last_Name AS Actor_Name,  -- spojíme jméno a příjmení
    Film_Actors.Role            
FROM Film_Actors
INNER JOIN Films ON Film_Actors.Film_ID = Films.Film_ID  
INNER JOIN Actors ON Film_Actors.Actor_ID = Actors.Actor_ID;

-- 3. Průměrné hodnocení každého filmu
CREATE OR REPLACE VIEW film_rating_avg AS
SELECT 
    Films.Title,                        
    AVG(Reviews.Rating) AS Avg_Rating  
FROM Reviews
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID  
GROUP BY Films.Title;

-- 4. Počet recenzí a poslední recenze u každého filmu
CREATE OR REPLACE VIEW film_review_stats AS
SELECT 
    Films.Title,                               
    COUNT(Reviews.Review_ID) AS Review_Count,  
    MAX(Reviews.Review_Date) AS Last_Review    
FROM Reviews
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID 
GROUP BY Films.Title;

-- 5. Přehled uživatelských recenzí
CREATE OR REPLACE VIEW user_reviews_summary AS
SELECT 
    Users.Username, 
    Films.Title AS Film_Title, 
    Reviews.Rating, 
    Reviews.Comment, 
    Reviews.Review_Date
FROM Reviews
INNER JOIN Users ON Reviews.User_ID = Users.User_ID  
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID;

-- 6. Filmy řazené podle jména režiséra
CREATE OR REPLACE VIEW film_directors_sorted AS
SELECT 
    Films.Title,                         
    Directors.First_Name || ' ' || Directors.Last_Name AS Director  -- spojíme jméno a příjmení
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID
ORDER BY Directors.Last_Name ASC, Directors.First_Name ASC;        -- řazení podle příjmení/vzestupně
