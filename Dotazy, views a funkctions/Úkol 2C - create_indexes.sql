
-- Úkol 2a: Zajištění, že nemohou existovat dva filmy se stejným názvem ve stejném roce.
CREATE UNIQUE INDEX idx_films_title_year_unique 
ON Films (Title, Release_Year);

-- Úkol 2b: Fulltextový index (Full-Text Search Index) --> Umožní efektivní vyhledávání slov v komentářích recenzí.
CREATE INDEX idx_reviews_comment_fulltext 
ON Reviews USING GIN (to_tsvector('english', Comment)); -- 'GIN' a funkci to_tsvector. Text rozdělí na klíčová slova.