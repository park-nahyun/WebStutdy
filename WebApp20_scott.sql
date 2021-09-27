SELECT USER
FROM DUAL;
--==>> SCOTT


SELECT *
FROM TAB;




--�� ���� ���̺� ����
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.



--�� TBL_BOARD ���̺� ���� (�Խ��� ���� ���̺� ����)
CREATE TABLE TBL_BOARD  
( NUM       NUMBER(9)            NOT NULL   -- �Խù� ��ȣ
, NAME      VARCHAR2(30)         NOT NULL   -- �Խù� �ۼ���
, PWD       VARCHAR2(20)         NOT NULL   -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                    -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)        NOT NULL   -- �Խù� ����
, CONTENT   VARCHAR2(4000)       NOT NULL   -- �Խù� ����
, IPADDR    VARCHAR2(20)                    -- ������ Ŭ���̾�Ʈ�� IP �ּ�
, HITCOUNT  NUMBER DEFAULT 0     NOT NULL   -- �Խù� ��ȸ��
, CREATED   DATE DEFAULT SYSDATE NOT NULL   -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)  -- �Խù� ��ȣ�� PK �������� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.



--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����

SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;
--> �� �� �� ��
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;


--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '������', '1234', 'joon@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE);
--> �� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '������', '1234', 'joon@test.com', '�ۼ��׽�Ʈ', '���빰�ۼ�', '211.238.142.152', 0, SYSDATE)
;

--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
-- �Խù� ��ȣ �ִ밪 : �Խù� ����ϴ� �ۼ��ڰ� ���� �Խù� ��ȣ �� ������ Ȯ������ �ʴ´�. �ڵ����� Ȯ���ؼ� INSERT..
-- DB ���ڵ� �� : �Խ��� ��ȣ..? �װ� �ۻ�Ǹ� �˾Ƽ� �پ���� ��..�������� �������� ������ �ҷ����� �� ����Ʈ�� �ٸ�����



--�� Ư�� ������(���۹�ȣ ~ ����ȣ) �Խù��� ����� �о���� ������ ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM
(
    SELECT ROWNUM RNUM, DATA.*      -- ROW_NUM ���ȣ ���̴� ��. �׳� NUM���� �����ϸ� ������ �Ź� �޶��� ��.. �߰��� �ۻ�� ���� �����ϱ�
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    )DATA
)
WHERE RNUM >= 1 AND RNUM <= 10;

--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM RNUM, DATA.* FROM(SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC )DATA) WHERE RNUM >= 1 AND RNUM <= 10
;


--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ ȸ�� ���� ������ ����
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=1
;


--�� Ư�� �Խù��� ������ �о���� ������ ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
     , IPADDR, HITCOUNT, CREATED
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED FROM TBL_BOARD WHERE NUM=1
;

--�� Ư�� �Խù��� �����ϴ� ������ ����
DELETE
FROM TBL_BOARD
WHERE NUM=1;
--> �� �� ����
DELETE FROM TBL_BOARD WHERE NUM=1
;


--�� Ư�� �Խù��� �����ϴ� ������ ���� (�� Article.jsp ������ ������ ó��)
UPDATE TBL_BOARD
SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?
WHERE NUM=1;
--> �� �� ����
UPDATE TBL_BOARD SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=? WHERE NUM=1
;


--�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>9999;
--> �� �� ����
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>9999
;


--�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM<9999;
--> �� �� ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9999
;


DELETE
FROM TBL_BOARD;

SELECT *
FROM TBL_BOARD;

COMMIT;



