# Создайте представление, 
# которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
USE shop;

DROP VIEW IF EXISTS view_products;
CREATE VIEW view_products (name, catalog_name) AS 
(SELECT products.name, catalogs.name FROM products
JOIN catalogs ON products.catalog_id=catalogs.id);

SELECT * FROM view_products;
