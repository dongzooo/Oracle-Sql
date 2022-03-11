/*
EMP ���̺� 
	empno : �����ȣ
	ename : �̸�
	job   : ����
	mgr   : �����ȣ
	hiredate : �Ի�����
	sal   : �޿�
	comm  : Ŀ�̼�
	deptno : �μ���ȣ

DEPT ���̺�
	deptno : �μ���ȣ
	dname  : �μ���
	loc    : ����
*/
-------------------------------------------------------------------*
--<<1>>  �μ���ȣ�� 10���� �μ��� ����� �����ȣ, �̸�, �޿��� ����϶�.
SELECT * FROM EMP;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 10;

--<<2>>  �����ȣ�� 7369�� ��� �� �̸�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT ENAME, HIREDATE, DEPTNO FROM EMP WHERE EMPNO=7369;

--<<3>>  �̸��� ALLEN�� ����� ��� ������ ����϶�.
SELECT * FROM EMP WHERE ENAME='ALLEN';

--<<4>>  �Ի����ڰ� 1981-02-20�� ����� �̸�, �μ���ȣ, �޿��� ����϶�.
SELECT ENAME, DEPTNO, SAL FROM EMP WHERE HIREDATE = '1981-02-20';

--<<5>>  ������ MANAGER�� �ƴ� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE JOB = 'MANAGER';

--<<6>>  �Ի����ڰ� 1981-04-02 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT * FROM EMP WHERE HIREDATE > '81-04-02' ORDER BY HIREDATE;

--<<7>>  �޿��� $800�̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL >= 800;

--<<8>>  �μ���ȣ�� 20���̻��� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE DEPTNO > 20;

--<<9>>  ������ K�� �����ϴ� ������� ���� �̸��� ���� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE ENAME > 'K' ORDER BY ENAME;

--<<10>>  �Ի����ڰ� 1981-12-09 ���� ���� �Ի��� ������� ��������� ����϶�.
SELECT * FROM EMP WHERE HIREDATE < '81-12-09';

--<<11>>  �����ȣ�� 7698 ���� �۰ų� ���� ������� �����ȣ�� �̸��� ����϶�.
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO <= 7698;

--<<12>>  �Ի����ڰ� 1981-04-02 ���� �ʰ� 1982-12-09 ���� ���� ����� �̸�, ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE HIREDATE > '81-04-02' AND HIREDATE < '82-12-09';

--<<13>>  �޿��� 1,600 ���� ũ�� 3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL > 1600 AND SAL<3000;

--<<14>>  �����ȣ�� 7654�� 7782 ���� �̿��� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE EMPNO <7654 OR EMPNO > 7782;

--<<15>>  �̸��� B�� J ������ ��� ����� ������ ����϶�.
SELECT * FROM EMP WHERE ENAME > 'B' AND ENAME < 'K' ;

--<<16>>  �Ի����ڰ� 81�� �̿ܿ� �Ի��� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YY') != 81;

--<<17>>  ������ MANAGER�� SALESMAN�� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN';
SELECT * FROM EMP WHERE JOB IN ('MANAGER','SALESMAN');

--<<18>>  �μ���ȣ�� 20,30���� ������ ������� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE  DEPTNO != 20 AND DEPTNO != 30;
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE DEPTNO NOT IN (20, 30);

--<<19>>  �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT EMPNO, ENAME, HIREDATE, DEPTNO FROM EMP WHERE INSTR(ENAME, 'S')=1;
SELECT EMPNO, ENAME, HIREDATE, DEPTNO FROM EMP WHERE ENAME LIKE 'S%';

--<<20>>  �Ի����ڰ� 81�⵵�� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YY')='81';
SELECT * FROM EMP WHERE HIREDATE LIKE '81%';

--<<21>>  �̸��� S�ڰ� ���ִ� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') !=0;

--<<22>>  �̸��� S�� �����ϰ� ���������ڰ� T�λ���� ��������� ����϶� (��, �̸�����ü 5�ڸ��̴�.>>
SELECT * FROM EMP WHERE  INSTR (ENAME, 'S') =1 AND SUBSTR(ENAME,LENGTH(ENAME),1)='T';
SELECT * FROM EMP WHERE ENAME LIKE 'S___T';

--<<23>>  �̸��� ù��° ���ڴ� ������� �ι�° ���ڰ� A�� ����� ������ ����϶�.
SELECT * FROM EMP WHERE INSTR (ENAME, 'A') =2;
SELECT * FROM EMP WHERE ENAME LIKE '_A%';

--<<24>>  Ŀ�̼��� NULL�� ����� ������ ����϶�.
SELECT * FROM EMP WHERE COMM IS NULL;

--<<25>>  Ŀ�̼��� NULL�� �ƴ� ����� ��������� ����϶�.
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--<<26>>  �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ�, ������ ����϶�.
SELECT * FROM EMP WHERE COMM IS NULL;

--<<27>>  �̸��� ù���ڰ� K�ν����ϰų� �μ���ȣ�� 30�λ���� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE  SUBSTR(ENAME,1,1)='K' OR DEPTNO=30;
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE  ENAME LIKE 'K%' OR DEPTNO=30;

--<<28>>  �޿��� $1,500�̻��̰� �μ���ȣ�� 30���� ����� ������ MANAGER�� ����� ������ ����϶�.
SELECT * FROM EMP WHERE SAL > 1500 AND DEPTNO =30;

--<<29>>  �μ���ȣ�� 30�� ����� �����ȣ�� SORT �϶�.
SELECT * FROM EMP WHERE DEPTNO =30 ORDER BY EMPNO;

--<<30>>  �޿��� ���������� SORT�϶�.
SELECT * FROM EMP ORDER BY SAL DESC;

--<<31>>  �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��������� ����϶�.
SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;

--<<32>>  �μ���ȣ�� DESCENDING SORT�ϰ� �̸������� ASCENDING SORT, �޿������� DESCENDING SORT�϶�.
SELECT * FROM EMP ORDER BY DEPTNO DESC, ENAME ASC, SAL DESC;


