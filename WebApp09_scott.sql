
SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
--=>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(TBL_SCORE)
CREATE TABLE TBL_SCORE
( SID  NUMBER
, NAME VARCHAR2(30)
, KOR  NUMBER(3)
, ENG  NUMBER(3)
, MAT  NUMBER(3)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� ������ ���̺� �������� �߰�
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID);

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100);

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100);

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100);

--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.  *4


--�� ���� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���� ������ ���� ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.

--�� Ŀ��
COMMIT;




--�� ����Ʈ ��ȸ ������ ����
SELECT SID, NAME, KOR, ENG, MAT
     , KOR+MAT+ENG AS TOT
     , (KOR+MAT+ENG)/3 AS AVG
FROM TBL_SCORE
ORDER BY SID;

--> �� �� ����
SELECT SID, NAME, KOR, ENG, MAT, KOR+MAT+ENG AS TOT, (KOR+MAT+ENG)/3 AS AVG FROM TBL_SCORE ORDER BY SID
;

--�� ������ �Է� ������ ����
INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '������', 50, 20, 70)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.