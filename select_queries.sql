-- 1. Filmy s žánrem a režisérem
SELECT Films.Title, Genres.Genre_Name, Directors.Name AS Director  
FROM Films  
INNER JOIN Genres ON Films.Genre_ID = Genres.Genre_ID  
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID;

-- 2. Filmy s herci a jejich rolí
SELECT Films.Title, Actors.Name AS Actor, Film_Actors.Role  
FROM Film_Actors  
INNER JOIN Films ON Film_Actors.Film_ID = Films.Film_ID  
INNER JOIN Actors ON Film_Actors.Actor_ID = Actors.Actor_ID;

-- 3. Recenze s uživatelským jménem a filmem
SELECT Users.Username, Films.Title, Reviews.Rating, Reviews.Comment  
FROM Reviews  
INNER JOIN Users ON Reviews.User_ID = Users.User_ID  
INNER JOIN Films ON Reviews.Film_ID = Films.Film_ID;

-- 4. Všechny filmy i bez recenzí
SELECT Films.Title, Reviews.Rating, Reviews.Comment  
FROM Films  
LEFT JOIN Reviews ON Films.Film_ID = Reviews.Film_ID; --všechny filmy, a pokud existuje recenze, tak ji přidá

-- 5. Filmy Martina Scorseseho, seřazené podle hodnocení
SELECT Films.Title, Films.Release_Year, Films.Rating --zobrazíme si název, rok vydání a hodnocení filmu
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID --přiřadíme řežiséra
WHERE Directors.Name = 'Martin Scorsese' --ale pouze ty, které režíroval scorsese
ORDER BY Films.Rating DESC; --desc sestupně, asc vzestupně  

-- 6. Počet filmů podle žánru, pokud jich je alespoň 5
SELECT Genres.Genre_Name, COUNT(Films.Film_ID) AS Film_Count --spočítá počet filmů
FROM Films --vybíráme z films
INNER JOIN Genres ON Films.Genre_ID = Genres.Genre_ID --každému filmu přiřádíme název řádku (pokud mají platný genreID)
GROUP BY Genres.Genre_Name --dá dohromady filmy se stejným žánrem
HAVING COUNT(Films.Film_ID) >= 5
ORDER BY Film_Count DESC; --sestupně

