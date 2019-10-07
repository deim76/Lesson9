# Создайте двух пользователей которые имеют доступ к базе данных shop.
# Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
# второму пользователю shop — любые операции в пределах базы данных shop.

DROP USER IF EXISTS 'shop'@'localhost'; 
DROP USER IF EXISTS 'shop_read'@'localhost'; 

CREATE  USER IF NOT EXISTS 'shop'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT ALL ON shop.* TO 'shop'@'localhost';

CREATE USER 'shop_read'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT SELECT ON shop.* TO 'shop_read'@'localhost';




