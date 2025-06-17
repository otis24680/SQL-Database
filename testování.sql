DROP INDEX IF EXISTS idx_films_rating;
DROP INDEX IF EXISTS idx_films_genre;

-- 1) Ukázka dopadu INDEXU na WHERE
-- bez indexu = planning time 0.187, execution time 0.045 <-- sequential scan
EXPLAIN ANALYZE
SELECT Title
FROM Films
WHERE Rating > 8.0;                                 

-- vytvoření indexu = planning time 0.139, execution time 0.023 <-- btree index scan
CREATE INDEX idx_films_rating ON Films(Rating);
EXPLAIN ANALYZE
SELECT Title    
FROM Films
WHERE Rating > 8.0;    -- místo celého prohledávání tabulky se prohledají jenom hodnoty > 8.0                             

-- 2) Ukázka dopadu INDEXU na JOIN
-- bez dodatečného indexu na Genre_ID = planning time 0.555, execution time 0.093 <-- hash join
EXPLAIN ANALYZE
SELECT f.Title, g.Genre_Name
FROM Films f
INNER JOIN Genres g ON f.Genre_ID = g.Genre_ID;     -- spojení filmů s žánry

-- vytvoření indexu = planning time 0.115, execution time 0.036
CREATE INDEX idx_films_genre ON Films(Genre_ID);
-- SET enable_hashjoin = off; <-- výrazně delší časy?? tak proč je rychlost o tolik menší, když to jsou stejné joiny
-- Index idx_films_genre je typu B-tree (standardní typ pro CREATE INDEX v PostgreSQL)
EXPLAIN (ANALYZE, VERBOSE)
SELECT f.Title, g.Genre_Name
FROM Films f
INNER JOIN Genres g ON f.Genre_ID = g.Genre_ID;     

-- 3) Porovnání JOIN algoritmů
-- Hash Join = planning time 0.481, execution time 0.123
-- Vytvoří hash tabulku z menší strany (Genres) a pak prohledává Films
SET enable_mergejoin = off;
SET enable_nestloop   = off;

EXPLAIN ANALYZE
SELECT f.Title, g.Genre_Name
FROM Films f
INNER JOIN Genres g ON f.Genre_ID = g.Genre_ID;

-- Merge Join = planning time 0.665, execution time 0.143
-- Potřebuje seřazené vstupy (řazení nebo indexy) a pak je “prohází” paralelně
SET enable_hashjoin   = off;
SET enable_nestloop   = off;
SET enable_mergejoin  = on;

EXPLAIN ANALYZE
SELECT f.Title, g.Genre_Name
FROM Films f
INNER JOIN Genres g ON f.Genre_ID = g.Genre_ID;

