-- 1. Přehled filmů a režisérů se spojeným jménem
CREATE OR REPLACE VIEW film_director_summary AS
SELECT 
    Films.Title,  
    Directors.First_Name || ' ' || Directors.Last_Name AS Director  -- spojíme jméno a příjmení
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID;

-- 2. Přehled filmů, herců a jejich rolí
CREATE OR REPLACE VIEW film_actor_summary AS
SELECT 
    Films.Title AS Film_Title,
    Actors.First_Name || ' ' || Actors.Last_Name AS Actor_Name,     -- spojíme jméno a příjmení
    Film_Actors.Role
FROM Film_Actors
INNER JOIN Films ON Film_Actors.Film_ID = Films.Film_ID
INNER JOIN Actors ON Film_Actors.Actor_ID = Actors.Actor_ID;

-- 3. Průměrné hodnocení každého filmu
CREATE VIEW film_rating_avg AS
SELECT 
    Films.Title,                        -- název filmu
    AVG(Reviews.Rating) AS Avg_Rating  -- průměrné hodnocení
FROM Reviews
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID  -- spojení recenze s filmem
GROUP BY Films.Title;                                -- skupinování podle názvu

-- 4. Počet recenzí a poslední recenze u každého filmu
CREATE VIEW film_review_stats AS
SELECT 
    Films.Title,                               -- název filmu
    COUNT(Reviews.Review_ID) AS Review_Count,  -- počet recenzí
    MAX(Reviews.Review_Date) AS Last_Review    -- datum poslední recenze
FROM Reviews
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID -- spojení s filmem
GROUP BY Films.Title;                             -- skupinování podle filmu


-- 5. Vytvoření pohledu pro uživatelské recenze
CREATE VIEW user_reviews_summary AS --virtuální tabulka
SELECT --vybereme jméno recenzenta, název filmu, rating, komentář a datum receze
    Users.Username, 
    Films.Title AS Film_Title, 
    Reviews.Rating, 
    Reviews.Comment, 
    Reviews.Review_Date
FROM Reviews
INNER JOIN Users ON Reviews.User_ID = Users.User_ID --spojíme recenzi s uživately
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID; --přiřadíme film k recenzi


CREATE VIEW film_directors_sorted AS
SELECT 
    Films.Title,                         -- název filmu
    Directors.Name AS Director           -- jméno režiséra
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID
ORDER BY Directors.Name ASC;            -- řazení podle jména režiséra vzestupně
