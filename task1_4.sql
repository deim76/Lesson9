# Пусть имеется любая таблица с календарным полем created_at. 
# Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

USE example;

DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (id SERIAL, created_at DATE);
INSERT INTO tests (created_at) VALUES ('2018-08-01'),('2018-08-04'),('2018-08-16'), ('2018-09-17'),
('2018-09-01'),('2018-12-04'),('2018-11-16'), ('2018-07-17'),
('2018-11-11'),('2018-12-01'),('2018-08-14'), ('2018-09-15');

CREATE TEMPORARY TABLE temp (id INT, created_at DATE);
INSERT INTO temp (SELECT * FROM tests ORDER BY  created_at DESC LIMIT 5);

DELETE FROM tests WHERE created_at NOT IN (SELECT temp.created_at FROM temp);
SELECT * FROM tests ORDER BY created_at;
DROP TEMPORARY TABLE IF EXISTS temp;


