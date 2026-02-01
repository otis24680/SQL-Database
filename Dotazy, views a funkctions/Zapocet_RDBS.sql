-- Úkol 2A: Dotaz na pokračování filmů --> REKURZE

SELECT 
    f1.Title AS Film, 
    f2.Title AS Sequel_To 
FROM Films f1
INNER JOIN Films f2 ON f1.Sequel_To_Film_ID = f2.Film_ID;


-- 2B: Zajištění unikátnosti názvu filmu v daném roce a fulltextový index na komentáře recenzí


INSERT INTO Films (Title, Release_Year, Genre_ID, Director_ID, Duration, Rating) 
VALUES ('Titanic', 1997, 3, 2, 195, 7.9)
--ON CONFLICT (Title, Release_Year) DO NOTHING; -- Ignoruje duplicitní vložení

SELECT Comment 
FROM Reviews 
WHERE to_tsvector('english', Comment) @@ to_tsquery('english', 'zklamání');

-- SELECT Comment 
-- FROM Reviews 
-- WHERE to_tsvector('simple', Comment) @@ to_tsquery('simple', 'zklamání'); <-- asi bude lepší kvůli diakritice, ale z nějakého důvodu english zvládá diakritiku taky





-- Úkol 2D: Vytvoření funkce pro hodnocení filmu na základě recenzí
SELECT Title, get_film_verdict(Film_ID) as Verdict
FROM Films
WHERE Title IN ('Interstellar', 'Titanic', 'Gladiator', 'True Lies');







-- Úkol 2E: Vytvoření procedury s kurzorem, transakcí a ošetřením chyb
-- zavoláme a otevřeme
CALL generate_genre_report();
SELECT * FROM Genre_Reports;





-- Úkol 2F: Triggery pro auditování změn v tabulce Films
-- 1. Podíváme se na nějakou existující recenzi (např. Review_ID = 1)
SELECT * FROM Reviews WHERE Review_ID = 3;

-- 2. Změníme jí hodnocení (např. z 9 na 5)
UPDATE Reviews 
SET Rating = 5 
WHERE Review_ID = 3;

-- 3. Podíváme se do Audit tabulky, jestli to trigger zachytil
SELECT * FROM Reviews_Audit;