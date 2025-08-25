DROP DATABASE kalkulatormini;
CREATE DATABASE kalkulatormini;
USE kalkulatormini;

DELIMITER //
CREATE FUNCTION sf_minicalc(
		op char(1),
		a int,
        b int
) RETURNS int DETERMINISTIC
BEGIN
	DECLARE hasil INT;
    
    IF op = '+' THEN
		SET hasil = a + b;
	ELSEIF op = '-' THEN
		SET hasil = a - b;
	ELSEIF op = '*' THEN
		SET hasil = a * b;
	ELSEIF op = '/' THEN
		IF b = 0 THEN
			SET hasil = null;
		ELSE
			SET hasil = a / b;
		END IF;
	ELSE
		SET hasil = a/b;
	END IF;
    RETURN hasil;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE minicalc(
	op char(1),
	a int,
    b int
)
BEGIN
	SET @p_op = op;
	SET @p_a = a;
    SET @p_b = b;
    SELECT sf_minicalc(@p_op, @p_a, @p_b);
END //
DELIMITER ;

SELECT sf_minicalc('/', 4, 2);
CALL minicalc('*', 4, 4);
