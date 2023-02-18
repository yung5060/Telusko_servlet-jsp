select * from tab;

desc TB_CUST_WHITE_LIST;

select * from TB_CUST_WHITE_LIST ORDER BY CUST_INFO ASC, CHNL_DV_CD ASC;

SELECT B.CHNL_DV_CD, B.CUST_INFO, B.PPRT_DTM FROM (
			SELECT ROWNUM RN, A.* FROM (
				SELECT * FROM TB_CUST_WHITE_LIST ORDER BY CUST_INFO ASC, CHNL_DV_CD ASC
			) A
		) B WHERE RN BETWEEN 1 AND 4;
        
INSERT INTO TB_CUST_WHITE_LIST (CHNL_DV_CD, CUST_INFO)
VALUES ('K', '01000000000');
INSERT INTO TB_CUST_WHITE_LIST (CHNL_DV_CD, CUST_INFO)
VALUES ('L', '01000000000');
INSERT INTO TB_CUST_WHITE_LIST (CHNL_DV_CD, CUST_INFO)
VALUES ('M', '01000000000');
INSERT INTO TB_CUST_WHITE_LIST (CHNL_DV_CD, CUST_INFO)
VALUES ('S', '01000000000');
COMMIT;

INSERT INTO TB_CUST_WHITE_LIST(CUST_INFO, CHNL_DV_CD, PPRT_DTM) (
    SELECT REPLACE(REPLACE(REPLACE('010-6688 7886','-',''),'_',''),' ','') CUST_INFO,
    DECODE (LEVEL,1,'S',2,'L',3,'M',4,'K',Level) CHNL_DV_CD,
    SYSDATE AS PPRT_DTM
    FROM TB_CUST_WHITE_LIST
    CONNECT BY LEVEL <= 4
    MINUS
    SELECT CUST_INFO, CHNL_DV_CD, SYSDATE AS PPRT_DTM
    FROM TB_CUST_WHITE_LIST
    WHERE CUST_INFO = REPLACE(REPLACE(REPLACE('010-6688 7886','-',''),'_',''),' ','')
);
COMMIT;