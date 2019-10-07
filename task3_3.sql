# Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
# Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
# Вызов функции FIBONACCI(10) должен возвращать число 55.
#


CREATE DEFINER=`root`@`localhost` FUNCTION `FIBONACCI`(num INT) RETURNS INTEGER
    DETERMINISTIC
BEGIN
DECLARE i INT;
DECLARE new_number INT;
DECLARE old_number1 INT;
DECLARE old_number2 INT;
DECLARE result INT;
SET i=2;
SET old_number1=1;
SET old_number2=0;
IF num=0 THEN
RETURN 0;
ELSEIF num=1 THEN
RETURN 1;
END IF;
cycle: LOOP
SET new_number=(old_number1)+(old_number2);
IF i>=num THEN
LEAVE cycle;
END IF;
SET old_number2=old_number1;
SET old_number1=new_number;
SET i=i+1;
END LOOP; 
RETURN new_number;
END