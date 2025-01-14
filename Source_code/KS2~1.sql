--L?Y TH�NG TIN KH�CH H�NG (KH.MaKH, TenKH, CMND, DP.MaDP, DP.MaP, NGAYBATDAU) ?� ??T LO?I PH�NG ?on T?I KH�CH S?N 'Ma Vi' V� C� QU?C T?CH 'Viet Nam'

SELECT KH.MaKH, TenKH, CMND, DP.MaDP, DP.MaP, NGAYBATDAU
FROM DATPHONG DP, KHACHHANG KH, KHACHSAN KS, PHONG P, LOAIPHONG LP
WHERE DP.MAKH = KH.MAKH AND DP.MAKS = KS.MAKS 
	AND DP.MAP = P.MAP AND LP.MALP = P.MALP
	AND LP.MOTA = 'Don' AND TENKS = 'Ma Vi' AND QUOCTICH = 'Viet Nam'
    
--------

SELECT /*+ GATHER_PLAN_STATISTICS */  KH.MaKH, TenKH, CMND, DP.MaDP, DP.MaP, NGAYBATDAU
FROM DATPHONG DP, KHACHHANG KH, KHACHSAN KS, PHONG P, LOAIPHONG LP
WHERE DP.MAKH = KH.MAKH AND DP.MAKS = KS.MAKS 
	AND DP.MAP = P.MAP AND LP.MALP = P.MALP
	AND LP.MOTA = 'Don' AND TENKS = 'Ma Vi' AND QUOCTICH = 'Viet Nam'

SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));


