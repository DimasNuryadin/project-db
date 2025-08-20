CREATE DATABASE IF NOT EXISTS pbl;  	   
USE pbl;								   
CREATE TABLE IF NOT EXISTS lampu_lalin( 
  id TINYINT,							  
  warna VARCHAR(25)
);

ALTER TABLE lampu_lalin				  
	MODIFY id TINYINT 					  
	NOT NULL 							   
	AUTO_INCREMENT 						 
	PRIMARY KEY;

INSERT lampu_lalin (id, warna) 
VALUES 									   
(null, "Hijau"), 
(null, "Kuning"), 
(null, "Merah"); 

SELECT warna, CASE
WHEN warna = "Hijau" THEN "Jalan"
WHEN warna = "Kuning" THEN "Siap-siap"
WHEN warna = "Merah" THEN "Berhenti"
ELSE ""
END AS keterangan
FROM lampu_lalin;

/*
DESCRIBE lampu_lalin;
DROP table lampu_lalin
SELECT * FROM lampu_lalin;		
*/	   
