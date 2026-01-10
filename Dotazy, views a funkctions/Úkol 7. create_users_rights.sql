-- 1. Vytvoření ROLE 
-- Vytvoříme roli 'app_reader', která může jen číst data (pro běžné návštěvníky)
DROP ROLE IF EXISTS app_reader;
CREATE ROLE app_reader;

-- právo připojit se a číst všechna data v public schématu
GRANT CONNECT ON DATABASE film_database TO app_reader;
GRANT USAGE ON SCHEMA public TO app_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;


-- 2. Vytvoření UŽIVATELE (Konkrétní osoba)
-- Vytvoříme uživatele 'pepa_kritik' s heslem
DROP USER IF EXISTS pepa_kritik;
CREATE USER pepa_kritik WITH PASSWORD 'tajne_heslo_123';

-- Pepa bude mít práva čtenáře, ALE navíc může vkládat nové recenze
GRANT app_reader TO pepa_kritik; -- Dědí práva role app_reader
GRANT INSERT ON Reviews TO pepa_kritik; -- Může psát recenze
GRANT UPDATE ON Reviews TO pepa_kritik; -- Může opravovat své recenze


-- 3. Ukázka ZAMYKÁNÍ (LOCK TABLE) 
-- Představte si, že děláte roční uzávěrku a nechcete, aby vám tam někdo vkládal data.
-- Zamkneme tabulku Reviews jen pro čtení (ostatní musí počkat).

BEGIN; -- Začátek transakce
    LOCK TABLE Reviews IN SHARE MODE; 
    -- Nyní nikdo jiný nemůže provést INSERT/UPDATE/DELETE do Reviews,
    -- dokud tuto transakci neukončíme (COMMIT nebo ROLLBACK).
    -- Můžeme si v klidu udělat statistiku...
    SELECT COUNT(*) FROM Reviews;
COMMIT; -- Konec transakce, tabulka se odemkne.