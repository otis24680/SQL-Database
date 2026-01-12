
-- 1. ANALYTICKÁ FUNKCE RANK()
-- Seřadí filmy podle hodnocení (Rating) uvnitř každého žánru (Genre_ID).

SELECT 
    Title, 
    Genre_ID, 
    Rating,
    RANK() OVER (PARTITION BY Genre_ID ORDER BY Rating DESC) as Rank_In_Genre -- Funkce RANK() přidělí pořadí. PARTITION BY resetuje počítání pro každý žánr.
FROM Films
WHERE Rating IS NOT NULL;


-- 2. REKURZE 
-- Vyhledá celou sérii filmů 
WITH RECURSIVE FilmSeries AS (
    -- první film
    SELECT Film_ID, Title, Sequel_To_Film_ID, 1 as Series_Order
    FROM Films
    WHERE Title = 'Alien'
    
    UNION ALL
    
    -- Připojíme filmy, které jsou pokračováním těch, co už máme
    SELECT child.Film_ID, child.Title, child.Sequel_To_Film_ID, parent.Series_Order + 1
    FROM Films child
    INNER JOIN FilmSeries parent ON child.Sequel_To_Film_ID = parent.Film_ID
)
SELECT * FROM FilmSeries;


-- 3. VNOŘENÝ SELECT (Subquery)
-- hodnocení je vyšší než celkový průměr všech filmů.
SELECT Title, Rating 
FROM Films 
WHERE Rating > (SELECT AVG(Rating) FROM Films);


-- 4. VÝPOČET PRŮMĚR ZÁZNAMŮ NA TABULKU
SELECT AVG(n_live_tup) AS Avg_Rows_Per_Table 
FROM pg_stat_user_tables;