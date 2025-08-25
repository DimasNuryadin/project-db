DROP DATABASE hitung_luas;
CREATE DATABASE hitung_luas;
USE hitung_luas;

DELIMITER //
CREATE FUNCTION sf_hitungluas(
		panjang tinyint,
        lebar tinyint
) RETURNS tinyint DETERMINISTIC
BEGIN
	RETURN panjang * lebar;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE hitungluas (
 panjang tinyint,
 lebar tinyint
) 
BEGIN 
	SET @p_panjang = panjang;
    SET @p_lebar = lebar;
    SELECT sf_hitungluas(@p_panjang, @p_lebar);
END //
DELIMITER ;

SELECT sf_hitungluas(2, 10);
call hitungluas(2, 5);
