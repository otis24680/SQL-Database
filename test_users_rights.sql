-- Testování práv uživatele pepa_kritik

-- Pokus o připojení jako pepa_kritik a spuštění dotazů

-- Tento soubor spustit jako admin pro testování

-- Nejprve ověření, že role a uživatel existují
SELECT rolname FROM pg_roles WHERE rolname IN ('app_reader', 'pepa_kritik');

-- Ověření práv
SELECT grantee, privilege_type, table_name
FROM information_schema.table_privileges
WHERE grantee = 'pepa_kritik';

-- Test SELECT na všechny tabulky (jako app_reader)
-- SELECT COUNT(*) FROM films;
-- SELECT COUNT(*) FROM reviews;

-- Test INSERT do reviews (jako pepa_kritik)
-- INSERT INTO reviews (film_id, user_id, rating, review_text, review_date)
-- VALUES (1, 1, 5, 'Test review', CURRENT_DATE);

-- Test UPDATE na reviews
-- UPDATE reviews SET review_text = 'Updated test review' WHERE review_id = (SELECT MAX(review_id) FROM reviews);