# В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
# Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
# Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
# При попытке присвоить полям NULL-значение необходимо отменить операцию.

CREATE TRIGGER check_catalog_id_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF isnull(NEW.name) and isnull(NEW.desription) THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UPDATE canceled';
  END IF; 
END
USE shop;

UPDATE products SET desription = NULL WHERE id = 5;
select * from products;
