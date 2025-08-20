CREATE DATABASE IF NOT EXISTS pbl;  	   
USE pbl;								   
CREATE TABLE IF NOT EXISTS status_nikah( 
  id TINYINT,							  
  nama VARCHAR(25),
  kelamin VARCHAR(25),
  status VARCHAR(25)
);

ALTER TABLE status_nikah				  
	MODIFY id TINYINT 					  
	NOT NULL 							   
	AUTO_INCREMENT 						 
	PRIMARY KEY;

INSERT status_nikah (id, nama, kelamin, status) 
VALUES 									   
(null, "Abdul", "Pria", "Sendiri"), 
(null, "Wahab", "Pria", "Nikah"), 
(null, "Toni", "Pria", "Cerai"), 
(null, "Santi", "Wanita", "Sendiri"), 
(null, "Nia", "Wanita", "Nikah"), 
(null, "Tini", "Wanita", "Cerai");		

SELECT nama, kelamin, status, CASE
WHEN kelamin = "Pria" AND status = "Sendiri" THEN "Perjaka"
WHEN kelamin = "Pria" AND status = "Nikah" THEN "Kawin"
WHEN kelamin = "Pria" AND status = "Cerai" THEN "Duda"
WHEN kelamin = "Wanita" AND status = "Sendiri" THEN "Perawan"
WHEN kelamin = "Wanita" AND status = "Nikah" THEN "Kawin"
WHEN kelamin = "Wanita" AND status = "Cerai" THEN "Janda"
ELSE ""
END AS keterangan
FROM status_nikah;

/*
DESCRIBE status_nikah;
DROP table status_nikah
SELECT * FROM status_nikah;		
*/	   
