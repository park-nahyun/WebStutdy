SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)     NOT NULL
, TEL   VARCHAR2(30) 
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>>Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�۱��� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>>Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ���� ������ �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '�ڳ���', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '��ƺ�', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-5555-5555');



--�� Ȯ��
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--==>>
/*
1	�ڳ���	010-1111-1111
2	������	010-2222-2222
3	��ƺ�	010-3333-3333
4	������	010-4444-4444
5	������	010-5555-5555
*/

--�� Ŀ��
COMMIT;


--�� ȸ�� ��ü �� ��ȸ
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 5

--�� ȸ�� �˻�(SID)
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1
;
--==>> 1	�ڳ���	010-1111-1111

--�� ȸ�� ���� ����
UPDATE TBL_MEMBER SET NAME='�ڳ���', TEL='010-1100-1100' WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
--==>> 1	�ڳ���	010-1100-1100

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�
--==>> 1	�ڳ���	010-1111-1111


--�� ȸ�� ���� ����
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
--==>> 4


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� ���� ���̺� ����
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.




--�� ���̺� ����
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE��(��) �����Ǿ����ϴ�.


--�� ���� ������ �Է�
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 20, 30, 40)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBERSCORE;
--==>> 1	20	30	40

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


---�� ���� �Է� ������ ���ڵ� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
--==>> 1

--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;


--�� ���� ������ �˻� ������ ����(SID)
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--==>> 1 20, 30, 40

--> �� �� ����
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1  20 30 40


--�� ���� ������ ���� ������ ����

UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;

--> �� �� ����
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�

--�� ���� ������ ���� ������ ����
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;

--> �� �� ����
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� ��ü ������ ��ȸ ������ ���� �� ��� ����Ʈ ��ȸ �����ϵ��� ���� �� LEFT JUIN
--                              �� ������ Ÿ�� ����ȭ �� NVL
SELECT M.SID, M.NAME, M.TEL, NVL(S.KOR, -1) AS KOR, NVL(S.ENG, -1), NVL(S.MAT, -1) FROM TBL_MEMBER M, TBL_MEMBERSCORE S WHERE M.SID=S.SID(+)
;
--==>>
/*
1	�ڳ���	010-1111-1111	20	30	40
2	������	010-2222-2222	-1	-1	-1
3	��ƺ�	010-3333-3333	-1	-1	-1
4	������	010-4444-4444	-1	-1	-1
5	������	010-5555-5555	-1	-1	-1
*/


--�� ��ü ������ ��ȸ ���� �� ����(VIEW_MEMBERSCORE)
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL, NVL(S.KOR,-1) AS KOR, NVL(S.ENG,-1) AS ENG, NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);


--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ����Ʈ ��ȸ ������ ����
SELECT SID, NAME, KOR, ENG, MAT
    ,(KOR+ENG+MAT) AS TOT
    , ((KOR+ENG+MAT)/3) AS AVG
    , RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC)AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;

--�� ������ ��(VIEW_MEMBERSCORE)�� Ȱ���� ��ȣ �˻� ������ ����
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>> 1	�ڳ���	91	81	71


--�� ���������� ���ڵ� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;

--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1


--�� ��ȣ �˻� ��� ������ ����(���� ������ �Է� / ����)
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;