--<<1>> EMP와 DEPT TABLE을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하라.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;

--<<2>> 이름이 'ALLEN'인 사원의 부서명을 출력하라.
SELECT D.DNAME FROM EMP E, DEPT D WHERE E.ENAME ='ALLEN' AND E.DEPTNO = D.DEPTNO;

--<<3>> EMP Table의 데이터를 출력하되 해당사원에대한 상관번호와 상관의성명을 함께 출력하라. 
SELECT E1.ENAME , E2.MGR, E2.ENAME FROM EMP E1, EMP E2 WHERE E1.MGR = E2.EMPNO;

--<<4>> DEPT Table 에는 존재하는 부서코드이지만 해당부서에 
--근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
SELECT DEPTNO FROM DEPT WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>0);

--<<5>> 'ALLEN'의 직무와 같은사람의 이름, 부서명, 급여, 직무를 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL, E.JOB FROM EMP E, DEPT D where e.deptno = d.deptno AND  E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

SELECT E2.ENAME, D.DNAME, E2.SAL, E2.JOB  FROM EMP E1, EMP E2, DEPT D WHERE  (E1.ENAME = 'ALLEN' AND E1.JOB = E2.JOB) AND E1.DEPTNO = D.DEPTNO; 

select e.ename, d.dname, e.sal, e.job 
   from emp e, dept d 
   where e.deptno = d.deptno 
   and e.job = (select job from emp where ename = 'ALLEN');
--<<6>> 'JONES'가 속해있는 부서의 모든사람의 사원번호, 이름, 입사일자, 급여를 출력하라.
SELECT E1.EMPNO ,E2.ENAME, E2.HIREDATE, E2.SAL  FROM EMP E1, EMP E2  WHERE E1.ENAME = 'JONES' AND E1.DEPTNO = E2.DEPTNO;
SELECT EMPNO, ENAME, HIREDATE , SAL FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');

--<<7>> 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
SELECT E.EMPNO,E.ENAME, D.DNAME, E.HIREDATE, D.LOC, SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.SAL > (SELECT AVG(SAL) FROM EMP);

--<<8>> 10번 부서사람들중에서 20번부서의 사원과 같은 업무를 하는 사원의 
--사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 AND E.JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = 20);

--<<9>> 10번 부서중에서 30번부서에는 없는 업무를 하는 사원의 
--사원번호, 이름, 부서명, 입사일자, 지역을 출력하라.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 AND E.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);

--<<10>> 10번 부서에 근무하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은순으로 출력하라.
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC, E.SAL FROM EMP E ,DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10 ORDER BY E.SAL DESC;

--<<11>> 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('MARTIN','SCOTT'));

--<<12>> 급여가 30번 부서의 최고 급여 보다 높은사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO, ENAME ,SAL FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO =30);

--<<13>> 급여가 30번 부서의 최저급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
SELECT EMPNO , ENAME, SAL FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE  DEPTNO = 30);
