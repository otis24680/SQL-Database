-- Úkol 5: Vytvoření procedury s kurzorem, transakcí a ošetřením chyb

-- 1. Pomocná tabulka
CREATE TABLE IF NOT EXISTS Genre_Reports (
    Report_ID SERIAL PRIMARY KEY,
    Genre_Name VARCHAR(50),
    Avg_Rating DECIMAL(5,2),
    Report_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Procedura
CREATE OR REPLACE PROCEDURE generate_genre_report()
LANGUAGE plpgsql
AS $$
DECLARE
    cur_genres CURSOR FOR SELECT Genre_ID, Genre_Name FROM Genres;
    v_genre_id INT;
    v_genre_name VARCHAR;
    v_avg DECIMAL;
BEGIN
    OPEN cur_genres;

    LOOP
        FETCH cur_genres INTO v_genre_id, v_genre_name;
        EXIT WHEN NOT FOUND;

        -- Začátek bloku pro práci s daty a odchytávání chyb
        BEGIN
            -- Výpočet
            SELECT AVG(Rating) INTO v_avg FROM Films WHERE Genre_ID = v_genre_id;
            
            -- Ošetření NULL
            IF v_avg IS NULL THEN v_avg := 0; END IF;

            -- Vložení do tabulky
            INSERT INTO Genre_Reports (Genre_Name, Avg_Rating) 
            VALUES (v_genre_name, v_avg);
            
          

        EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Chyba u žánru %: %', v_genre_name, SQLERRM;
        END; 

        
        -- COMMIT; -- i přesto, že je v zadání, že se má použít transakce, tak sqltools si poradí pouze z autocommit režimem
        
    END LOOP;

    CLOSE cur_genres;
END;
$$;