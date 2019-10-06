# Пусть имеется таблица с календарным полем created_at.
# В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2018-08-04', 
# '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, 
# выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

USE test;
DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (id SERIAL, created_at DATE);
INSERT INTO tests (created_at) VALUES ('2018-08-01'),('2018-08-04'),('2018-08-16'), ('2018-08-17');


#generate_series(1,10);

SELECT 5*5*(a-1)+5*(b-1) + c AS num 
FROM (SELECT 1 a UNION ALL SELECT 2 UNION ALL SELECT 3 
 UNION ALL SELECT 4 UNION ALL SELECT 5
 ) x CROSS JOIN
 (SELECT 1 b UNION ALL SELECT 2 UNION ALL SELECT 3 
 UNION ALL SELECT 4 UNION ALL SELECT 5
 ) y CROSS JOIN
 (SELECT 1 c UNION ALL SELECT 2 UNION ALL SELECT 3 
 UNION ALL SELECT 4 UNION ALL SELECT 5
 ) z
WHERE 5*5*(a-1)+5*(b-1) + c <= 31
ORDER BY 1;


#DROP VIEW IF EXISTS test_view;

#SELECT * From INTERVAL ('2018-08-01' ,'2018-08-31'); 







