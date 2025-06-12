-- 1. zaregistrujeme se
INSERT INTO Users (Username, Email)
VALUES ('maty123', 'maty@example.com');

-- 2. Zjistíme svoje User_ID
SELECT User_ID FROM Users WHERE Username = 'lukas123';

-- 3. Zjistíme Film_ID podle názvu filmu
SELECT Film_ID FROM Films WHERE Title = 'Inception';

-- 4. Přidáme recenzi 
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment)
VALUES (Film_ID, User_ID, 9, 'Neskutecny film, vizualne i pribehove!');

-- 5. Ověříme, že recenze je uložená (přes view)
SELECT * FROM user_reviews_summary WHERE Username = 'maty123';
