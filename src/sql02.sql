/*
���̺� ���� : CREATE

CREATE TABLE [���̺��] (
�÷��� �÷������� Ÿ�� (�ɼ�),
�÷��� �÷������� Ÿ�� (�ɼ�),
...
);

�÷��� : ���ĺ� �ҹ��� �ٿ���
������Ÿ�� : �ݵ�� ��� ���ڿ� : VARCHAR2
�ɼ� : �������� CONTRAINT �������� : �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���� �������� ��Ģ�� ���� ���� ��

NOT NULL : NULL ���� �Ѿ�� �� ����
UNIQUE : �ߺ� ��� �� �� ����
PRIMARY KEY : �߿���, NOT NULL + UNIQUE ���·� ���̺� �Ѱ��� �ִ� ���´� ����, ���̺�� �Ѱ� �÷��� PK��������
���ڵ� ���� ���� ���

FOREIGN KEY : �ΰ� ���̺��� ���� ��ų �� �ٸ� ���̺��� PK�� �Ǵ� Į���� ���� ���̺� FK�� ����

DEFAULT : ����Ʈ �� ����

CHECK : ���� üũ �� �˻��ϰ� �� �� �ִ�

* ���̺� ������ ���ǻ���
- ���̺� �̸��� �÷��� ���ĺ����� ����
A-Z����, 0-9����, $#_��밡��, ����x
-�÷� ����� ���Ұ�
- �� �������� ���̺�� �ߺ� �Ұ�
- �����̺� �ȿ��� �÷��̸��� �ߺ� �Ұ�, �ٸ� ���̺����� �÷� �̸��� �����ص� ����

*/

CREATE TABLE TEST(
    ID VARCHAR2(50) PRIMARY KEY,
    PW VARCHAR2(50) NOT NULL,
    AGE NUMBER DEFAULT 1,
    REG DATE DEFAULT SYSDATE
);

--����ڰ� ������ ���̺� ��ȸ
SELECT TABLE_NAME FROM USER_TABLE;

--���̺� ���� Ȯ��
DESC TEST;
SELECT * FROM TEST;

/*
2. ���ڵ��߰� : INSERT NOT NULL �Ӽ��� ���� �÷����� �ݵ�� ���� �־��ֱ�;
    1)��� �÷��� ������ �߰�
    INSERT INTO [���̺��] VALUES( [���� ��ǥ �����ڷ� �÷�������� ����;] )
    
    2)���ϴ� �÷��� ������ �߰�
    INSERT INTO [���̺�� (�÷���, �÷���,..)] VALUES ( [�÷��� �ۼ��� ������� ���� ����]);
 
*/

INSERT INTO TEST VALUES('JAVA', '1234', 20, SYSDATE);
INSERT INTO TEST (PW,ID,AGE,REG) VALUES('JAVA01', '1234', 20, SYSDATE); --���� ���� �ȉ�

INSERT INTO TEST(ID, PW) VALUES('JAVA01', '0000');
SELECT * FROM TEST;

INSERT INTO TEST VALUES('JAVA02', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA03', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA04', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA05', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA06', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA07', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA08', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA09', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA10', '1234', 20, SYSDATE);
INSERT INTO TEST VALUES('JAVA11', '1000', 24, SYSDATE);

SELECT * FROM TEST WHERE PW = '1000';
SELECT * FROM TEST ORDER BY ID DESC;

/*
    1)�ϰ� ����
    UPDATE [���̺��] SET [�÷��� = ��]
    2) ���ڵ� ���� ����
    UPDATE [���̺��] SET [�÷���=��] (, �÷���=��, ...)
    WHERE [���ǽ�]
*/

SELECT *FROM TEST;
UPDATE TEST SET PW='0000';
COMMIT;

UPDATE TEST SET PW='1234' WHERE ID = 'JAVA01';
COMMIT;

UPDATE TEST SET PW='1111' WHERE AGE =1;
SELECT *FROM TEST;

INSERT INTO TEST VALUES('JAVA13', '1234', 10, SYSDATE);
SELECT *FROM TEST;

/*
4. ���ڵ� ���� : DELETE
    1) ��ü �ڵ� ����
    DELETE FROM [���̺��]
    TRUNCATE TABEL [���̺��]
    
    2) ���ڵ� ���� ����
    DELETE FROM [���̺��]
    WHERE [���ǽ�]
*/

DELETE FROM TEST WHERE ID ='JAVA';
SELECT *FROM TEST;

--DELETE FROM TEST; ���ڵ� ��ü������
--TRUNCATE TABLE TEST; ���ڵ� ��� ������ �����ϴ� ������ �ݳ�

