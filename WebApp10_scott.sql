SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TAB;


SELECT *
FROM TBL_MEMBER;

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

-- ������ ��ġ�� �ʰ� ����

--�� ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.


--�� ���� ������ ����
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


-- �� �ǽ� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.


--�� ������ ����
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ��(��) �����Ǿ����ϴ�.


--�� ������ �Է� ������ ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111');
--> �� �� ����
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '������', '010-1111-1111')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.



--�� ���̺� ��ü ��ȸ ������ ����

SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;

--> �� �� ����
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;


--�� �ο� �� Ȯ�� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;

--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
--==>> 1

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�


--�� ������ �߰� �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '�ڳ���', '010-1212-1212');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
--------------------------------------------------------------------------------