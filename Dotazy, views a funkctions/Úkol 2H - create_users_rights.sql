
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

-- Nastavení základních práv pro roli app_reader
GRANT CONNECT ON DATABASE film_database TO app_reader;
GRANT USAGE ON SCHEMA public TO app_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;

-- Specifická práva pro recenzenty (role app_reader)
GRANT INSERT, UPDATE, DELETE ON Reviews TO app_reader;
GRANT USAGE ON SEQUENCE reviews_review_id_seq TO app_reader;
GRANT INSERT ON Users TO app_reader;
GRANT USAGE ON SEQUENCE users_user_id_seq TO app_reader;

-- Row-Level Security: Uživatelé s rolí app_reader mohou mazat/upravovat pouze své vlastní recenze
ALTER TABLE Reviews ENABLE ROW LEVEL SECURITY;

-- Politika pro DELETE - umožní mazat pouze recenze, kde User_ID odpovídá username v tabulce Users
CREATE POLICY delete_own_reviews ON Reviews
    FOR DELETE
    TO app_reader
    USING (User_ID = (SELECT User_ID FROM Users WHERE Username = current_user));

-- Politika pro UPDATE - umožní upravovat pouze vlastní recenze
CREATE POLICY update_own_reviews ON Reviews
    FOR UPDATE
    TO app_reader
    USING (User_ID = (SELECT User_ID FROM Users WHERE Username = current_user));

-- Politika pro SELECT - app_reader může vidět všechny recenze
CREATE POLICY select_all_reviews ON Reviews
    FOR SELECT
    TO app_reader
    USING (true);

-- Politika pro INSERT - app_reader může vkládat recenze
CREATE POLICY insert_reviews ON Reviews
    FOR INSERT
    TO app_reader
    WITH CHECK (true);


-- 3. SPLNĚNÍ BODU: vytvořit účet uživatele 
CREATE USER pepa_kritik WITH PASSWORD 'tajne_heslo_123';

-- Přiřazení role (tím dostane všechna práva app_reader)
GRANT app_reader TO pepa_kritik;


-- 4. SPLNĚNÍ BODU: přihlásit a ověřit dostupnost databází

-- 4a. Nejprve vytvoříme záznam uživatele v tabulce Users (musíme přidat jako admin)
INSERT INTO Users (Username, Email)
VALUES ('pepa_kritik', 'pepa@kritik.cz')
ON CONFLICT (Username) DO NOTHING;


SET ROLE pepa_kritik;

-- Ověření, kdo jsem a co vidím
SELECT 
    current_user AS "Přihlášený uživatel",
    current_database() AS "Aktuální databáze";

-- Test čtení 
SELECT Title, Release_Year, Rating FROM Films LIMIT 3;

-- 4b. Test zápisu 
SET ROLE pepa_kritik;
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment) 
VALUES (10, (SELECT User_ID FROM Users WHERE Username = 'pepa_kritik'), 9, 'Recenze od Pepy: Funguje to!');

-- 5. Ověření zápisu 
SET ROLE pepa_kritik;
SELECT r.*, u.Username 
FROM Reviews r 
JOIN Users u ON r.User_ID = u.User_ID 
WHERE u.Username = 'pepa_kritik' AND r.Comment = 'Recenze od Pepy: Funguje to!';

-- 6. Test mazání (Mělo by selhat s chybou "permission denied")
SET ROLE pepa_kritik;
DELETE FROM Films WHERE Film_ID = 1;
RESET ROLE;

-- 7. Test mazání cizí recenze (Mělo by selhat díky RLS - žádný řádek nebude smazán)
SET ROLE pepa_kritik;

-- Nejprve zjistíme, kolik je celkem cizích recenzí před pokusem o smazání
SELECT COUNT(*) AS "Počet cizích recenzí před pokusem"
FROM Reviews 
WHERE User_ID != (SELECT User_ID FROM Users WHERE Username = 'pepa_kritik');

-- Pokusíme se smazat recenzi jiného uživatele
SET ROLE pepa_kritik;
DELETE FROM Reviews 
WHERE Review_ID IN (
    SELECT Review_ID 
    FROM Reviews 
    WHERE User_ID != (SELECT User_ID FROM Users WHERE Username = 'pepa_kritik')
    LIMIT 1
);

-- Ověříme, že nebyla smazána žádná cizí recenze (počet by měl být stejný jako před pokusem)
SET ROLE pepa_kritik;
SELECT COUNT(*) AS "Počet cizích recenzí po pokusu"
FROM Reviews 
WHERE User_ID != (SELECT User_ID FROM Users WHERE Username = 'pepa_kritik');
RESET ROLE;

-- 8. Test mazání vlastních recenzí (Mělo by fungovat - pepa má právo DELETE na své recenze)
SET ROLE pepa_kritik;
-- Nejprve ověříme, kolik má pepa recenzí
SELECT COUNT(*) AS "Počet Pepiných recenzí před smazáním"
FROM Reviews r
JOIN Users u ON r.User_ID = u.User_ID
WHERE u.Username = 'pepa_kritik';

-- Smažeme vlastní recenze
SET ROLE pepa_kritik;
DELETE FROM Reviews 
WHERE User_ID = (SELECT User_ID FROM Users WHERE Username = 'pepa_kritik');

-- Ověříme, že byly smazány
SET ROLE pepa_kritik;
SELECT COUNT(*) AS "Počet Pepiných recenzí po smazání"
FROM Reviews r
JOIN Users u ON r.User_ID = u.User_ID
WHERE u.Username = 'pepa_kritik';

RESET ROLE;
