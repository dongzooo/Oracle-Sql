--<<1>> EMP�� DEPT TABLE�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;

--<<2>> �̸��� 'ALLEN'�� ����� �μ����� ����϶�.
SELECT D.DNAME FROM EMP E, DEPT D WHERE E.ENAME ='ALLEN' AND E.DEPTNO = D.DEPTNO;

--<<3>> EMP Table�� �����͸� ����ϵ� �ش��������� �����ȣ�� ����Ǽ����� �Բ� ����϶�. 
SELECT E1.ENAME , E2.MGR, E2.ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;

--<<4>> DEPT Table ���� �����ϴ� �μ��ڵ������� �ش�μ��� 
--�ٹ��ϴ� ����� �������� �ʴ� ����� ����� ����϶�.
SELECT DEPTNO FROM DEPT WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>0);

--<<5>> 'ALLEN'�� ������ ��������� �̸�, �μ���, �޿�, ������ ����϶�.
SELECT E2.ENAME, D.DNAME, E2.SAL, E2.JOB  FROM EMP E1, EMP E2, DEPT D WHERE  (E1.ENAME = 'ALLEN' AND E1.JOB = E2.JOB) AND E1.DEPTNO = D.DEPTNO; 

--<<6>> 'JONES'�� �����ִ� �μ��� ������� �����ȣ, �̸�, �Ի�����, �޿��� ����϶�.
SELECT E1.EMPNO ,E2.ENAME, E2.HIREDATE, E2.SAL  FROM EMP E1, EMP E2  WHERE E1.ENAME = 'JONES' AND E1.DEPTNO = E2.DEPTNO;
SELECT EMPNO, ENAME, HIREDATE , SAL FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');

--<<7>> ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.
SELECT E.EMPNO,E.ENAME, D.DNAME, E.HIREDATE, D.LOC, SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.SAL > (SELECT AVG(SAL) FROM EMP);

--<<8>> 10�� �μ�������߿��� 20���μ��� ����� ���� ������ �ϴ� ����� 
--�����ȣ, �̸�, �μ���, �Ի���, ������ ����϶�.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 AND E.JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = 20);

--<<9>> 10�� �μ��߿��� 30���μ����� ���� ������ �ϴ� ����� 
--�����ȣ, �̸�, �μ���, �Ի�����, ������ ����϶�.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 AND E.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);

--<<10>> 10�� �μ��� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���, ����, �޿��� �޿��� ���������� ����϶�.
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC, E.SAL FROM EMP E ,DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 ORDER BY E.SAL DESC;

--<<11>> 'MARTIN'�̳� 'SCOTT'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('MARTIN','SCOTT'));

--<<12>> �޿��� 30�� �μ��� �ְ� �޿� ���� ��������� �����ȣ, �̸�, �޿��� ����϶�.
SELECT EMPNO, ENAME ,SAL FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO =30);

--<<13>> �޿��� 30�� �μ��� �����޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
SELECT EMPNO , ENAME, SAL FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE  DEPTNO = 30);
