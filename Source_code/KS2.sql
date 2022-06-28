ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS'
SET SERVEROUTPUT ON

CREATE TABLE KHACHSAN (
MAKS varchar2(8) PRIMARY KEY, 
 TENKS varchar2(20), 
THANHPHO varchar2(20),
 SDT number
);
CREATE TABLE PHONGBAN
(MAPB varchar2(8) PRIMARY KEY, 
 TENPB varchar2(20)
);
CREATE TABLE CHUCVU
(MACV varchar2(8) PRIMARY KEY, 
TENCV varchar2(20)
);
CREATE TABLE NHANVIEN
(MANV varchar2(8) PRIMARY KEY, 
TENNV varchar2(20), 
MACV varchar2(8),
MAPB varchar2(8),
MAKS varchar2(8),
NGAYBATDAU date,
NGAYKETTHUC date,
TRANGTHAI number,
LUONG number
);
CREATE TABLE LOAIPHONG
(MALP varchar2(8) PRIMARY KEY, 
GIA number,
MOTA varchar2(50)
);
CREATE TABLE PHONG
(MAP varchar2(8) PRIMARY KEY, 
SOPHONG number,
MALP varchar2(8),
MAKS varchar2(8),
MOTA varchar2(50)
);
CREATE TABLE KHACHHANG
(MAKH varchar2(8) PRIMARY KEY, 
TENKH varchar2(20), 
CMND varchar2(10),
SODIENTHOAI varchar2(10),
QUOCTICH varchar2(20),
GIOITINH varchar2(5)
);
CREATE TABLE DATPHONG
(MADP varchar2(8) PRIMARY KEY, 
MAKS varchar2(8),
MAKH varchar2(8), 
MAP varchar2(8),
NGAYBATDAU date,
NGAYKETTHUC date,
MANV varchar2(8)
);
CREATE TABLE HOADON
(MAHD varchar2(8) PRIMARY KEY, 
MADP varchar2(8),
NGHD date,
THANHTIEN  number
);

--Kh�a Ngo?i 
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_CV FOREIGN KEY (MACV) 
REFERENCES CHUCVU(MACV);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_PB FOREIGN KEY (MAPB) 
REFERENCES PHONGBAN(MAPB);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);
----------------------------
ALTER TABLE PHONG
ADD CONSTRAINT FK_P_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);


ALTER TABLE PHONG
ADD CONSTRAINT FK_P_LP FOREIGN KEY (MALP) 
REFERENCES LOAIPHONG(MALP);
------------------------------------
ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_KH FOREIGN KEY (MAKH) 
REFERENCES KHACHHANG(MAKH);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_P FOREIGN KEY (MAP) 
REFERENCES PHONG(MAP);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_NV FOREIGN KEY (MANV) 
REFERENCES NHANVIEN(MANV);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);

-----------------------------------
ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_DP FOREIGN KEY (MADP) 
REFERENCES DATPHONG(MADP);
======================

--D? LI?U
--KHACHSAN
INSERT INTO KHACHSAN VALUES ('KS1', 'Hang Dieu', 'TP  Ha Giang', '123456789'); 
INSERT INTO KHACHSAN VALUES ('KS2', 'Ma Vi', 'TP Dien Bien Phu', '102345678'); 
INSERT INTO KHACHSAN VALUES ('KS3', 'Phuc Kien', 'TP Thanh Hoa', '987654321'); 

--PHONGBAN
INSERT INTO PHONGBAN VALUES ('PB1', 'Phong Hanh Chinh'); 
INSERT INTO PHONGBAN VALUES ('PB2', 'Phong Ke Toan'); 
INSERT INTO PHONGBAN VALUES ('PB3', 'Phong CSKH'); 

--CHUCVU
INSERT INTO CHUCVU VALUES ( 'CV1', 'Quan Ly'); 
INSERT INTO CHUCVU VALUES ( 'CV2', 'Le Tan'); 
INSERT INTO CHUCVU VALUES ( 'CV3', 'Nhan Vien'); 

