-- 1. Vytvoření ROLE 
DROP ROLE IF EXISTS app_reader;
CREATE ROLE app_reader;

-- právo připojit se a číst všechna data v public schématu
GRANT CONNECT ON DATABASE film_database TO app_reader;
GRANT USAGE ON SCHEMA public TO app_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;


-- 2. Vytvoření UŽIVATELE (Konkrétní osoba)
DROP USER IF EXISTS pepa_kritik;
CREATE USER pepa_kritik WITH PASSWORD 'tajne_heslo_123';


GRANT app_reader TO pepa_kritik; -- Dědí práva role app_reader
GRANT INSERT ON Reviews TO pepa_kritik; -- Může psát recenze
GRANT UPDATE ON Reviews TO pepa_kritik; -- Může opravovat své recenze


-- 3. Ukázka ZAMYKÁNÍ (LOCK TABLE) 
BEGIN; -- Začátek transakce  
    LOCK TABLE Reviews IN SHARE MODE;  --Úkol 2I - Zamknutí tabulky pro čtení
    SELECT COUNT(*) FROM Reviews;
COMMIT; --odemčení