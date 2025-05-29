-- 1. Vložíme nového uživatele
INSERT INTO Users (Username, Email)
VALUES ('maty123', 'maty@example.com');

-- 2. Zjistíme jeho User_ID
SELECT User_ID FROM Users WHERE Username = 'lukas123';

-- 3. Zjistíme Film_ID podle názvu filmu
SELECT Film_ID FROM Films WHERE Title = 'Inception';

-- 4. Přidáme recenzi (předpokládejme, že User_ID = 14 a Film_ID = 5)
INSERT INTO Reviews (Film_ID, User_ID, Rating, Comment)
VALUES (5, 14, 9, 'Neskutecny film, vizualne i pribehove!');

-- 5. Ověříme, že recenze je uložená (přes view)
SELECT * FROM user_reviews_summary WHERE Username = 'maty123';
