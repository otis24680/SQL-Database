-- Úkol 1: Struktura --> ROPOJENÍ POKRAČOVÁNÍ FILMŮ (REKURZE)

-- 1. Alien -> Aliens
UPDATE Films 
SET Sequel_To_Film_ID = (SELECT Film_ID FROM Films WHERE Title = 'Alien') 
WHERE Title = 'Aliens';


-- Úkol 2A: Dotaz na pokračování filmů --> REKURZE

SELECT 
    f1.Title AS Film, 
    f2.Title AS Sequel_To 
FROM Films f1
INNER JOIN Films f2 ON f1.Sequel_To_Film_ID = f2.Film_ID;