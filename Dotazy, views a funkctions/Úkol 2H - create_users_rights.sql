
-- 1. ÚKLID 
DO $$
BEGIN
    -- Pokud uživatel existuje, vyčistíme po něm
    IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'pepa_kritik') THEN
        -- Změna zde: 'postgres' nahrazeno za 'admin'
        REASSIGN OWNED BY pepa_kritik TO admin; 
        DROP OWNED BY pepa_kritik;
    END IF;
END $$;

DROP USER IF EXISTS pepa_kritik;

-- To samé pro roli
DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'app_reader') THEN
        DROP OWNED BY app_reader;
    END IF;
END $$;

DROP ROLE IF EXISTS app_reader;


-- 2. SPLNĚNÍ BODU: Umět vytvořit roli 
CREATE ROLE app_reader;

-- Nastavení základních práv pro roli
GRANT CONNECT ON DATABASE film_database TO app_reader;
GRANT USAGE ON SCHEMA public TO app_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;


-- 3. SPLNĚNÍ BODU: vytvořit účet uživatele 
CREATE USER pepa_kritik WITH PASSWORD 'tajne_heslo_123';

-- Přiřazení role 
GRANT app_reader TO pepa_kritik;

-- Přidání specifických práv pro Pepu
GRANT INSERT, UPDATE ON Reviews TO pepa_kritik;
GRANT USAGE ON SEQUENCE reviews_review_id_seq TO pepa_kritik;


-- 4. SPLNĚNÍ BODU: přihlásit a ověřit dostupnost databází
SET ROLE pepa_kritik;
SELECT 
    current_user AS "Přihlášený uživatel",
    datname AS "Viditelná databáze"
FROM pg_database 
WHERE datistemplate = false;

-- 2. Ověření, kdo jsem a co vidím (Mělo by vypsat "pepa_kritik" a "film_database")
SELECT current_user, datname FROM pg_database WHERE datistemplate = false;

-- 3. Test čtení (Mělo by vypsat filmy)
SELECT Title, Release_Year, Rating FROM Films LIMIT 3;

-- 4. Test zápisu (Mělo by vložit recenzi - úspěch)
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment) VALUES (1, 1, 9, 'Recenze od Pepy: Funguje to!');

-- 5. Ověření zápisu (Mělo by najít tu novou recenzi)
SELECT * FROM Reviews WHERE Comment = 'Recenze od Pepy: Funguje to!';

-- 6. Test mazání (Mělo by selhat s chybou "permission denied")
DELETE FROM Films WHERE Film_ID = 1;

-- Návrat zpět do role administrátora
RESET ROLE;


-- =================================================================
-- ÚKOL I: LOCK (Zamykání tabulek)
-- =================================================================

BEGIN;
    LOCK TABLE Reviews IN SHARE MODE;
    SELECT COUNT(*) as pocet_recenzi_pri_zamku FROM Reviews;
COMMIT;