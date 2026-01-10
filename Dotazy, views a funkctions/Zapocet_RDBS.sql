-- Úkol 1: Dotaz na pokračování filmů --> REKURZE

SELECT 
    f1.Title AS Film, 
    f2.Title AS Sequel_To 
FROM Films f1
INNER JOIN Films f2 ON f1.Sequel_To_Film_ID = f2.Film_ID;



-- Úkol 2: Zajištění unikátnosti názvu filmu v daném roce a fulltextový index na komentáře recenzí

INSERT INTO Films (Title, Release_Year, Genre_ID, Director_ID, Duration, Rating) 
VALUES ('Titanic', 1997, 3, 2, 195, 7.9); -- dostali jsem chybu duplikátu. Funguje.

SELECT Comment 
FROM Reviews 
WHERE to_tsvector('english', Comment) @@ to_tsquery('english', 'zklamání'); -- Správně vyhledalo recenze





-- Úkol 4: Vytvoření funkce pro hodnocení filmu na základě recenzí
SELECT Title, get_film_verdict(Film_ID) as Verdict
FROM Films
WHERE Title IN ('Interstellar', 'Titanic', 'Gladiator', 'True Lies');







-- Úkol 5: Vytvoření procedury s kurzorem, transakcí a ošetřením chyb
-- 1. Spustíme proceduru 
CALL generate_genre_report();

-- 2. Podíváme se, co vytvořila v nové tabulce
SELECT * FROM Genre_Reports;