-- Testování přístupu jako pepa_kritik

-- SELECT z films (měl by fungovat díky app_reader)
SELECT COUNT(*) FROM films;

-- SELECT z reviews
SELECT COUNT(*) FROM reviews;

-- INSERT do reviews (měl by fungovat)
INSERT INTO reviews (film_id, user_id, rating, comment, review_date)
VALUES (1, 1, 5, 'Test review od pepa_kritik', CURRENT_DATE);

-- UPDATE na reviews (měl by fungovat)
UPDATE reviews SET comment = 'Updated test review od pepa_kritik'
WHERE comment = 'Test review od pepa_kritik';