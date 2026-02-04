CREATE OR REPLACE VIEW film_full_info AS
SELECT 
    f.Title AS Film_Title,
    f.Release_Year,
    d.First_Name || ' ' || d.Last_Name AS Director,
    a.First_Name || ' ' || a.Last_Name AS Actor,
    fa.Role
FROM Films f
LEFT JOIN Directors d ON f.Director_ID = d.Director_ID
INNER JOIN Film_Actors fa ON f.Film_ID = fa.Film_ID
RIGHT JOIN Actors a ON fa.Actor_ID = a.Actor_ID;


SELECT * FROM film_full_info


