-- Úkol 1: Dotaz na pokračování filmů --> REKURZE
SELECT 
    f1.Title AS Film, 
    f2.Title AS Sequel_To 
FROM Films f1
INNER JOIN Films f2 ON f1.Sequel_To_Film_ID = f2.Film_ID;