/*
5. ���̺� ���� ���� : ALTER
 1) �÷� �߰�
    ALTER  TABLE [���̺��] ADD ( [�÷��� ������ Ÿ��](�ɼ�) )
    �÷��� �÷����̿� �߰� �Ұ� �׻� �ǵڿ� �߰�
    ���̺� �̹� �����Ͱ� �� ���� ���� NOT NULL �ɼ� �ټ��� ����. DEFAULT ����
    
 2) �÷� Ÿ�� ����
    ALTER TABLE [���̺� ��] MODIFY (�÷��� ������ Ÿ�� (�ɼ�) );
    *�÷����� �� �������
    - �ش� �÷��� ũ�⸦ �ø� ���� ������ �������� ����, ���� ������ �Ѽ� ���
    - �ش� �÷��� NULL������ ������ �ְų� ���̺� �ƹ� ���ڵ尡 ������ �÷��� ũ�⸦ ���� �� �ִ�.
    - �ش� �÷��� NULL ������ ������ ������ ������ ������ ������ �� �ִ�
    - �ش� �÷��� DEFAULT ���� �ٲٸ� ���� ���Ŀ� �߻��ϴ� ���ڵ� ���Կ��� ������ �ش�. ������ �״��
    - �ش� �÷��� NULL���� ���� ��쿡�� NOT NULL �������� �߰�����
    
 3) �÷� �̸� ���� ALTER - RENAME
    ALTER TABLE [���̺��] RENAME COLUMN [�� �÷���] TO [���÷���];
 4) �÷� ����
    ALTER TABLE [���̺��] DROP COLUMN [�÷���]
*/

SELECT * FROM TEST;
--�÷��߰�
ALTER TABLE TEST ADD(NAME VARCHAR(50));
COMMIT;

--�÷�Ÿ�� ����
ALTER TABLE TEST MODIFY(NAME NUMBER);
DESC TEST;

--�÷��̸� ����
ALTER TABLE TEST RENAME COLUMN NAME TO NICKNAME;

--�÷�����
ALTER TABLE TEST DROP COLUMN NICKNAME;

/*
6. ���̺� ���� : DROP
: ���̺� ��ü�� ����

DROP TABLE [���̺��]
*/

--DROP TABLE TEST

/*
7. ����(��Ī) : ALIAS
    : ��ȸ�� ����� ������ ����(ALIAS)�� �ο��ؼ� �÷� ���̺��� ������ �� �ִ�.
    ���� ���̺��� �÷����� ������� �ʰ�, �˻��� ǥ�� �������� �ѹ� �ٴ´�.
    
    SELECT [�÷���] [����], [Į����] [����] FRORM [���̺��]
    SELECT [�÷���] AS [����], [Į����] AS [����] FRORM [���̺��]
    
    ������ �÷��� �ٷ� �ڿ� �ۼ�
    �÷���� ���� ���̿� AS, as Ű���带 ����� ���� �ִ�
    ������ �ֵ���ǥ�� ��� ǥ���ϸ� ���� �����̳� Ư�����ڸ� ���Խ�ų �� �ְ� �� �ҹ��� �����ϰ� �� ���� �ִ�.
    FROM���� ���̺� ALIAS�� �����ϸ�, SELECT ���忡�� ���̺�� ��� ��� ����
*/
SELECT ID, PW FROM TEST;
SELECT ID ���̵�, PW ��й�ȣ FROM TEST;
SELECT ID AS "��� ���̵�", PW AS "��� ��й�ȣ" FROM TEST AS T;
SELECT T.ID "����� ���̵�", T.PW "����� ��й�ȣ" FROM T;

/*
8. Ʈ������
������ ó���� �� ����
Ʈ������ : ���� Ŀ���� �Ͼ �� ~ ���� Ŀ�� �������� �۾�

9. �׷��Լ�
1) ����
    COUNT : �������� ����
    SUM : ����
    AVG : ���
    MAX : �������� ū��
    MIN : �������� ���� ������
*/
SELECT COUNT(*) FROM TEST;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*), COUNT(COMM) FROM EMP;

SELECT SUM(COMM) FROM EMP;
SELECT AVG(COMM) FROM EMP; --�� ������ ��
SELECT AVG(NVL(COMM,0)) FROM EMP; --NULL�� ī��Ʈ�ؼ� ��ü���
SELECT MAX(HIREDATE) FROM EMP;
SELECT MIN(HIREDATE) FROM EMP;
SELECT * FROM EMP;

/*
10. GROUP BY : Ư�� �������� �������� �׷�ȭ
    GROUP BY [�׷��� ����]
    *WHERE �� ��, ORDER BY ��.
*/
SELECT DEPTNO, COUNT(*) FROM EMP GROUP BY DEPTNO ORDER BY 2 DESC;
--WHERE

--JOB�� �������� �� ������ �ش��ϴ� ������� ������ ��� �޿�, �ְ� �޿�, �޿��հ�
SELECT JOB, COUNT(*) "�ο���", AVG(SAL)  "��ձ޿�", MAX(SAL) "�ְ�޿�", MIN(SAL) "�����޿�" , SUM(SAL) "�޿��հ�" FROM EMP GROUP BY JOB;

--11. WHERE ������ �����ռ� �Ұ�
-- �����Լ��� ���� ���� �� ���

--JOB���� �������� 3���̻��� JOB�ο��� ���
SELECT JOB, COUNT(*) "������" FROM EMP GROUP BY JOB HAVING COUNT(*) >=3;

