-- 1. Tabulka pro historii změn 
CREATE TABLE IF NOT EXISTS Reviews_Audit (
    Audit_ID SERIAL PRIMARY KEY,
    Review_ID INT,
    Old_Rating INT,
    New_Rating INT,
    Changed_By VARCHAR(50),
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Funkce, kterou Trigger spustí
-- (Trigger v PostgreSQL volá speciální funkci, která vrací typ TRIGGER)
CREATE OR REPLACE FUNCTION log_review_changes()
RETURNS TRIGGER AS $$
BEGIN
    -- jen situace, kdy se hodnocení skutečně změnilo
    IF OLD.Rating <> NEW.Rating THEN
        INSERT INTO Reviews_Audit (Review_ID, Old_Rating, New_Rating, Changed_By, Change_Date)
        VALUES (OLD.Review_ID, OLD.Rating, NEW.Rating, current_user, NOW());
    END IF;
    
    -- nový záznam, aby se změna v původní tabulce provedla
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Trigger (Spoušť)
CREATE TRIGGER trg_audit_review_update
AFTER UPDATE ON Reviews
FOR EACH ROW
EXECUTE FUNCTION log_review_changes();