-- ���� �ּ�--
/*
������ ��ȸ : SELECT
��ü���� : *, ���ϴ� �÷��� ��ȸ : �÷���, �����ڷ� ����
SELECT [�÷��� �Ǵ� ǥ����] FROM [���̺�� �Ǵ� ���];
*/
select * from emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

--ǥ����(���ͷ� ���)�� �÷� �̸��̿ܿ� ����ϱ⸦ ���ϴ� ������ �ۼ��Ͽ� ��°���
--select �� ''��� ���
-- �����ʹ� ''����, ��Ī(alias)�� "" ����
select name, 'good morning' "HELLO" from professor;
select * from dept;
select dname, 'it''s deptno' "test", deptno "department Number" from dept;

--�÷���Ī (Column alias) : �÷��� �ڿ� ""�� ��� ��Ī �� �� �ִ�. (select �� �����Ҷ��� ����)

select * from emp;
select empno "employee number", ename "employee name", mgr "manager" from emp;

--�ߺ��� �����ϰ� select �ؿ���
--���� : 1�� �÷��տ� ��� Ű���带 �ۼ��ص� ������ ��� �÷��� �������� �ߺ�
select DISTINCT deptno from emp;
select DISTINCT deptno, ename from emp;

-- ���Ῥ���� : ||: �÷� ������ ��°���
SELECT ename || ' '|| job from emp;