--��ü ������ 5000�� �ʰ��ϴ� JOB�� ����, JOB�� �� �޿� �հ踦 ��ȸ, ��, JOB�� 'SALES'�� �����ϰ� �� �޿� �հ�� �������� ����
SELECT JOB, SUM(SAL) "�޿��հ�" FROM EMP WHERE JOB !='SALESMAN' GROUP BY JOB HAVING SUM(SAL)>5000 ORDER BY SUM(SAL) DESC;

/*
12. �������� : ���� �ȿ� �������� �ۼ��ϴ� ����
    SELECT * FROM [���̺��];
    SELECT * FROM (����������);
    SELECT * FROM (���������� (��������))
*/

SELECT * FROM (SELECT EMPNO, ENAME, SAL FROM EMP);
SELECT EMPNO, SAL FROM (SELECT EMPNO, ENAME, SAL FROM EMP);
SELECT * FROM EMP;

--�����ȣ 7900�� ������ ������ ���� ������ ���� ����� �ϸ��� ���� ���
SELECT ENAME,JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO=7900);

/*
13. JOIN 
    : �� �̻��� ���̺��� �����Ͽ� �����и� �˻��ϴ� ���
    �� ���̺� ��� �Ѱ��� �÷��� ���� �����ϴ� ���¿��� �Ѵ�.
    ���ڵ� ���� ���� �տ����� ���� ������
    
    TEST A,B,C,D,E
    ����ȭ : �ϳ��� ���̺��� ���� ���� ���̺�� �������� �������� �и��ϴ� ���
    ����ȭ�� ���� ���̺������ �ִ� �����͵��� �����ؼ� �������� ����� ����
    
    [ORACLE JOIN]
    SELECT A.COL1, B.COL1 FROM TABLE A, TABLE2 B WHERE A.COL2 = B.COL2;
    [ANSI JOIN]
    SELECT A.COL1, B.COL1 FROM TABLE A [INNER] TABLE2 B ON A.COL2=B.COL2;
    
    1) EQUI JOIN �����
    
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT * FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO;

SELECT EMPNO, ENAME, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
--ANSI
SELECT E.EMPNO ,E.ENAME, D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

SELECT S.NAME �л��̸�, P.NAME �������� FROM STUDENT S, PROFESSOR P WHERE S.PROFNO=P.PROFNO;

SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;

/*
14. SELF JOIN
    �����ϰ� ���� �����Ͱ�  �ϳ��� ���̺� �� ��� �ִ� ���
*/
-- ������ȣ, �����̸��� �ش� ������ ����� �̸� ���
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME FROM EMP E1,EMP E2 WHERE E1.MGR = E2.EMPNO;

/*
15. ������ SEQUENCE
    : ������ ���� ������ �ִ� ����Ŭ ��ü
    �������� �����ϸ� PK�� ���� ���������� �����ϴ� Į���� �ڵ������� ������ �� �ִ�.
    NUMBER Ÿ���� PK ���� ������ �� ���.
    �������� ���̺���� ���������� ����ǰ� �����ȴ�.
    
    1) ������ ����
        CREATE SEQUENCE [��������] (�ɼ�);
        *�ɼ� : ��������
        START WITH N : �������� ���۰� ����
        INCREMENT BY N : ������ ����, DEFAULT 
        MAXVALUE : �ִ밪
        MINVALUE : �ּҰ�
        CYCLE / NOCYCLE : �ִ밪 ���޽� ��ȯ����
        CACHE N / NOCACHE : ������ �����ӵ��� �����ϱ� ���� ĳ�̿��� ����
        
        ������ �� : ���̺��_SEQ, SEQ_���̺��
        
    2) ������ ���
        ������ ��.CURRVAL : ������� ������ ��ȣ.
        ������ ��.NEXTVAL : ������ȣ
    3) ������ ����
        DROP SEQUENCE TEST_SEQ;
*/
CREATE SEQUENCE TEST_SEQ NOCACHE;
COMMIT; 
SELECT TEST_SEQ.NEXTVAL FROM DUAL;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;

SELECT * FROM TEST;
INSERT INTO TEST VALUES('PIKACHU','1111', TEST_SEQ.NEXTVAL, SYSDATE);


-- ����1. student(�л�), department(�а�), professor(����) ���̺� join �Ͽ� 
--      �л��̸�, �л����а��̸�(dname), ���������̸� ���  
--       ��, �л��� �а��� DEPTNO1�� �������� ã�� 
-- ����2. student ���̺��� ��ȸ�Ͽ� 1������ 101���� �л����� �̸��� 
--      �� �л����� ���������̸��� ����ϼ���.

--1
SELECT S.NAME �л��̸� ,D.DNAME �а��̸�, P.NAME �������� FROM STUDENT S, DEPARTMENT D, PROFESSOR P WHERE S.DEPTNO1 = D.DEPTNO AND S.PROFNO=P.PROFNO;
--2
SELECT DISTINCT S.NAME �л��̸�, P.NAME �������� FROM STUDENT S, PROFESSOR P, DEPARTMENT D WHERE S.PROFNO=P.PROFNO AND S.DEPTNO1=101;
SELECT * FROM STUDENT;