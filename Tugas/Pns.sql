CREATE DATABASE pns;
USE pns;

CREATE TABLE IF NOT EXISTS anggota_pns( 
  id TINYINT,							  
  nip VARCHAR(18),
  nama VARCHAR(50)
);

ALTER TABLE anggota_pns				  
	MODIFY id TINYINT 					  
	NOT NULL 							   
	AUTO_INCREMENT 						 
	PRIMARY KEY;
    
INSERT INTO anggota_pns (nip, nama) 
VALUES 									   
("197209172005011002", "Mohamad Septiawan"), 
("198201202021112004", "Damayanti"), 
("200901202020051003", "Mohamad Naufal Dzakiy"), 
("201407142022121008", "Mohamad Tsaniy Atila Dzaka"), 
("201511142023032002", "Nabila Tsalsa Nuraisyah");

CREATE VIEW info_pns as
SELECT nama,
DATE_FORMAT(SUBSTRING(nip, 1, 8), '%W, %d %M %Y') AS Tanggal_Lahir,
DATE_FORMAT(CONCAT(SUBSTRING(nip, 9, 6), '21'), '%M, %Y') AS Tanggal_Pns,
IF (substring(nip, 15, 1) = "1", "Pria", "Wanita") AS Jenis_Kelamin,
substring(nip, 16, 3) AS No_Urut
FROM anggota_pns;


CREATE TABLE agama (
	kode char(1) primary key,
    nm_agama varchar(9)
);

SHOW CREATE TABLE agama;
-- Procedure insert agama
delimiter //
CREATE PROCEDURE ins_agama(pkode char(1), pnama varchar(9))
begin
	INSERT agama (kode, nm_agama) VALUES (pkode, pnama);
END //
delimiter ;
call ins_agama('1', 'Islam');
call ins_agama('2', 'Katholik');
call ins_agama('3', 'Protestan');
call ins_agama('4', 'Budha');
call ins_agama('5', 'Hindu');
call ins_agama('6', 'Konghucu');

-- Procedure update agama
delimiter //
CREATE PROCEDURE upd_agama(paid char(1), pnama varchar(50))
begin
    UPDATE anggota_pns
	SET agama_id = paid
    WHERE nama = pnama;
END //
delimiter ;
call upd_agama('1', 'Damayanti');
call upd_agama('1', 'Mohamad Naufal Dzakiy');
call upd_agama('1', 'Mohamad Tsaniy Atila Dzaka');

-- Procedure insert anggota pns
delimiter //
CREATE PROCEDURE ins_anggota_pns(knip VARCHAR(18), knama VARCHAR(50), kagama_id char(1))
BEGIN
	INSERT anggota_pns (nip, nama, agama_id) VALUES (knip, knama, kagama_id);
END //
delimiter ;
CALL ins_anggota_pns('200011152021112005', 'Dimas Nuryadin', '1');
CALL ins_anggota_pns('200011162021112006', 'Oms Situasi', '2');
CALL ins_anggota_pns('200011172021112007', 'Wow Kemana', '3');
CALL ins_anggota_pns('200011182021112008', 'Dari Mila', '4');


ALTER TABLE anggota_pns
	ADD COLUMN agama_id char(1);
ALTER TABLE anggota_pns
	ADD CONSTRAINT fk_angpns_2_agama FOREIGN KEY(agama_id)
    REFERENCES agama(kode);


    
SELECT *
FROM agama;
SELECT *
FROM info_pns;
SELECT *
FROM anggota_pns;

/* Relasi database */
SELECT nama, nm_agama FROM agama
INNER JOIN anggota_pns ON anggota_pns.agama_id=kode;

SHOW PROCEDURE STATUS WHERE Db = 'pns';

/*
DESCRIBE anggota_pns;
DROP table anggota_pns;
SELECT * FROM anggota_pns;
DROP VIEW info_pns;
DROP PROCEDURE IF EXISTS ins_agama;
*/