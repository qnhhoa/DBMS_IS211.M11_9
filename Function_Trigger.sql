ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS'
SET SERVEROUTPUT ON
--FUNCTION	Vi?t hàm nh?p vào ch?ng minh nhân dân c?a khách hàng, n?m in ra t?ng s? l?n ??t phòng c?a khách hàng trong n?m ?ó.

CREATE OR REPLACE FUNCTION findKH (v_cmnd in varchar2, v_year NUMBER)
RETURN	NUMBER
AS
	sum1 NUMBER;
	sum2 NUMBER;
BEGIN
    sum1:=0; sum2:=0;
	SELECT	COUNT(MADP) INTO sum1
	FROM	KS2.KHACHHANG kh JOIN KS2.DATPHONG dp ON kh.MAKH=dp.MAKH
	WHERE	CMND = v_cmnd AND EXTRACT (YEAR FROM NGAYBATDAU) = v_year;

	SELECT	COUNT(MADP) INTO sum2
	FROM	KS1.KHACHHANG@KS1_GD kh1 JOIN KS1.DATPHONG@KS1_GD dp1 ON kh1.MAKH=dp1.MAKH
	WHERE	CMND = v_cmnd AND EXTRACT (YEAR FROM NGAYBATDAU) = v_year;

	RETURN sum1+sum2;
--EXCEPTION WHEN NO_DATA_FOUND THEN RETURN 0;
END;		

DROP FUNCTION findKH
--goi hàm

DECLARE 
v_cmnd varchar2(10);
v_year varchar2(4);
kq number;

BEGIN 
v_cmnd := '131813584';
v_year := '2021';
kq := findKH(v_cmnd, v_year); 
DBMS_OUTPUT.PUT_LINE('khach hang co CMND: ' || v_cmnd || ' trong nam:' || v_year || ' dat phong:' || kq || ' lan'); 
END;

===================
----TRIGGER
--Khách hàng ??t m?t phòng không ???c trùng vào kho?ng th?i gian do khách hàng khác ??t tr??c cùng phòng ?ó.
CREATE OR REPLACE TRIGGER TRG_DATPHONG_UPD_INS
BEFORE INSERT OR UPDATE ON DATPHONG
FOR EACH ROW
DECLARE
    temp NUMBER := 0;
	v_ngbd KS2.DATPHONG.NGAYBATDAU%TYPE;
	v_ngkt KS2.DATPHONG.NGAYKETTHUC%TYPE;

    CURSOR  cur IS SELECT KS2.DATPHONG.NGAYBATDAU, KS2.DATPHONG.NGAYKETTHUC
                    FROM KS2.DATPHONG
                    WHERE KS2.DATPHONG.MAP = :NEW.MAP;      
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO v_ngbd, v_ngkt;
        EXIT WHEN cur%NOTFOUND;
        
        IF(:NEW.NGAYBATDAU >= v_ngbd AND :NEW.NGAYBATDAU <= v_ngkt) THEN
            temp := temp + 1;
        ELSIF (:NEW.NGAYKETTHUC >= v_ngbd AND :NEW.NGAYKETTHUC <= v_ngkt) THEN
            temp := temp + 1;
        ELSIF (:NEW.NGAYBATDAU <= v_ngbd AND :NEW.NGAYKETTHUC >= v_ngkt) THEN
            temp := temp + 1;
        END IF;
    END LOOP;
    IF (temp >0 ) THEN 
        RAISE_APPLICATION_ERROR(-20987, 'DA CO KHACH DAT PHONG VAO NGAY: ' || v_ngbd);
    ELSE DBMS_OUTPUT.PUT_LINE('DAT PHONG THANH CONG'); 
    END IF;
END;


INSERT INTO DATPHONG VALUES ('DP30', 'KS2','KH1', 'P12', '02/10/2020', '04/10/2020', 'NV10'); --DAT PHONG THANH CONG

INSERT INTO DATPHONG VALUES ('DP31', 'KS2','KH10', 'P12', '01/10/2020', '05/10/2020', 'NV10'); --KHONG THANH CONG
INSERT INTO DATPHONG VALUES ('DP31', 'KS2','KH10', 'P12', '01/10/2020', '03/10/2020', 'NV10');  --KHONG THANH CONG
INSERT INTO DATPHONG VALUES ('DP31', 'KS2','KH10', 'P12', '03/10/2020', '09/10/2020', 'NV10');  --KHONG THANH CONG

INSERT INTO DATPHONG VALUES ('DP31', 'KS2','KH10', 'P12', '21/11/2020', '26/11/2020', 'NV10'); 

select * from DATPHONG where map='P12'
delete from DATPHONG where madp = 'DP30'

DROP TRIGGER TRG_DATPHONG_UPD_INS

