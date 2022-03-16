-- 한줄 주석--
/*
데이터 조회 : SELECT
전체조희 : *, 원하는 컬럼만 조회 : 컬럼명, 구분자로 나열
SELECT [컬럼명 또는 표현식] FROM [테이블명 또는 뷰명];
*/
SELECT * FROM EMP;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP;

--표현식(리터럴 상수)은 컬럼 이름이외에 출력하기를 원하는 내용을 작성하여 출력가능
--SELECT 뒤 ''묶어서 사용
-- 데이터는 ''묶기, 별칭(ALIAS)은 "" 묶기
SELECT NAME, 'GOOD MORNING' "HELLO" FROM PROFESSOR;
SELECT * FROM DEPT;
SELECT DNAME, 'IT''S DEPTNO' "TEST", DEPTNO "DEPARTMENT NUMBER" FROM DEPT;

--컬럼병칭 (COLUMN ALIAS) : 컬럼명 뒤에 ""로 묶어서 별칭 달 수 있다. (SELECT 문 실행할때만 적용)

SELECT * FROM EMP;
SELECT EMPNO "EMPLOYEE NUMBER", ENAME "EMPLOYEE NAME", MGR "MANAGER" FROM EMP;

--중복값 제거하고 SELECT 해오기
--주의 : 1개 컬럼앞에 적어도 키워드를 작성해도 나열된 모든 컬럼을 기준으로 중복
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO, ENAME FROM EMP;

-- 연결연산자 : ||: 컬럼 붙혀서 출력가능
SELECT ENAME || ' '|| JOB FROM EMP;

