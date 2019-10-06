CREATE DEFINER=`root`@`localhost` FUNCTION `hello`() RETURNS text CHARSET utf8mb4
DETERMINISTIC
BEGIN
DECLARE return_text text;
if hour(now())>=6 AND hour(now())<=12 then
set return_text='Доброе утро';
elseif hour(now())>12 AND hour(now())<=18 then
set return_text='Доброе день';
elseif hour(now())>18 AND hour(now())<=23 then 
set return_text='Добрый вечер';
else 
set return_text='Доброй ночи'; 
end if;
RETURN return_text;
END
