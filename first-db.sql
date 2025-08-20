CREATE DATABASE IF NOT EXISTS pbl;  	   # Pendefinisian DB
USE pbl;								   # Menunjuk DB
CREATE TABLE IF NOT EXISTS tbl_registrasi( # Pendefinisian Table
	id TINYINT,							   # Pendefinisian nama kolom
    nama VARCHAR(25),
    tinggal VARCHAR(25)
);

INSERT tbl_registrasi (id, nama, tinggal)  # Memasukan record
VALUES (null, "Dimas", "Bandung");		   # Memasukan item record

INSERT tbl_registrasi (id, nama, tinggal)  # Memasukan record
VALUES 									   # Memasukan banyak item
(null, "Nuryadin", "Jakarta"), 
(null, "Sias", "Kalimantan");		   

/*
Catatan bila belum konfigurasi safe monamade
Error Code: 1175. You are using safe update mode 
and you tried to update a table without a WHERE that uses a KEY column.  
To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.
*/
DELETE FROM tbl_registrasi;				   # Menghapus seluruh record

ALTER TABLE tbl_registrasi				   # Memperbaiki table
	MODIFY id TINYINT 					   # Menentukan kolom
	NOT NULL 							   # Kolom wajib diisi
	AUTO_INCREMENT 						   # Perintah counter
	PRIMARY KEY;						   # Menentukan PK

DESCRIBE tbl_registrasi;

SELECT * FROM tbl_registrasi;			   # Menampilkan kolom dari table
