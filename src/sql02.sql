/*
테이블 생성 : CREATE

CREATE TABLE [테이블명] (
컬럼명 컬럼데이터 타입 (옵션),
컬럼명 컬럼데이터 타입 (옵션),
...
);

컬럼명 : 알파벳 소문자 붙여서
데이터타입 : 반드시 명시 문자열 : VARCHAR2
옵션 : 제약조건 CONTRAINT 생략가능 : 부적절한 자료가 입력되는 것을 방지하기 위해 여러가지 규칙을 정해 놓은 것

NOT NULL : NULL 값이 둘어올 수 없다
UNIQUE : 중복 요소 올 수 없다
PRIMARY KEY : 중요함, NOT NULL + UNIQUE 형태로 테이블 한개는 있는 형태다 좋고, 테이블당 한개 컬럼만 PK지정가능
레코드 구분 직는 요소

FOREIGN KEY : 두개 테이블을 연결 시킬 때 다른 테이블의 PK가 되는 칼럼을 현재 테이블에 FK로 지정

DEFAULT : 디폴트 값 지정

CHECK : 조건 체크 등 검사하고 들어갈 수 있는

* 테이블 생성시 주의사항
- 테이블 이름과 컬럼은 알파벳으로 시작
A-Z문자, 0-9숫자, $#_사용가능, 공백x
-컬럼 예약어 사용불가
- 한 계정에서 테이블명 중복 불가
- 한테이블 안에서 컬럼이름은 중복 불가, 다른 테이블에서의 컬럼 이름과 동일해도 무관

*/

CREATE TABLE TEST(
    ID VARCHAR2(50) PRIMARY KEY,
    PW VARCHAR2(50) NOT NULL,
    AGE NUMBER DEFAULT 1,
    REG DATE DEFAULT SYSDATE
);

--사용자가 보유한 테이블 조회
SELECT TABLE_NAME FROM USER_TABLE;

--테이블 정보 확인
DESC TEST;
SELECT * FROM TEST;

/*
2. 레코드추가 : INSERT NOT NULL 속성을 가진 컬럼에는 반드시 값을 넣어주기;
    1)모든 컬럼의 데이터 추가
    INSERT INTO [테이블명] VALUES( [값들 쉼표 구분자로 컬럼순서대로 나열;] )
    
    2)원하는 컬럼만 데이터 추가
    INSERT INTO [테이블명 (컬럼명, 컬럼명,..)] VALUES ( [컬럼명 작성한 순서대로 값을 나열]);
 
*/

INSERT INTO TEST VALUES('JAVA', '1234', 20, SYSDATE);
INSERT INTO TEST (PW,ID,AGE,REG) VALUES('JAVA01', '1234', 20, SYSDATE); --순서 어기면 안됌

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
    1)일괄 수정
    UPDATE [테이블명] SET [컬럼명 = 값]
    2) 레코드 조건 수정
    UPDATE [테이블명] SET [컬럼명=값] (, 컬럼명=값, ...)
    WHERE [조건식]
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
4. 레코드 삭제 : DELETE
    1) 전체 코드 삭제
    DELETE FROM [테이블명]
    TRUNCATE TABEL [테이블명]
    
    2) 레코드 조건 삭제
    DELETE FROM [테이블명]
    WHERE [조건식]
*/

DELETE FROM TEST WHERE ID ='JAVA';
SELECT *FROM TEST;

--DELETE FROM TEST; 레코드 전체날리기
--TRUNCATE TABLE TEST; 레코드 모두 날리고 점유하던 공간도 반납

/*
5. 테이블 정보 수정 : ALTER
 1) 컬럼 추가
    ALTER  TABLE [테이블명] ADD ( [컬럼명 데이터 타입](옵션) )
    컬럼과 컬럼사이에 추가 불가 항상 맨뒤에 추가
    테이블에 이미 데이터가 들어가 있을 때는 NOT NULL 옵션 줄수가 없다. DEFAULT 가능
    
 2) 컬럼 타입 변경
    ALTER TABLE [테이블 명] MODIFY (컬럼명 데이터 타입 (옵션) );
    *컬럼변경 시 고려사항
    - 해당 컬럼의 크기를 늘릴 수는 있지만 줄이지는 못함, 기존 데이터 훼손 우려
    - 해당 컬럼의 NULL값만을 가지고 있거나 테이블에 아무 레코드가 없으면 컬럼의 크기를 줄일 수 있다.
    - 해당 컬럼의 NULL 값만을 가지고 있으면 데이터 유형을 변경할 수 있다
    - 해당 컬럼의 DEFAULT 값을 바꾸면 변경 이후에 발생하는 레코드 삽입에만 영향을 준다. 이전은 그대로
    - 해당 컬럼의 NULL값이 없을 경우에만 NOT NULL 제약조건 추가가능
    
 3) 컬럼 이름 변경 ALTER - RENAME
    ALTER TABLE [테이블명] RENAME COLUMN [구 컬럼명] TO [새컬럼명];
 4) 컬럼 삭제
    ALTER TABLE [테이블명] DROP COLUMN [컬럼명]
*/

