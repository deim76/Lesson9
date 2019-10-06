# В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
# Используйте транзакции.

SET @id_move_user=1;
START TRANSACTION;
INSERT INTO sample.users (SELECT * FROM shop.users WHERE id=@id_move_user);
DELETE FROM shop.users WHERE id=@id_move_user;
COMMIT;
SELECT * FROM sample.users;
SELECT * FROM shop.users;

