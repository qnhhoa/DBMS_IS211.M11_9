

SELECT C.MAP, C.MAKS, C.MAKH, NGAYBATDAU, TENKH, CMND FROM
(SELECT B.MAP, B.MAKS, MAKH, NGAYBATDAU FROM
(SELECT DP.MAP, MAKS, MAKH, NGAYBATDAU FROM
(SELECT P.MAP FROM (SELECT MALP FROM LOAIPHONG WHERE MOTA = 'Don') LP INNER JOIN (SELECT MAP, MALP FROM PHONG) P ON LP.MALP = P.MALP) A 

INNER JOIN (SELECT MADP, MAP, MAKS, MAKH, NGAYBATDAU FROM DATPHONG) DP ON DP.MAP = A.MAP) B

INNER JOIN (SELECT MAKS FROM KHACHSAN WHERE TENKS='Ma Vi') KS ON B.MAKS = KS.MAKS ) C 

INNER JOIN (SELECT MAKH, TENKH, CMND FROM KHACHHANG WHERE QUOCTICH = 'Viet Nam') KH ON C.MAKH = KH.MAKH

------------

SELECT /*+ GATHER_PLAN_STATISTICS */ C.MAP, C.MAKS, C.MAKH, NGAYBATDAU, TENKH, CMND FROM
(SELECT B.MAP, B.MAKS, MAKH, NGAYBATDAU FROM
(SELECT DP.MAP, MAKS, MAKH, NGAYBATDAU FROM
(SELECT P.MAP FROM (SELECT MALP FROM LOAIPHONG WHERE MOTA = 'Don') LP INNER JOIN (SELECT MAP, MALP FROM PHONG) P ON LP.MALP = P.MALP) A 

INNER JOIN (SELECT MADP, MAP, MAKS, MAKH, NGAYBATDAU FROM DATPHONG) DP ON DP.MAP = A.MAP) B

INNER JOIN (SELECT MAKS FROM KHACHSAN WHERE TENKS='Ma Vi') KS ON B.MAKS = KS.MAKS ) C 

INNER JOIN (SELECT MAKH, TENKH, CMND FROM KHACHHANG WHERE QUOCTICH = 'Viet Nam') KH ON C.MAKH = KH.MAKH


SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));

