-- Úkol 1: Struktura --> ROPOJENÍ POKRAČOVÁNÍ FILMŮ (REKURZE)

-- 1. Alien -> Aliens
UPDATE Films 
SET Sequel_To_Film_ID = (SELECT Film_ID FROM Films WHERE Title = 'Alien') 
WHERE Title = 'Aliens';