SELECT* FROM student;
-- Student ���̺��� ��� �л��� �̸��� ID, ü���� �Ʒ��� ���� ���·� ���
-- ��) James Seo/s ID : 75true, WEIGHT is 72kg
select name ||'''s ID : '||id||', WEIGHT is '||weight||'kg' from student;

/*
���ϴ� ���Ǹ� ��󳻱� : WHERE��
SELECT [�÷���Ǵ� ǥ����] FROM [���̺�� �Ǵ� ���] WHERE[����];
������ �Ϲ� ����� ���Ǵ� ���� ���
*/
select * from emp; 
select * from emp where empno =7900;

-- sal�� 1500�̻��� ������ empno, ename, job ��������
SELECT empno, ename job, sal FROM emp where sal >= 1500;

--ename�� SMITH�� ����� empno, ename, sal�� emp ���̺��� ��������
select empno, ename, sal from emp where ename= 'SMITH';

--ename�� FROD�� ����� empno, ename, hiredate- �� emp������ �����˿���
select  empno, ename, hiredate from emp where ename ='FORD';
-- hiredate�� 80/12/17�� ������ empno, ename,job, hiredate ��������
select empno, ename, job, hiredate from emp 
--where hiredate = '80/12/17';
where hiredate = '80.12.17'; -- ���н� ���� ��-��-�� 17/DEC/80

--�⺻ ��� ������ ��� : + - * /
select ename, sal,sal*0.1 "tax" from emp where deptno =30;


---�񱳿�����
select * from emp;
select * from emp where ename >='R'; 
select empno ,ename, deptno from emp where hiredate >= '82/01/01';

--���� between and
select empno, ename, sal from emp where sal >=2000 and sal <=3000; --�ӵ��鿡�� �� ����
select empno, ename , sal from emp where sal between 2000 and 3000;

--���� beetween and
select ename from emp order by ename;
select ename from emp where ename between 'JAMES' and 'MARTIN';

--IN ������
select empno, ename, deptno from emp 
where deptno in (10, 20);

--Like ������ : %_ �ΰ��� ��ȣ�� ���� ��� 
-- % : ���ڼ� ���� ����(0������) � ���ڰ� �͵� �������
--  _: ���ڼ��� �ѱ��� ���ϸ�, � �����̴� �������.
-- ��% ������ �����ϴ�
-- %�� ������ ������
-- %��% ���� �����ϴ�
-- _�� : �ι�°�� ���� ��
-- ����
select empno, ename , sal from emp where sal like '1%';

select empno ,ename , sal from emp where ename like 'A%';

select empno ,ename , hiredate from emp where hiredate like '80%';

select empno, ename, hiredate from emp where hiredate like '___12%';

select empno, ename from emp where ename like '%N';

-- IS NULL / IS NOT NULL : ���� �������� �𸦰��

select * from emp;
select * from emp where comm is null;
select * from emp where comm is not null;

--AND OR : �˻� WHERE ���ǽĿ��� ���
--AND : �˻������� ��� ������ ��
--OR : ���� �� �ϳ��� ������ ��

select empno, ename, hiredate , sal from emp where hiredate >= '82/01/01' and sal >=2000;

select empno, ename, hiredate , sal from emp where hiredate >= '82/01/01' or sal >=2000;
--sal 1000�̻��̸�, comm < 1000���� �Ǵ� ���� �����
select * from emp
where sal >= 1000 and comm < 1000 or comm is null;

-- ���� : order by
-- �������� : ASC (default)
-- �������� : DESC
--SQL�������� ����� ��

select * from emp ORDER BY ename asc;
select * from emp ORDER BY ename desc;

--sal >1500, �̸����� ��������
select * from emp where sal >= 1500 order by ename;

select * from emp order by deptno asc, sal desc;
select empno , ename , sal, deptno from emp order by 4,3;

--���տ�����
-- UNION ������ : �������� ��� ����, �ߺ��� �����ϰ� ����
-- UNION ALL : ������+ : �������� ��� ����, �ߺ����ž��ϰ� ���� ����
-- INTERSECT : ������ : �������� �ߺ��Ǵ� ���� ������ ����
-- MINUS : ������ : �������� �������� ����� ������, ����. (�����ۼ� ���� �߿�)
-- ���ǻ��� : �� ������ select ���� ���� �÷����� �����ؿ���
-- �������� select ���� ���� �÷��� ������ Ÿ���� �����ؾ���

select * from student;
--Student : STUDNO NAME ID GRADE JUMIN BIRTHDAY TEL HEIGHT WEIGHT DEPTNO1 DEPTNO2 PROFNO
--Professor : PROFNO NAME ID POSITION PAY HIREDATE BONUS DEPTNO EMAIL HPAGE
select * from professor;
-- ������
select studno, name , DEPTNO1,1 from student where DEPTNO1= 101
union all
select profno , name , deptno , 2 from professor where deptno =101;

--�ߺ���
select STUDNO, name ,deptno1, deptno2 from student where deptno1 = 101
union all
select STUDNO, name, deptno1, deptno2 from student where deptno1 = 201;

-- intersect : ������ 
select studno, name from student where deptno1 = 101
intersect
select studno, name from student where deptno2 = 201;

-- minus ������
select empno, ename, sal from emp 
minus
select empno, ename , sal from emp where sal >2500;


/*
##SQL �Լ�
������ �Լ� : �� ���� �Ѱ��� �࿡ ���� ó���� �ѹ� ���ִ� �Լ� : �Ѱ��� -> �Ѱ��� ���
������ �Լ� : �� ���� �������� �࿡ ���� ó���� �ѹ� ���ִ� �Լ� : �������� -> �Ѱ��� ���

1) ������ �Լ� : �����Լ�, �����Լ�, ��¥�Լ�, �Ϲ��Լ�, ��ȯ�Լ�
#1. �����Լ�
LOWER('����') : �ҹ��ڷ� ��ȯ
UPPER('����') : eo���ڷ� ��ȯ
LENGTH('����') : ���� ���� ���
CONCAT('����', '����') : ���ڿ� ����
SUBSTR('����', idx1, ����) : ���ڸ� idx1~idx2(����) �߶� ��. index�� 1���� ����
LPAD('original����', length, '���Թ���') : original�� ���ʺκп� length ���̰� �� �� ���� ���Թ��ڸ� �߰�����
        'love',6,'*' ->**love
RPAD('original����', length, '���Թ���') : original�� ������ �κп� ���Թ��ڸ� �߰�
LTRIM('org����', '������ ����') : org ���ڿ� ���ʿ� �ִ� ������ ���� ����. '*love','*' -> love
RTRIM('org����', '������ ����') : org ���ڿ� �����ʿ� �ִ� ������ ���� ����.

REPLACE('org', 'old', 'new') : org���ڿ��ȿ� old �κ��� new�� ��ü 
INSTR('����', 'Ư������') : ���ھ��� Ư�������� ��ġ �˷���. ��ġ ~ 'abcd', 'a' --> 1

*/

select *from emp;
select ename, LOWER(ename) from emp;
select ename , length(ename) from emp;
select ename, job, concat(ename, job) from emp;
select substr('abcd',1,2) from dual;
select substr('abcd',-3,2) from dual;

select * from student;
select name, jumin, substr(jumin, 1,6) from student ;

select name ,deptno1, jumin, substr(jumin,3,4) "bithday", LPAD(substr(jumin,3,4)-1,4,'0' ) "D-1" from student where deptno1 = 101;

-- emp ���̺��� ename �̸��� ù �α��ڸ� *�� ǥ���ϱ�
select * from emp;
select ename, replace(ename, substr(ename, 1, 2), '**') from emp;
select '��ī��' "org", substr('��ī��',1,2) from dual;

-- ��**  
select '��ī��' "org", replace('��ī��',substr('��ī��',2, length('��ī��'))  , '**') "lpad" from dual;


/*
 ���� �Լ� : �ԷµǴ� ���� ������ �Լ����� ����
ROUND(����, �Ҽ�����) : �ݿø� : 12.345 , 2 --> 12.35
TRUNC(����, �Ҽ�����) : ���ڿ��� �־��� �Ҽ�������ŭ �ڸ� �����ϰ� �ڴ� ���� 12.345, 2->13.34
MOD(����1, ����2) : ����1�� ����2�� ���� �������� (�ڹ��� %) 12,10 ->2
CEIL(����) : �ø�
FLOOR(����) : ����
POWER(����1, ����2) : ����1�� ����2�� 3,2 -> 9
*/
select round(12.545 , 2) from dual;
select trunc(12.345 , 2) from dual;

/*
3) ��¥ ���� �Լ�
    #��¥ ���
    ��¥ + ���� = ��¥ 3�� 8�� +3 = 3�� 11��
    ��¥ - ���� = ��¥
    ��¥ - ��¥ = ���� ex) 3�� 8�� -3��5��  = -3
    
    #��¥�Լ�
    SYSDATE : �ý����� ���� ��¥�� �ð�
    MONTHS_BETWEEN : �� ��¥ ������ ������
    ADD_MONTHS : �־��� ��¥�� ������ ����
    NEXT_DAY : ���ƿ��� ��¥
    LAST_DAY : �ش� ���� ������ ��¥
    ROUND : �־��� ��¥ �ݿø�
    TRUNC : �־��� ��¥ ����
*/
select sysdate from dual;

select TRUNC(MONTHS_BETWEEN('22/04/29',sysdate),0) from dual;

select add_months(sysdate,1) from dual;
select next_day(sysdate, '��') from dual;

select sysdate, round(sysdate), trunc(sysdate) from dual;

/*
3) ����ȯ �Լ�
    #����Ŭ ������ Ÿ��
    char(n) : n��ŭ�� �������� ���� ����. �ִ� 2000����Ʈ
    varchar2(n) : n��ŭ�� ���ϴ� ������ ���� ����. �ִ� 4000����Ʈ
    number(p,s) : ���� ����, p ��ü �ڸ��� 1~38, s �Ҽ��� �ڸ��� - 84~127�ڸ�����./ ()��������
    date : ��¥
    long : �������� �������� 2GB
    clob : �������� �������� 4GB
    raw(n) : ���� 2�� ������ 200byte
    long raw(n) : ���� 2�� ������
    bfile : �ܺ����Ͽ� ����� �����ͷ� �ִ� 4GbB
    
    #�ڵ� ����ȯ
        select 2 + '2' from dual;
    #���� ����ȯ
        �Լ�
        TO_CHAR(����) : ���� -> ����, ��¥ -> ����
        TO_NUMBER('����') : ���� -> ����
        TO_DATE('��¥������') : ���� -> ��¥
        "��¥ ǥ���ϴ� ���"
            ���� : YYYY/YY/YEAR
            �� : MM / MONTH / MON
            �� : DD / DAY / DDTH ���° ������
            �ð� : HH24 (24�ð�) / HH (12�ð�)
            �� : MI
            �� : SS
            
*/
select 2+'2' from dual;
select sysdate, to_char(sysdate, 'yyyy') "YYYY", to_char(sysdate, 'rrrr') "RRRR",to_char(sysdate, 'yy') "YY",to_char(sysdate,'year') "YEAR" from dual;

select sysdate, to_char(sysdate, 'mm') "YYYY", to_char(sysdate, 'MON') "RRRR",to_char(sysdate, 'MONTH') from dual;

select sysdate, to_char(sysdate, 'dd') "YYYY", to_char(sysdate, 'day') "RRRR",to_char(sysdate, 'ddth')  from dual;

select sysdate, to_char(sysdate, 'yyyy-mm-dd HH24:MI:SS') from dual;

/*
### TO_CHAR() -> ���� ����
*����Ŭ ǥ����*
9 9�� ������ŭ �ڸ����� ǥ��
0 ���ڸ��� 0���� ä��
$ $ǥ�� ������ ǥ��
. �Ҽ��� ���� ǥ��
, õ���� ���б�ȣ ǥ��

*/

select to_char(1234, '99999') from dual;
select to_char(1234, '09999') from dual;
select to_char(1234, '$9999') from dual;
select to_char(1234,'9999.99') from dual;
select to_char(12345, '99,999') from dual;

-------------------------------------------------------------------------------------
/*
    ���� 2-4 : emp ���̺���, ������ �̹���(2-4)�� ���� 20�� �μ��� �Ҽӵ� �������� �̸��� 
            2 ~ 3��° ���ڸ� '-'���� �����ؼ� ����ϼ���.
    ���� 2-5 : Student ���̺���, ������ �̹���(2-5)�� ���� 1����(depto1)�� 101���� �л����� 
            �̸��� �ֹι�ȣ�� ����ϵ�, �ֹι�ȣ�� �� 7�ڸ��� '-'�� '/'�� ǥ�õǰ� ����ϼ���. 
    ���� 2-6 : Student ���̺��� ������ �̹���(2-6)�� ���� 1������ 102�� �л����� 
            �̸��� ��ȭ��ȣ, ��ȭ��ȣ���� ���ڸ� �κи� '*'ó���Ͽ� ����ϼ���. 
            ��, ��� ���ڸ��� 3�ڸ��� ����. 
    ���� 2-7 : Student ���̺���, ������ �̹���(2-7)�� ���� 1������ 101���� �а� �л����� 
            �̸��� ��ȭ��ȣ�� ��ȭ��ȣ���� ���ڸ��� *�� ǥ���ؼ� ����ϼ���. 
*/
-------------------------------------------------------------------------------------
--2-4 : REPLACE('org', 'old', 'new') : org���ڿ��ȿ� old �κ��� new�� ��ü SUBSTR('����', idx1, ����)
select ename , replace(ename, substr(ename,2,2),'**') "REPLACE" from emp where deptno= 20;

--2-5
SELECT NAME, JUMIN, REPLACE(JUMIN, SUBSTR(JUMIN,7,7),'-/-/-/-') "REPLACE" FROM STUDENT WHERE DEPTNO1 =101;

--2-6
SELECT * FROM STUDENT;
SELECT NAME, TEL, REPLACE(TEL, SUBSTR(TEL,4,3),'***'  ) FROM STUDENT WHERE DEPTNO1 = 102;

--2-7
SELECT NAME, TEL, REPLACE(TEL, SUBSTR(TEL,-4,4),'****'  ) FROM STUDENT WHERE DEPTNO1 = 101;

/*
���� 2-8 : Student ���̺��� birthday �÷��� ����Ͽ� ������ 1���� �л��� 
            �л���ȣ(studno)�� �̸�, birthday�� ������ �̹���(2-8) �� ���� ����ϼ���. 
    ���� 2-9 : emp ���̺��� hiredate �÷��� ����Ͽ� �Ի����� 1,2,3���� ������� 
            �����ȣ(empno), �̸�(ename), �Ի����� ������ �̹���(2-9)�� ���� ����ϼ���.
*/
--2-8
SELECT BIRTHDAY FROM STUDENT;
SELECT STUDNO, NAME, TO_CHAR(BIRTHDAY, 'yyyy-mm-dd HH24:MI:SS')"BIRTHDAY" FROM STUDENT WHERE TO_CHAR(BIRTHDAY, 'mm')= 01 ;
--select sysdate, to_char(BIRTHDAY, 'yyyy-mm-dd HH24:MI:SS') from dual;

--2-9
SELECT EMPNO,ENAME, TO_CHAR(HIREDATE, 'yyyy-mm-dd HH24:MI:SS') "HIREDATE" FROM EMP WHERE TO_CHAR(HIREDATE,'MM')<'03';