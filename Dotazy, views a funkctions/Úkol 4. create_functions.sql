
-- Úkol 4: Vytvoření funkce pro hodnocení filmu na základě recenzí
CREATE OR REPLACE FUNCTION get_film_verdict(p_film_id INT) 
RETURNS VARCHAR AS $$
DECLARE
    v_avg_score DECIMAL(5,2); -- Proměnná pro uložení průměru
    v_verdict VARCHAR(50);    -- Proměnná pro výsledný text
BEGIN
    -- 1. Spočítáme průměrné hodnocení z tabulky Reviews pro dané ID
    SELECT AVG(Rating) INTO v_avg_score
    FROM Reviews
    WHERE Film_ID = p_film_id;

    -- 2. Ošetření situace, kdy film nemá žádné recenze
    IF v_avg_score IS NULL THEN
        RETURN 'No Reviews Yet 🤷‍♂️';
    END IF;

    -- 3. Rozhodovací logika
    IF v_avg_score >= 8.0 THEN
        v_verdict := 'Masterpiece 🏆 (' || ROUND(v_avg_score, 1) || ')';
    ELSIF v_avg_score >= 5.0 THEN
        v_verdict := 'Solid Movie 👍 (' || ROUND(v_avg_score, 1) || ')';
    ELSE
        v_verdict := 'Waste of Time 👎 (' || ROUND(v_avg_score, 1) || ')';
    END IF;

    -- 4. Vrácení výsledku
    RETURN v_verdict;
END;
$$ LANGUAGE plpgsql;