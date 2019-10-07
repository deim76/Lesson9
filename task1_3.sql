# Пусть имеется таблица с календарным полем created_at.
# В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2018-08-04', 
# '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
# выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

USE example;

DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (id SERIAL, created_at DATE);
INSERT INTO tests (created_at) VALUES ('2018-08-01'),('2018-08-04'),('2018-08-16'), ('2018-08-17');

SELECT tab.date_m, NOT isnull(created_at) AS created_at  FROM (
SELECT adddate('2018-08-01',t1.i+t2.i) AS date_m FROM (
(SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
(SELECT 0 i UNION SELECT 10 UNION SELECT 20 UNION SELECT 30) t2) 
WHERE adddate('2018-08-01',t1.i+t2.i) BETWEEN '2018-08-01' and '2018-08-31' ) tab
LEFT JOIN tests ON tab.date_m=tests.created_at
ORDER BY tab.date_m;
;






