CREATE DATABASE IF NOT EXISTS pns;
USE pns;

CREATE TABLE IF NOT EXISTS data( 
  id TINYINT,							  
  nip VARCHAR(18),
  nama VARCHAR(50)
);

ALTER TABLE data				  
	MODIFY id TINYINT 					  
	NOT NULL 							   
	AUTO_INCREMENT 						 
	PRIMARY KEY;
    
INSERT INTO data (nip, nama) 
VALUES 									   
("197209172005011002", "Mohamad Septiawan"), 
("198201202021112004", "Damayanti"), 
("200901202020051003", "Mohamad Naufal Dzakiy"), 
("201407142022121008", "Mohamad Tsaniy Atila Dzaka"), 
("201511142023032002", "Nabila Tsalsa Nuraisyah");

SELECT nama,
DATE_FORMAT(SUBSTRING(nip, 1, 8), '%W, %d %M %Y') AS Tanggal_Lahir,
DATE_FORMAT(CONCAT(SUBSTRING(nip, 9, 6), '21'), '%M, %Y') AS Tanggal_Pns,
IF (substring(nip, 15, 1) = "1", "Pria", "Wanita") AS Jenis_Kelamin,
substring(nip, 16, 3) AS No_Urut
FROM data;


/*
DESCRIBE data;
DROP table data
SELECT * FROM data;
*/