-- Úkol 2H: Práce s uživateli a rolemi

-- 1. Vytvoření ROLE a UŽIVATELE
DROP ROLE IF EXISTS app_reader;
CREATE ROLE app_reader;

-- Práva pro roli: připojit se a číst všechna data v public schématu
GRANT CONNECT ON DATABASE film_database TO app_reader;
GRANT USAGE ON SCHEMA public TO app_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;

DROP USER IF EXISTS pepa_kritik;
CREATE USER pepa_kritik WITH PASSWORD 'tajne_heslo_123';

-- Přiřazení role a dalších práv uživateli
GRANT app_reader TO pepa_kritik; -- Dědí práva role app_reader
GRANT INSERT ON Reviews TO pepa_kritik; -- Může psát recenze
GRANT UPDATE ON Reviews TO pepa_kritik; -- Může opravovat své recenze

-- 2. Ukázka přihlášení jako nový uživatel 
-- Ověření dostupnosti databází z pohledu uživatele:
-- SELECT datname FROM pg_database WHERE datistemplate = false;

-- ověření práv: SELECT * FROM information_schema.table_privileges WHERE grantee = 'pepa_kritik';



-- 3. Ukázka ZAMYKÁNÍ (LOCK TABLE) – demonstrace transakce
BEGIN; -- Začátek transakce
    LOCK TABLE Reviews IN SHARE MODE;  -- Zamknutí tabulky pro čtení
    SELECT COUNT(*) FROM Reviews;
COMMIT; -- Odemčení

-- 4. Odstranění ROLE a UŽIVATELE (ukázka DROP)
DROP USER IF EXISTS pepa_kritik; -- Odstranění uživatele
DROP ROLE IF EXISTS app_reader; -- Odstranění role