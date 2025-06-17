-- 1. Filmy s žánrem a režisérem
SELECT 
  Films.Title,  
  Genres.Genre_Name,  
  Directors.First_Name || ' ' || Directors.Last_Name AS Director  -- spojíme jméno a příjmení
FROM Films  
INNER JOIN Genres   ON Films.Genre_ID    = Genres.Genre_ID  
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID;

-- 2. Filmy s herci a jejich rolí
SELECT 
  Films.Title,  
  Actors.First_Name || ' ' || Actors.Last_Name AS Actor,  -- spojíme jméno a příjmení
  Film_Actors.Role  
FROM Film_Actors  
INNER JOIN Films  ON Film_Actors.Film_ID  = Films.Film_ID  
INNER JOIN Actors ON Film_Actors.Actor_ID = Actors.Actor_ID;

-- 3. Recenze s uživatelským jménem a filmem
SELECT 
  Users.Username, 
  Films.Title, 
  Reviews.Rating, 
  Reviews.Comment  
FROM Reviews  
INNER JOIN Users  ON Reviews.User_ID = Users.User_ID  
INNER JOIN Films  ON Reviews.Film_ID = Films.Film_ID;

-- 4. Všechny filmy i bez recenzí
SELECT 
  Films.Title, 
  Reviews.Rating, 
  Reviews.Comment  
FROM Films  
LEFT JOIN Reviews ON Films.Film_ID = Reviews.Film_ID;  -- všechny filmy, recenze pokud existuje

-- 5. Filmy Martina Scorseseho, seřazené podle hodnocení
SELECT 
  Films.Title, 
  Films.Release_Year, 
  Films.Rating  -- název, rok, hodnocení
FROM Films
INNER JOIN Directors ON Films.Director_ID = Directors.Director_ID  -- přiřadíme režiséra
WHERE 
  Directors.First_Name = 'Martin' 
  AND Directors.Last_Name = 'Scorsese'  -- jen Martin Scorsese
ORDER BY Films.Rating DESC;  -- sestupně podle hodnocení

-- 6. Počet filmů podle žánru, pokud jich je alespoň 5
SELECT 
  Genres.Genre_Name, 
  COUNT(Films.Film_ID) AS Film_Count  -- spočítá filmy
FROM Films  
INNER JOIN Genres ON Films.Genre_ID = Genres.Genre_ID  -- přiřadí žánr
GROUP BY Genres.Genre_Name  -- seskupí podle žánru
HAVING COUNT(Films.Film_ID) >= 5  -- jen žánry s 5+ filmy
ORDER BY Film_Count DESC;  -- sestupně podle počtu

-- Vztahy:
-- Genres → Films      : zero n (žánr může mít 0–N filmů)        / one only (film musí mít právě jeden žánr)
-- Directors → Films   : zero n (režisér může mít 0–N filmů)      / one only (film má právě jednoho režiséra)
-- Films → Film_Actors : one only (záznam musí patřit k filmu)   / zero n (film může mít 0–N herců)
-- Actors → Film_Actors: zero n (herec může hrát 0–N filmů)      / one only (záznam musí patřit k herci)
-- Films → Reviews     : zero n (film může mít 0–N recenzí)      / one only (recenze patří jednomu filmu)
-- Users → Reviews     : zero n (uživatel může napsat 0–N recenzí)/ one only (recenze má jednoho autora)
