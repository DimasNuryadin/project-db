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

CREATE VIEW vs_keterangan AS
SELECT nama, kelamin, status,
if(kelamin = 'Pria', 
	if(status = 'Sendiri',  'Perjaka',
		if(status = 'Nikah', 'Kawin', 'Duda') 
	),
	if(status = 'Sendiri', 'Perawan', 
		if(status = 'Nikah', 'Kawin', 'Janda')
    )
) AS keteranganIF,

CASE
WHEN kelamin = "Pria" THEN 
	if(status = 'Sendiri',  'Perjaka',
		if(status = 'Nikah', 'Kawin', 'Duda') 
	)
WHEN kelamin = "Wanita" THEN 
	if(status = 'Sendiri', 'Perawan', 
		if(status = 'Nikah', 'Kawin', 'Janda')
    )
END AS keteranganCASE
FROM status_nikah;

SELECT keteranganIF, count(keteranganIF) AS Jumlah
FROM vs_keterangan
WHERE keteranganIF = 'Kawin'
GROUP BY keteranganIF;

/*
DESCRIBE status_nikah;
DROP table status_nikah
SELECT * FROM status_nikah;		
*/	   