--NHANVIEN
INSERT INTO NHANVIEN VALUES ('NV10', 'Thuy Tien', 'CV2', 'PB3', 'KS2', '22/2/2012', NULL, '0', '15000000'); 
INSERT INTO NHANVIEN VALUES ('NV5', 'Lan Ho Diep', 'CV2', 'PB3', 'KS2', '08/02/2020', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV6', 'Cam Chuong', 'CV2', 'PB3', 'KS2', '17/7/2017', '05/05/2018', '1', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV14', 'Trang Nguyen', 'CV2', 'PB3', 'KS2', '12/11/2016', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV16', 'Moc Hoa Mi', 'CV2', 'PB3', 'KS2', '08/08/2018', NULL, '0', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV9', 'Thien Dieu', 'CV2', 'PB3', 'KS2', '18/05/2013', '13/01/2018', '1', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV3', 'Ly Ly', 'CV2', 'PB3', 'KS2', '01/09/2012', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV7', 'Cat Tuong', 'CV2', 'PB3', 'KS2', '14/06/2016', NULL, '0', '15000000'); 

INSERT INTO NHANVIEN VALUES ('NV15', 'Mao Luong', 'CV1', 'PB1', 'KS2', '23/03/2014', '08/12/2020', '1', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV17', 'Bi Ngan', 'CV1', 'PB2', 'KS2', '25/12/2014', NULL, '0', '20000000');
INSERT INTO NHANVIEN VALUES ('NV19', 'Anh Tuc', 'CV1', 'PB3', 'KS2', '22/08/2015', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV20', 'Da Lan Huong', 'CV3', 'PB3', 'KS2', '26/06/2017', NULL, '0', '20000000');

--LOAIPHONG
INSERT INTO LOAIPHONG VALUES ( 'LP1', '130000', 'Don'); 
INSERT INTO LOAIPHONG VALUES ( 'LP2', '200000', 'Doi'); 
INSERT INTO LOAIPHONG VALUES ( 'LP3', '280000', 'Gia Dinh'); 

--PHONG
INSERT INTO PHONG VALUES ( 'P10', '201', 'LP2', 'KS2', 'Tang 1 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P11', '202', 'LP1', 'KS2', 'Tang 2 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P12', '203', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P13', '301', 'LP3', 'KS2', 'Tang 2 co view bien');
INSERT INTO PHONG VALUES ( 'P14', '302', 'LP2', 'KS2', 'Tang 1 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P15', '303', 'LP1', 'KS2', 'Tang 2 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P16', '304', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P17', '401', 'LP3', 'KS2', 'Tang 2 co view bien');
INSERT INTO PHONG VALUES ( 'P18', '402', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P19', '403', 'LP3', 'KS2', 'Tang 2 co view bien');


--KHACHHANG
INSERT INTO KHACHHANG VALUES ('KH1', 'Cam Thao', '161813584', '014785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH2', 'Chi Tu', '161223584', '094785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH3', 'Can Khuong', '161848584', '014735236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH4', 'Boi Mau', '251813584', '014715236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH5', 'Bach Dau Khau', '261813584', '014785235', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH6', 'Bach Thuoc', '271813584', '015785236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH7', 'Bac Ha', '301813584', '014782236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH8', 'Ba Tu Nhan', '311813584', '014780236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH9', 'Anh Tuc', '501813584', '017785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH10', 'An Tuc Huong', '131813584', '014755236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH11', 'Simpor', '5518135', '014285236', 'Brunei', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH12', 'A Giao', '481413584', '014785231', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH13', 'Do Trong', '265313584', '014185236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH14', 'Dinh Huong', '255313584', '014785636', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH15', 'Y Di', '495313584', '0146785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH16', 'Xa Can', '333113584', '0147852936', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH17', ' Poppy', '2447890', '0147085236', 'Bhutan', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH18', 'Vuong Bat Luu Hanh', '555313584', '014485236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH19', 'Tan Di Hoa', '445213584', '044785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH20', 'Tran Chau', '165641584', '014285236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH21', 'Bach Quyet Minh', '161812221', '014785036', 'Viet Nam', 'Nam'); 

UPDATE KS2.KHACHHANG SET QUOCTICH ='Bhutan' WHERE MAKH='KH17';
UPDATE KS2.HOADON SET NGHD= '22/03/2021' WHERE MADP='DP17';
UPDATE KS2.DATPHONG SET NGAYBATDAU='22/03/2021',NGAYKETTHUC='22/03/2021' WHERE MADP='DP19';
delete from DATPHONG WHERE MADP = 'DP18';
INSERT INTO DATPHONG VALUES ('DP22', 'KS2', 'KH19', 'P10', '16/12/2021', '18/12/2021', 'NV7');
SELECT * FROM HOADON WHERE NGHD ='22/03/2021'
UNION
SELECT hd.*
FROM HOADON hd, DATPHONG dp, KHACHHANG kh
WHERE hd.MADP = dp.MADP AND dp.MAKH = kh.MAKH AND kh.QUOCTICH = 'Bhutan';
;
COMMIT;

INSERT INTO KS2.DATPHONG VALUES ('DP5', 'KS2', 'KH10', 'P10', '20/11/2021', '21/11/2021', 'NV5'); 
INSERT INTO KS2.DATPHONG VALUES ('DP2', 'KS2', 'KH10', 'P13', '08/02/2021', '08/02/2021', 'NV5'); 
INSERT INTO KS2.DATPHONG VALUES ('DP11', 'KS2', 'KH19', 'P16', '30/05/2021', '01/06/2021', 'NV3'); 
INSERT INTO KS2.DATPHONG VALUES ('DP12', 'KS2', 'KH19', 'P17', '01/10/2021', '04/10/2021', 'NV3'); 

--DATPHONG
INSERT INTO DATPHONG VALUES ('DP6', 'KS2', 'KH10', 'P11', '05/01/2021', '08/01/2021', 'NV10'); 
INSERT INTO DATPHONG VALUES ('DP7', 'KS2', 'KH21', 'P11', '24/07/2021', '26/07/2021', 'NV5'); 
INSERT INTO DATPHONG VALUES ('DP8', 'KS2', 'KH14', 'P11', '13/10/2021', '15/10/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP9', 'KS2', 'KH7', 'P13', '11/06/2021', '14/06/2021', 'NV14'); 
INSERT INTO DATPHONG VALUES ('DP15', 'KS2', 'KH16', 'P11', '25/10/2021', '28/10/2021', 'NV20');

INSERT INTO DATPHONG VALUES ('DP17', 'KS2', 'KH4', 'P10', '16/06/2021', '18/06/2021', 'NV10'); 
INSERT INTO DATPHONG VALUES ('DP21', 'KS2', 'KH6', 'P12', '20/11/2021', '25/11/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP10', 'KS2', 'KH3', 'P13', '05/12/2021', '06/12/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP18', 'KS2', 'KH9', 'P13', '10/09/2021', '13/09/2021', 'NV3'); 
INSERT INTO DATPHONG VALUES ('DP20', 'KS2', 'KH17', 'P11', '30/08/2021', '02/09/2021', 'NV7'); 
INSERT INTO DATPHONG VALUES ('DP16', 'KS2', 'KH18', 'P13', '29/05/2021', '30/05/2021', 'NV9'); 
INSERT INTO DATPHONG VALUES ('DP19', 'KS2', 'KH19', 'P10', '16/12/2021', '18/12/2021', 'NV7');

--HOADON
INSERT INTO HOADON VALUES ('HD6', 'DP6',  '05/01/2021', '560000'); 
INSERT INTO HOADON VALUES ('HD7', 'DP7',  '24/07/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD8', 'DP8',  '13/10/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD9', 'DP9',  '11/06/2021', '390000'); 
INSERT INTO HOADON VALUES ('HD15', 'DP15',  '25/10/2021', '390000'); 

INSERT INTO HOADON VALUES ('HD17', 'DP17',  '16/06/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD21', 'DP21',  '03/01/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD10', 'DP10',  '22/03/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD18', 'DP18',  '10/09/2021', '560000'); 
INSERT INTO HOADON VALUES ('HD20', 'DP20',  '30/08/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD16', 'DP16',  '29/05/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD19', 'DP19',  '16/12/2021', '400000');

====================

SELECT * FROM KHACHSAN;
SELECT * FROM PHONGBAN;
SELECT * FROM CHUCVU;
SELECT * FROM NHANVIEN;

SELECT * FROM LOAIPHONG;
SELECT * FROM PHONG;
SELECT * FROM KHACHHANG;
SELECT * FROM DATPHONG;
SELECT * FROM HOADON;

SELECT * FROM KHACHSAN;
SELECT * FROM PHONGBAN;
SELECT * FROM CHUCVU;
SELECT * FROM NHANVIEN@KS1_GD;

SELECT * FROM LOAIPHONG@KS1_GD;
SELECT * FROM PHONG@KS1_GD;
SELECT * FROM KHACHHANG@KS1_GD;
SELECT * FROM DATPHONG@KS1_GD;
SELECT * FROM HOADON@KS1_GD;


--C�u 7: T�i kho?n qu?n l�:
--T�m c�c ph�ng ?� ???c ??t trong ng�y 20/11/2021 v� th�ng tin kh ?� ??t ph�ng ?� (makh, tenkh) t?i c? 2 chi nh�nh

SELECT DP.MAP, DP.MAKS,KH.MAKH, TENKH 
FROM KS2.DATPHONG DP, KS2.KHACHHANG KH
WHERE DP.MAKH = KH.MAKH AND NGAYBATDAU = '20/11/2021'
UNION
SELECT DP1.MAP, DP1.MAKS,KH1.MAKH, TENKH 
FROM KS1.DATPHONG@KS1_QL DP1, KS1.KHACHHANG@KS1_QL KH1
WHERE DP1.MAKH = KH1.MAKH AND NGAYBATDAU = '20/11/2021'

--C�u 8: T�i kho?n qu?n l�:
--T�m kh�ch h�ng ?� t?ng ??t ph�ng ? c? chi nh�nh 1 v� chi nh�nh 2. b? ph?n cskh xin feedback xem tr?i nghi?m ? cn n�o t?t h?n ?? r�t kinh nghi?m 

SELECT kh.*
FROM KS2.DATPHONG dp JOIN KS2.KHACHHANG kh ON dp.MAKH = kh.MAKH
INTERSECT 
SELECT kh1.*
FROM KS1.DATPHONG@KS1_QL dp1 JOIN KS1.KHACHHANG@KS1_QL kh1 ON dp1.MAKH = kh1.MAKH;


--C�u 9: T�i kho?n qu?n l�:
--T�nh t?ng s? l?n ???c ??t c?a m?i ph�ng trong n?m 2021, ? kh�ch s�ch 1 v� kh�ch s?n 2.
--th?ng k� xem nhu c?u lo?i ph�ng m� kh ?u th�ch xong n�ng c?p m? r?ng th�m

SELECT	MAP, COUNT(MADP) soLanDat
FROM		KS2.DATPHONG 
WHERE	EXTRACT (YEAR FROM NGAYBATDAU) = '2021'
GROUP BY	MAP
UNION
SELECT	MAP, COUNT(MADP) soLanDat
FROM		KS1.DATPHONG@KS1_QL
WHERE	EXTRACT (YEAR FROM NGAYBATDAU) = '2021'
GROUP BY	MAP

--C�u 10 : T�i kho?n qu?n l�:
--in ra danh s�ch th�ng tin c�c ph�ng (MAP, SOPHONG) kh�ng ???c ??t trong th�ng 12/2021 ? kh�ch s?n 1 v� kh�ch s?n 2.
--th?ng k� xem nhu c?u lo?i ph�ng trong th�ng ?? c?i thi?n 

SELECT MAP, SOPHONG
FROM	KS2.PHONG 
MINUS
SELECT p.MAP, SOPHONG
FROM	KS2.PHONG p JOIN KS2.DATPHONG dp ON p.MAP = dp.MAP
WHERE EXTRACT (MONTH FROM NGAYBATDAU) = '12' AND EXTRACT (YEAR FROM NGAYBATDAU) = '2021'
UNION
SELECT MAP, SOPHONG
FROM	KS1.PHONG@KS1_QL
MINUS
SELECT p1.MAP, SOPHONG
FROM	KS1.PHONG@KS1_QL p1 JOIN KS1.DATPHONG@KS1_QL dp1 ON p1.MAP = dp1.MAP
WHERE EXTRACT (MONTH FROM NGAYBATDAU) = '12' AND EXTRACT (YEAR FROM NGAYBATDAU) = '2021'