SELECT * FROM TEST;
--컬럼추가
ALTER TABLE TEST ADD(NAME VARCHAR(50));
COMMIT;

--컬럼타입 변경
ALTER TABLE TEST MODIFY(NAME NUMBER);
DESC TEST;

--컬럼이름 변경
ALTER TABLE TEST RENAME COLUMN NAME TO NICKNAME;

--컬럼삭제
ALTER TABLE TEST DROP COLUMN NICKNAME;

/*
6. 테이블 삭제 : DROP
: 테이블 자체를 삭제

DROP TABLE [테이블명]
*/

--DROP TABLE TEST

/*
7. 예명(별칭) : ALIAS
    : 조회된 결과의 일종의 별명(ALIAS)를 부여해서 컬럼 레이블을 변경할 수 있다.
    실제 테이블의 컬럼명이 변경되지 않고, 검색시 표에 예명으로 한번 붙는다.
    
    SELECT [컬럼명] [예명], [칼럼명] [예명] FRORM [테이블명]
    SELECT [컬럼명] AS [예명], [칼럼명] AS [예명] FRORM [테이블명]
    
    예명은 컬럼명 바로 뒤에 작성
    컬럼명과 예명 사이에 AS, as 키워드를 사용할 수도 있다
    예명은 쌍따옴표로 묶어서 표현하면 예명에 공백이나 특수문자를 포함시킬 수 있고 대 소문자 구분하게 할 수도 있다.
    FROM절에 테이블 ALIAS를 설정하면, SELECT 문장에서 테이블명 대신 사용 가능
*/
SELECT ID, PW FROM TEST;
SELECT ID 아이디, PW 비밀번호 FROM TEST;
SELECT ID AS "당신 아이디", PW AS "당신 비밀번호" FROM TEST AS T;
SELECT T.ID "당신의 아이디", T.PW "당신의 비밀번호" FROM T;

/*
8. 트렌젝션
데이터 처리의 한 단위
트렌젝션 : 이전 커밋이 일어난 후 ~ 다음 커밋 전까지의 작업

9. 그룹함수
1) 종류
    COUNT : 데이터의 개수
    SUM : 총합
    AVG : 평균
    MAX : 데이터중 큰값
    MIN : 데이터중 가장 작은값
*/
SELECT COUNT(*) FROM TEST;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*), COUNT(COMM) FROM EMP;

SELECT SUM(COMM) FROM EMP;
SELECT AVG(COMM) FROM EMP; --널 제외한 값
SELECT AVG(NVL(COMM,0)) FROM EMP; --NULL도 카운트해서 전체평균
SELECT MAX(HIREDATE) FROM EMP;
SELECT MIN(HIREDATE) FROM EMP;
SELECT * FROM EMP;

/*
10. GROUP BY : 특정 조건으로 세부적인 그룹화
    GROUP BY [그루핑 기준]
    *WHERE 절 뒤, ORDER BY 전.
*/
SELECT DEPTNO, COUNT(*) FROM EMP GROUP BY DEPTNO ORDER BY 2 DESC;
--WHERE

--JOB을 기준으로 각 업무에 해당하는 사원수ㅡ 업무별 평균 급여, 최고 급여, 급여합계
SELECT JOB, COUNT(*) "인원수", AVG(SAL)  "평균급여", MAX(SAL) "최고급여", MIN(SAL) "최저급여" , SUM(SAL) "급여합계" FROM EMP GROUP BY JOB;

--11. WHERE 절에는 집계합수 불가
-- 집계함수로 조건 비교할 때 사용

--JOB별로 직원수가 3명이상인 JOB인원수 출력
SELECT JOB, COUNT(*) "직원수" FROM EMP GROUP BY JOB HAVING COUNT(*) >=3;

--전체 월급이 5000을 초과하는 JOB에 대해, JOB과 월 급여 합계를 조회, 단, JOB이 'SALES'는 제외하고 월 급여 합계로 내림차순 정렬
SELECT JOB, SUM(SAL) "급여합계" FROM EMP WHERE JOB !='SALESMAN' GROUP BY JOB HAVING SUM(SAL)>5000 ORDER BY SUM(SAL) DESC;