SELECT* FROM STUDENT;
-- STUDENT 테이블에서 모든 학생의 이름과 ID, 체중을 아래와 같은 형태로 출력
-- 예) JAMES SEO/S ID : 75TRUE, WEIGHT IS 72KG
SELECT NAME ||'''S ID : '||ID||', WEIGHT IS '||WEIGHT||'KG' FROM STUDENT;

/*
원하는 조건만 골라내기 : WHERE절
SELECT [컬럼명또는 표현식] FROM [테이블명 또는 뷰명] WHERE[조건];
조건은 일반 산수에 사용되는 조건 사용
*/
SELECT * FROM EMP; 
SELECT * FROM EMP WHERE EMPNO =7900;

-- SAL이 1500이상인 직원의 EMPNO, ENAME, JOB 가져오기
SELECT EMPNO, ENAME JOB, SAL FROM EMP WHERE SAL >= 1500;

--ENAME이 SMITH인 사람의 EMPNO, ENAME, SAL를 EMP 테이블에서 가져오기
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME= 'SMITH';

--ENAME이 FROD인 사람의 EMPNO, ENAME, HIREDATE- 를 EMPㅇ에서 가져ㅛ오기
SELECT  EMPNO, ENAME, HIREDATE FROM EMP WHERE ENAME ='FORD';
-- HIREDATE가 80/12/17인 직원의 EMPNO, ENAME,JOB, HIREDATE 가져오기
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP 
--WHERE HIREDATE = '80/12/17';
WHERE HIREDATE = '80.12.17'; -- 유닉스 개열 일-월-년 17/DEC/80

--기본 산술 연산자 사용 : + - * /
SELECT ENAME, SAL,SAL*0.1 "TAX" FROM EMP WHERE DEPTNO =30;


---비교연산자
SELECT * FROM EMP;
SELECT * FROM EMP WHERE ENAME >='R'; 
SELECT EMPNO ,ENAME, DEPTNO FROM EMP WHERE HIREDATE >= '82/01/01';

--숫자 BETWEEN AND
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >=2000 AND SAL <=3000; --속도면에서 더 빠름
SELECT EMPNO, ENAME , SAL FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

--문자 BEETWEEN AND
SELECT ENAME FROM EMP ORDER BY ENAME;
SELECT ENAME FROM EMP WHERE ENAME BETWEEN 'JAMES' AND 'MARTIN';

--IN 연산자
SELECT EMPNO, ENAME, DEPTNO FROM EMP 
WHERE DEPTNO IN (10, 20);

--LIKE 연산자 : %_ 두개의 기호와 같이 사용 
-- % : 글자수 제한 없고(0개포함) 어떤 글자가 와도 상관없음
--  _: 글자수는 한글자 뜻하며, 어떤 글자이던 상관없다.
-- 값% 값으로 시작하는
-- %값 값으로 끝나는
-- %값% 값을 포함하는
-- _값 : 두번째가 값인 것
-- 숫자
SELECT EMPNO, ENAME , SAL FROM EMP WHERE SAL LIKE '1%';

SELECT EMPNO ,ENAME , SAL FROM EMP WHERE ENAME LIKE 'A%';

SELECT EMPNO ,ENAME , HIREDATE FROM EMP WHERE HIREDATE LIKE '80%';

SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE LIKE '___12%';

SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%N';

-- IS NULL / IS NOT NULL : 값이 무엇인지 모를경우

SELECT * FROM EMP;
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--AND OR : 검색 WHERE 조건식에서 사용
--AND : 검색조건이 모두 만족할 때
--OR : 조건 중 하나라도 만족할 때

SELECT EMPNO, ENAME, HIREDATE , SAL FROM EMP WHERE HIREDATE >= '82/01/01' AND SAL >=2000;

SELECT EMPNO, ENAME, HIREDATE , SAL FROM EMP WHERE HIREDATE >= '82/01/01' OR SAL >=2000;
--SAL 1000이상이며, COMM < 1000이하 또는 없는 사람들
SELECT * FROM EMP
WHERE SAL >= 1000 AND COMM < 1000 OR COMM IS NULL;

-- 정렬 : ORDER BY
-- 오름차순 : ASC (DEFAULT)
-- 내림차순 : DESC
--SQL마지막에 적어야 함

SELECT * FROM EMP ORDER BY ENAME ASC;
SELECT * FROM EMP ORDER BY ENAME DESC;

--SAL >1500, 이름기준 오름차순
SELECT * FROM EMP WHERE SAL >= 1500 ORDER BY ENAME;

SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
SELECT EMPNO , ENAME , SAL, DEPTNO FROM EMP ORDER BY 4,3;

--집합연산자
-- UNION 합집합 : 두집합의 결과 합쳐, 중복값 제거하고 정렬
-- UNION ALL : 합집합+ : 두집합의 결과 합쳐, 중복제거안하고 정렬 안함
-- INTERSECT : 교집합 : 두집합의 중복되는 값만 가져옴 정렬
-- MINUS : 차집합 : 두집합의 차집합의 결과를 가져옴, 정렬. (집합작성 순서 중요)
-- 주의사항 : 두 집합의 SELECT 절에 오는 컬럼수가 동일해여함
-- 두집합의 SELECT 절에 오는 컬럼의 데이터 타입이 동일해야함

SELECT * FROM STUDENT;
--STUDENT : STUDNO NAME ID GRADE JUMIN BIRTHDAY TEL HEIGHT WEIGHT DEPTNO1 DEPTNO2 PROFNO
--PROFESSOR : PROFNO NAME ID POSITION PAY HIREDATE BONUS DEPTNO EMAIL HPAGE
SELECT * FROM PROFESSOR;
-- 합집합
SELECT STUDNO, NAME , DEPTNO1,1 FROM STUDENT WHERE DEPTNO1= 101
UNION ALL
SELECT PROFNO , NAME , DEPTNO , 2 FROM PROFESSOR WHERE DEPTNO =101;

--중복비교
SELECT STUDNO, NAME ,DEPTNO1, DEPTNO2 FROM STUDENT WHERE DEPTNO1 = 101
UNION ALL
SELECT STUDNO, NAME, DEPTNO1, DEPTNO2 FROM STUDENT WHERE DEPTNO1 = 201;

-- INTERSECT : 교집합 
SELECT STUDNO, NAME FROM STUDENT WHERE DEPTNO1 = 101
INTERSECT
SELECT STUDNO, NAME FROM STUDENT WHERE DEPTNO2 = 201;

-- MINUS 차집합
SELECT EMPNO, ENAME, SAL FROM EMP 
MINUS
SELECT EMPNO, ENAME , SAL FROM EMP WHERE SAL >2500;


/*
##SQL 함수
단일행 함수 : 한 번에 한개의 행에 대한 처리를 한번 해주는 함수 : 한개행 -> 한개의 결과
복수행 함수 : 한 번에 여러개의 행에 대한 처리를 한번 해주는 함수 : 여러개행 -> 한개의 결과
1) 단일행 함수 : 문자함수, 숫자함수, 날짜함수, 일반함수, 변환함수
#1. 문자함수
LOWER('문자') : 소문자로 변환
UPPER('문자') : EO문자로 변환
LENGTH('문자') : 문자 길이 출력
CONCAT('문자', '문자') : 문자열 연결
SUBSTR('문자', IDX1, 개수) : 문자를 IDX1~IDX2(포함) 잘라서 줌. INDEX는 1부터 시작
LPAD('ORIGINAL문자', LENGTH, '삽입문자') : ORIGINAL에 왼쪽부분에 LENGTH 길이가 될 때 까지 삽입문자를 추가해줌
        'LOVE',6,'*' ->**LOVE
RPAD('ORIGINAL문자', LENGTH, '삽입문자') : ORIGINAL에 오른쪽 부분에 삽입문자를 추가
LTRIM('ORG문자', '삭제할 문자') : ORG 문자에 왼쪽에 있는 삭제할 문자 삭제. '*LOVE','*' -> LOVE
RTRIM('ORG문자', '삭제할 문자') : ORG 문자에 오른쪽에 있는 삭제할 문자 삭제.
REPLACE('ORG', 'OLD', 'NEW') : ORG문자열안에 OLD 부분을 NEW로 교체 
INSTR('문자', '특정문자') : 문자안의 특정문자의 위치 알려줌. 위치 ~ 'ABCD', 'A' --> 1
*/

SELECT *FROM EMP;
SELECT ENAME, LOWER(ENAME) FROM EMP;
SELECT ENAME , LENGTH(ENAME) FROM EMP;
SELECT ENAME, JOB, CONCAT(ENAME, JOB) FROM EMP;
SELECT SUBSTR('ABCD',1,2) FROM DUAL;
SELECT SUBSTR('ABCD',-3,2) FROM DUAL;

SELECT * FROM STUDENT;
SELECT NAME, JUMIN, SUBSTR(JUMIN, 1,6) FROM STUDENT ;

SELECT NAME ,DEPTNO1, JUMIN, SUBSTR(JUMIN,3,4) "BITHDAY", LPAD(SUBSTR(JUMIN,3,4)-1,4,'0' ) "D-1" FROM STUDENT WHERE DEPTNO1 = 101;

-- EMP 테이블에서 ENAME 이름이 첫 두글자를 *로 표시하기
SELECT * FROM EMP;
SELECT ENAME, REPLACE(ENAME, SUBSTR(ENAME, 1, 2), '**') FROM EMP;
SELECT '피카츄' "ORG", SUBSTR('피카츄',1,2) FROM DUAL;

-- 피**  
SELECT '피카츄' "ORG", REPLACE('피카츄',SUBSTR('피카츄',2, LENGTH('피카츄'))  , '**') "LPAD" FROM DUAL;


/*
 숫자 함수 : 입력되는 값이 숫자인 함수들을 말함
ROUND(숫자, 소수점수) : 반올림 : 12.345 , 2 --> 12.35
TRUNC(숫자, 소수점수) : 숫자에서 주어진 소수점수만큼 자리 유지하고 뒤는 버림 12.345, 2->13.34
MOD(숫자1, 숫자2) : 숫자1을 숫자2로 나눈 나머지값 (자바의 %) 12,10 ->2
CEIL(숫자) : 올림
FLOOR(숫자) : 내림
POWER(숫자1, 숫자2) : 숫자1의 숫자2승 3,2 -> 9
*/
SELECT ROUND(12.545 , 2) FROM DUAL;
SELECT TRUNC(12.345 , 2) FROM DUAL;

/*
3) 날짜 관련 함수
    #날짜 계산
    날짜 + 숫자 = 날짜 3월 8일 +3 = 3월 11일
    날짜 - 숫자 = 날짜
    날짜 - 날짜 = 숫자 EX) 3월 8일 -3월5일  = -3
    
    #날짜함수
    SYSDATE : 시스템의 현재 날짜와 시간
    MONTHS_BETWEEN : 두 날짜 사이의 개월수
    ADD_MONTHS : 주어진 날짜에 개월수 더함
    NEXT_DAY : 돌아오는 날짜
    LAST_DAY : 해당 달의 마지막 날짜
    ROUND : 주어진 날짜 반올림
    TRUNC : 주어진 날짜 버림
*/
SELECT SYSDATE FROM DUAL;

SELECT TRUNC(MONTHS_BETWEEN('22/04/29',SYSDATE),0) FROM DUAL;

SELECT ADD_MONTHS(SYSDATE,1) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '수') FROM DUAL;

SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE) FROM DUAL;

/*
3) 형변환 함수
    #오라클 데이터 타입
    CHAR(N) : N만큼의 고정길이 문자 저장. 최대 2000바이트
    VARCHAR2(N) : N만큼의 변하는 길이의 문자 저장. 최대 4000바이트
    NUMBER(P,S) : 숫자 저장, P 전체 자리수 1~38, S 소수점 자리수 - 84~127자리까지./ ()생략가능
    DATE : 날짜
    LONG : 가변길이 문자저장 2GB
    CLOB : 가변길이 문자저장 4GB
    RAW(N) : 원시 2진 데이터 200BYTE
    LONG RAW(N) : 원시 2진 데이터
    BFILE : 외부파일에 저장된 데이터로 최대 4GBB
    
    #자동 형변환
        SELECT 2 + '2' FROM DUAL;
    #강제 형변환
        함수
        TO_CHAR(숫자) : 숫자 -> 문자, 날짜 -> 문자
        TO_NUMBER('문자') : 문자 -> 숫자
        TO_DATE('날짜형문자') : 문자 -> 날짜
        "날짜 표현하는 방법"
            연도 : YYYY/YY/YEAR
            월 : MM / MONTH / MON
            일 : DD / DAY / DDTH 몇번째 날인지
            시간 : HH24 (24시간) / HH (12시간)
            분 : MI
            초 : SS
            
*/
SELECT 2+'2' FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY') "YYYY", TO_CHAR(SYSDATE, 'RRRR') "RRRR",TO_CHAR(SYSDATE, 'YY') "YY",TO_CHAR(SYSDATE,'YEAR') "YEAR" FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'MM') "YYYY", TO_CHAR(SYSDATE, 'MON') "RRRR",TO_CHAR(SYSDATE, 'MONTH') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') "YYYY", TO_CHAR(SYSDATE, 'DAY') "RRRR",TO_CHAR(SYSDATE, 'DDTH')  FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

/*
### TO_CHAR() -> 숫자 문자
*오라클 표현식*
9 9의 개수만큼 자릿수를 표현
0 빈자리를 0으로 채움
$ $표시 붙혀서 표시
. 소수점 이하 표시
, 천단위 구분기호 표시
*/

SELECT TO_CHAR(1234, '99999') FROM DUAL;
SELECT TO_CHAR(1234, '09999') FROM DUAL;
SELECT TO_CHAR(1234, '$9999') FROM DUAL;
SELECT TO_CHAR(1234,'9999.99') FROM DUAL;
SELECT TO_CHAR(12345, '99,999') FROM DUAL;

-------------------------------------------------------------------------------------
/*
    문제 2-4 : EMP 테이블에서, 제공된 이미지(2-4)와 같이 20번 부서에 소속된 직원들의 이름과 
            2 ~ 3번째 글자만 '-'으로 변경해서 출력하세요.
    문제 2-5 : STUDENT 테이블에서, 제공된 이미지(2-5)와 같이 1전공(DEPTO1)이 101번인 학생들의 
            이름과 주민번호를 출력하되, 주민번호의 뒤 7자리는 '-'과 '/'로 표시되게 출력하세요. 
    문제 2-6 : STUDENT 테이블에서 제공된 이미지(2-6)와 같이 1전공이 102인 학생들의 
            이름과 전화번호, 전화번호에서 앞자리 부분만 '*'처리하여 출력하세요. 
            단, 모든 앞자리는 3자리로 간주. 
    문제 2-7 : STUDENT 테이블에서, 제공된 이미지(2-7)와 같이 1전공이 101번인 학과 학생들의 
            이름과 전화번호와 전화번호에서 뒷자리를 *로 표시해서 출력하세요. 
    문제 2-8 : STUDENT 테이블의 BIRTHDAY 컬럼을 사용하여 생일이 1월인 학생의 
            학생번호(STUDNO)와 이름, BIRTHDAY를 제공된 이미지(2-8) 과 같이 출력하세요. 
    문제 2-9 : EMP 테이블의 HIREDATE 컬럼을 사용하여 입사일이 1,2,3월인 사람들의 
            사원번호(EMPNO), 이름(ENAME), 입사일을 제공된 이미지(2-9)와 같이 출력하세요.
*/

--2-4 
SELECT ENAME , REPLACE(ENAME, SUBSTR(ENAME,2,2),'**') "REPLACE" FROM EMP WHERE DEPTNO= 20;

--2-5
SELECT NAME, JUMIN, REPLACE(JUMIN, SUBSTR(JUMIN,7,7),'-/-/-/-') "REPLACE" FROM STUDENT WHERE DEPTNO1 =101;
