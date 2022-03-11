/*
EMP 테이블 
	empno : 사원번호
	ename : 이름
	job   : 직무
	mgr   : 상관번호
	hiredate : 입사일자
	sal   : 급여
	comm  : 커미션
	deptno : 부서번호

DEPT 테이블
	deptno : 부서번호
	dname  : 부서명
	loc    : 지역
*/
-------------------------------------------------------------------*
--<<1>>  부서번호가 10번인 부서의 사람중 사원번호, 이름, 급여를 출력하라.
SELECT * FROM EMP;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO = 10;

--<<2>>  사원번호가 7369인 사람 중 이름, 입사일자, 부서번호를 출력하라.
SELECT ENAME, HIREDATE, DEPTNO FROM EMP WHERE EMPNO=7369;

--<<3>>  이름이 ALLEN인 사람의 모든 정보를 출력하라.
SELECT * FROM EMP WHERE ENAME='ALLEN';

--<<4>>  입사일자가 1981-02-20인 사원의 이름, 부서번호, 급여를 출력하라.
SELECT ENAME, DEPTNO, SAL FROM EMP WHERE HIREDATE = '1981-02-20';

--<<5>>  직업이 MANAGER가 아닌 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE JOB = 'MANAGER';

--<<6>>  입사일자가 1981-04-02 이후에 입사한 사원의 정보를 출력하라.
SELECT * FROM EMP WHERE HIREDATE > '81-04-02' ORDER BY HIREDATE;

--<<7>>  급여가 $800이상인 사람의 이름, 급여, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL >= 800;

--<<8>>  부서번호가 20번이상인 사원의 모든정보를 출력하라.
SELECT * FROM EMP WHERE DEPTNO > 20;

--<<9>>  성명이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE ENAME > 'K' ORDER BY ENAME;

--<<10>>  입사일자가 1981-12-09 보다 먼저 입사한 사람들의 모든정보를 출력하라.
SELECT * FROM EMP WHERE HIREDATE < '81-12-09';

--<<11>>  사원번호가 7698 보다 작거나 같은 사람들의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME FROM EMP WHERE EMPNO <= 7698;

--<<12>>  입사일자가 1981-04-02 보다 늦고 1982-12-09 보다 빠른 사원의 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE HIREDATE > '81-04-02' AND HIREDATE < '82-12-09';

--<<13>>  급여가 1,600 보다 크고 3,000보다 작은 사람의 이름, 직무, 급여를 출력하라.
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL > 1600 AND SAL<3000;

--<<14>>  사원번호가 7654와 7782 사이 이외의 사원의 모든정보를 출력하라.
SELECT * FROM EMP WHERE EMPNO <7654 OR EMPNO > 7782;

--<<15>>  이름이 B와 J 사이의 모든 사원의 정보를 출력하라.
SELECT * FROM EMP WHERE ENAME > 'B' AND ENAME < 'K' ;

--<<16>>  입사일자가 81년 이외에 입사한 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YY') != 81;

--<<17>>  직무가 MANAGER와 SALESMAN인 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN';
SELECT * FROM EMP WHERE JOB IN ('MANAGER','SALESMAN');

--<<18>>  부서번호가 20,30번을 제외한 모든사람의 이름, 사원번호, 부서번호를 출력하라.
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE  DEPTNO != 20 AND DEPTNO != 30;
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE DEPTNO NOT IN (20, 30);

--<<19>>  이름이 S로 시작하는 사원의 사원번호, 이름, 입사일자, 부서번호를 출력하라.
SELECT EMPNO, ENAME, HIREDATE, DEPTNO FROM EMP WHERE INSTR(ENAME, 'S')=1;
SELECT EMPNO, ENAME, HIREDATE, DEPTNO FROM EMP WHERE ENAME LIKE 'S%';

--<<20>>  입사일자가 81년도인 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YY')='81';
SELECT * FROM EMP WHERE HIREDATE LIKE '81%';

--<<21>>  이름중 S자가 들어가있는 사람만 모든정보를 출력하라.
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') !=0;

--<<22>>  이름이 S로 시작하고 마지막글자가 T인사람의 모든정보를 출력하라 (단, 이름은전체 5자리이다.>>
SELECT * FROM EMP WHERE  INSTR (ENAME, 'S') =1 AND SUBSTR(ENAME,LENGTH(ENAME),1)='T';
SELECT * FROM EMP WHERE ENAME LIKE 'S___T';

--<<23>>  이름이 첫번째 문자는 관계없고 두번째 문자가 A인 사람의 정보를 출력하라.
SELECT * FROM EMP WHERE INSTR (ENAME, 'A') =2;
SELECT * FROM EMP WHERE ENAME LIKE '_A%';

--<<24>>  커미션이 NULL인 사람의 정보를 출력하라.
SELECT * FROM EMP WHERE COMM IS NULL;

--<<25>>  커미션이 NULL이 아닌 사람의 모든정보를 출력하라.
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--<<26>>  부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
SELECT * FROM EMP WHERE COMM IS NULL;

--<<27>>  이름의 첫글자가 K로시작하거나 부서번호가 30인사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE  SUBSTR(ENAME,1,1)='K' OR DEPTNO=30;
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE  ENAME LIKE 'K%' OR DEPTNO=30;

--<<28>>  급여가 $1,500이상이고 부서번호가 30번인 사원중 직업이 MANAGER인 사람의 정보를 출력하라.
SELECT * FROM EMP WHERE SAL > 1500 AND DEPTNO =30;

--<<29>>  부서번호가 30인 사람중 사원번호를 SORT 하라.
SELECT * FROM EMP WHERE DEPTNO =30 ORDER BY EMPNO;

--<<30>>  급여가 많은순으로 SORT하라.
SELECT * FROM EMP ORDER BY SAL DESC;

--<<31>>  부서번호로 ASCENDING SORT한 후 급여가 많은 사람순으로 출력하라.
SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;

--<<32>>  부서번호로 DESCENDING SORT하고 이름순으로 ASCENDING SORT, 급여순으로 DESCENDING SORT하라.
SELECT * FROM EMP ORDER BY DEPTNO DESC, ENAME ASC, SAL DESC;