/*
12. 서브쿼리 : 쿼리 안에 쿼리문을 작성하는 형태
    SELECT * FROM [테이블명];
    SELECT * FROM (서브쿼리문);
    SELECT * FROM (서브쿼리문 (서브쿼리))
*/

SELECT * FROM (SELECT EMPNO, ENAME, SAL FROM EMP);
SELECT EMPNO, SAL FROM (SELECT EMPNO, ENAME, SAL FROM EMP);
SELECT * FROM EMP;

--사원번호 7900인 직원의 직무와 같은 직무를 가진 사람의 일름과 직무 출력
SELECT ENAME,JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO=7900);

/*
13. JOIN 
    : 둘 이상의 테이블을 연결하여 데이털르 검색하는 방법
    두 테이블에 적어도 한개의 컬럼은 서로 공유하는 형태여야 한다.
    레코드 적은 것을 앞에쓰는 것이 빠르다
    
    TEST A,B,C,D,E
    정규화 : 하나의 테이블이 여러 개의 테이블로 나눠져서 조각으로 분리하는 기술
    정구화로 여러 테이블에흩어져 있는 데이터들을 조합해서 가져오는 기술이 조인
    
    [ORACLE JOIN]
    SELECT A.COL1, B.COL1 FROM TABLE A, TABLE2 B WHERE A.COL2 = B.COL2;
    [ANSI JOIN]
    SELECT A.COL1, B.COL1 FROM TABLE A [INNER] TABLE2 B ON A.COL2=B.COL2;
    
    1) EQUI JOIN 등가조인
    
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT * FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO;

SELECT EMPNO, ENAME, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
--ANSI
SELECT E.EMPNO ,E.ENAME, D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

SELECT S.NAME 학생이름, P.NAME 지도교수 FROM STUDENT S, PROFESSOR P WHERE S.PROFNO=P.PROFNO;

SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;

/*
14. SELF JOIN
    조인하고 싶은 데이터가  하나의 테이블에 다 들어 있는 경우
*/
-- 직원번호, 직원이름과 해당 직원의 상사의 이름 출력
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME FROM EMP E1,EMP E2 WHERE E1.MGR = E2.EMPNO;

/*
15. 시퀀스 SEQUENCE
    : 유일한 값을 생성해 주는 오라클 객체
    시퀀스를 생성하면 PK와 같이 순차적으로 증가하는 칼럼을 자동적으로 생성할 수 있다.
    NUMBER 타입의 PK 값을 생성할 떄 사용.
    시퀀스는 테이블과는 독립적으로 저장되고 생성된다.
    
    1) 시퀀스 생성
        CREATE SEQUENCE [시퀀스명] (옵션);
        *옵션 : 생략가능
        START WITH N : 시퀀스의 시작값 지정
        INCREMENT BY N : 증가값 지정, DEFAULT 
        MAXVALUE : 최대값
        MINVALUE : 최소값
        CYCLE / NOCYCLE : 최대값 도달시 순환여부
        CACHE N / NOCACHE : 시퀀스 생성속도를 개선하기 위해 캐싱여부 지정
        
        시퀀스 명 : 테이블명_SEQ, SEQ_테이블명
        
    2) 시퀀스 사용
        시퀀스 명.CURRVAL : 현재까지 생성된 번호.
        시퀀스 명.NEXTVAL : 다음번호
    3) 시퀀스 삭제
        DROP SEQUENCE TEST_SEQ;
*/
CREATE SEQUENCE TEST_SEQ NOCACHE;
COMMIT; 
SELECT TEST_SEQ.NEXTVAL FROM DUAL;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;

SELECT * FROM TEST;
INSERT INTO TEST VALUES('PIKACHU','1111', TEST_SEQ.NEXTVAL, SYSDATE);


-- 문제1. student(학생), department(학과), professor(교수) 테이블 join 하여 
--      학생이름, 학생의학과이름(dname), 지도교수이름 출력  
--       단, 학생의 학과는 DEPTNO1을 기준으로 찾기 
-- 문제2. student 테이블을 조회하여 1전공이 101번인 학생들의 이름과 
--      각 학생들의 지도교수이름을 출력하세요.

--1
SELECT S.NAME 학생이름 ,D.DNAME 학과이름, P.NAME 지도교수 FROM STUDENT S, DEPARTMENT D, PROFESSOR P WHERE S.DEPTNO1 = D.DEPTNO AND S.PROFNO=P.PROFNO;
--2
SELECT DISTINCT S.NAME 학생이름, P.NAME 지도교수 FROM STUDENT S, PROFESSOR P, DEPARTMENT D WHERE S.PROFNO=P.PROFNO AND S.DEPTNO1=101;
SELECT * FROM STUDENT;