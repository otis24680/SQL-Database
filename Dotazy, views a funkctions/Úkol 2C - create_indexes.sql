
-- Úkol 2C1: Zajištění, že nemohou existovat dva filmy se stejným názvem ve stejném roce.
    CREATE UNIQUE INDEX idx_films_title_year_unique 
    ON Films (Title, Release_Year);

-- Úkol 2C2: Fulltextový index (Full-Text Search Index) --> Umožní efektivní vyhledávání slov v komentářích recenzí.
CREATE INDEX idx_reviews_comment_fulltext 
ON Reviews USING GIN (to_tsvector('english', Comment)); -- 'GIN' a funkci to_tsvector. Text rozdělí na klíčová slova.

SELECT Comment 
FROM Reviews 
WHERE to_tsvector('english', Comment) @@ to_tsquery('english', 'zklamání');

-- SELECT Comment 
-- FROM Reviews 
-- WHERE to_tsvector('simple', Comment) @@ to_tsquery('simple', 'zklamání'); <-- asi bude lepší kvůli diakritice, ale z nějakého důvodu english zvládá diakritiku taky


