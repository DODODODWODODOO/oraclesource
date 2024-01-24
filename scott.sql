-- scott

-- select(데이터 조회)
SELECT *
FROM EMP e;
-- e : 별칭(임의 조정 가능) / 업어도 됨
-- * : 전체 필드를(컬럼)를 의미함

SELECT EMPNO, ENAME, JOB
FROM EMP;

-- emp 테이블에서 부서번호만(중복 데이터 제거) 조회
SELECT DISTINCT  deptno
FROM EMP e ;

-- emp 테이블
-- empno(사원번호), ename(사원명), job(직책), mgr(매니저번호), hiredate(고용일), sal(급여), comm(보너스)
-- deptno(부서번호)

-- emp 테이블에서 사원번호, 매니저 번호, 부서번호만 조회
SELECT EMPNO, MGR, DEPTNO
FROM EMP; 

-- 데이터 출력 시 필드명 별칭 부여
-- 쌍따음표는 별칭에 공백이 있는 경우 무조건 사용
-- as 생략 가능
SELECT
	EMPNO AS 사원번호, MGR AS 매니저번호, DEPTNO "부서 번호"
FROM EMP; 


-- 연봉 게산
-- 월굽 * 12 + 수당
-- sal * 12 + comm
SELECT empno, sal, sal * 12 + comm AS "연봉"
FROM emp e;

-- 정렬
-- order by 정렬기준컬럼명 desc or asc
-- desc : 내림차순  asc : 오름차순(default)
SELECT *
FROM EMP ORDER BY sal DESC;

-- emp 테이블에서 empno, ename, sal 조회(단, emono 내림차순)
SELECT empno, sal, ename
FROM emp
ORDER BY empno DESC ;

SELECT empno, ename, sal
FROM emp
ORDER BY sal;

-- 전체조회, 부서번호 오름차순, sal 내림차순
SELECT *
FROM emp e
ORDER BY DEPTNO ASC, SAL DESC;
-- asc 는 디폴트 값이라 안써도 된다


-- 조건
-- deptno가 30번인 사원 조회
-- sal > 1000 이상인 사원 조회
-- =(같다) 산술연산(>, <, >=, <=)
SELECT * 
FROM  emp e 
WHERE DEPTNO = 30;

SELECT * 
FROM  emp e 
WHERE sal >= 1000;

SELECT * 
FROM  emp e 
WHERE sal >= 1000
ORDER BY sal DESC;

-- empno 가 7782 인 사원 조회
SELECT * 
FROM  emp e 
WHERE empno = 7782;

-- deptno 가 30번 이고, job 이 salesman 인 사원을 조회
-- 데이터는 대소문자 구별 함
SELECT * 
FROM  emp e 
WHERE DEPTNO = 30 AND job = 'SALESMAN';

-- empno가 7499 이고 deptno가 30인 사원 조회
SELECT  *
FROM  emp e
WHERE empno = 7499 AND DEPTNO = 30;

-- 이거나(혹은) : or
-- deptno가 30 이거나 job 이 salesman 인 사원조회
SELECT  *
FROM  emp e
WHERE DEPTNO = 30 OR job = 'salesman';


-- 연봉이 36000 인 사원 조회
SELECT *
FROM  emp e
WHERE sal * 12 + comm  = 36000;

-- 문자 비교도 가능 - 산숭연산 기호 가능
-- 알파벳 순서로 F 다음에 잇는
SELECT *
FROM  emp e
WHERE ENAME >= 'F';

-- ~이 아닌 : !=(자주사용) <> ^=
-- SAL 이 3000 이 아닌 사원 조회
SELECT *
FROM  emp e
WHERE SAL != 3000;

SELECT *
FROM  emp e
WHERE SAL <> 3000;

SELECT *
FROM  emp e
WHERE SAL ^= 3000;

-- JOB 이 MANAGER OR SALESMAN OR CLERK 인 사람
SELECT *
FROM  emp e
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- IN (~이거나)
SELECT *
FROM  emp e
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

-- NOT IN (~가 아니거나)
SELECT *
FROM  emp e
WHERE JOB NOT IN  ('MANAGER','SALESMAN','CLERK');

--HIREDATE 가 1981 10 31 이후에 고용된 사원 조회
--날짜 데이터 산술 연상 가능, 날짜 데이터 ''로 처리
SELECT *
FROM EMP e 
WHERE HIREDATE > '1981-10-31';

-- BETWEEN A AND B (~이상 ~이하)
-- SAL 2000 이상 3000 이하인 사원 조회
SELECT *
FROM EMP e
WHERE SAL >=2000 AND SAL <= 3000;

SELECT *
FROM EMP e
WHERE SAL BETWEEN 2000 AND 3000;

-- NOT BETWEEN A AND B (BETWEEN 의 반대)
SELECT *
FROM EMP e
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드 (_, %)
-- _ : 문자 하나
-- % : 문자 개수는 무한대


-- 사원 이름이 S로 시작하는 사원 조회
SELECT *
FROM  EMP e 
WHERE ENAME  LIKE  'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회
SELECT *
FROM  EMP e 
WHERE ENAME  LIKE  '_L%';


-- 사원 이름에 AM 문자가 포함된 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME LIKE  '%AM%';

-- 사원 이름의 AM 문자가 포함되지 않은 사원 조회
SELECT *
FROM EMP e 
WHERE ENAME NOT  LIKE  '%AM%';

-- 
SELECT * FROM EMP e;

-- NULL : 값이 없는 상태(0과 NULL은 다르다)
-- '' : 빈 값
-- ' ' : 스페이스바 도 문자이다

-- COMM 이 NULl 인 사원 조회
-- NULL 비교 : IS
SELECT * FROM EMP e WHERE COMM = NULL ; --X
SELECT * FROM EMP e WHERE COMM IS NULL ;

-- MGR 이 NULL 인 사원 조회
SELECT *
FROM EMP e 
WHERE MGR IS NULL;
-- MGR 이 NULL 이 아닌 사원 조회
SELECT *
FROM EMP e 
WHERE MGR IS NOT NULL ;


-- 집합연산자
-- 합집합(UNION, UNION ALL) 교집합(INTERSECT) 차집합(MINUS)

-- 부서번호가 10 혹은 20 사원 조회
-- or 사용해서 추출
-- 합집합
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 10 
UNION 
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 20;

-- 질의 블록은 부정확한 수의 결과 열을 가지고 있습니다.
-- 집합 연산자 UNION 을 사용할 때 출력 열 개수, 타입 동일
-- SELECT EMPNO, ENAME, SAL, DEPTNO
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 10 
UNION 
SELECT EMPNO , ENAME, DEPTNO
FROM EMP e 
WHERE DEPTNO = 20;

SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 10 
UNION 
SELECT SAL  , JOB , DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 20;

-- 결과 값의 중복 제거
SELECT  EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 10 
UNION
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e
WHERE DEPTNO = 10;

-- UNION ALL : 결과 값의 중복 포함
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e 
WHERE DEPTNO = 10 
UNION ALL 
SELECT EMPNO , ENAME, DEPTNO, SAL 
FROM EMP e
WHERE DEPTNO = 10;

-- MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP e 
MINUS
SELECT EMPNO, ENAME, SAL ,DEPTNO
FROM EMP e
WHERE DEPTNO = 10;

-- INTERSECT
SELECT empno, ename, sal ,deptno
FROM EMP e 
INTERSECT 
SELECT EMPNO, ENAME, SAl, DEPTNO
FROM EMP e
WHERE DEPTNO = 10;


-- 오라클 함수 (내장 함수)
-- 함수는 사용하는 DBMS 에 따라 다르게 제공
-- 1. 문자 함수
-- 1) 대소문자 변경

SELECT *
FROM EMP e 
WHERE ENAME = 'clark';

-- UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환하여 반환
-- LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환하여 반환
-- INITCAP(문자열) : 괄호 안 문자 데이터중 첫번쨰 문자만 대문자로 나머지는 소문자로 변환하여 반환
SELECT ENAME , UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)  
FROM EMP e; 

SELECT *
FROM EMP e 
WHERE ENAME = UPPER('clark') ;

SELECT *
FROM EMP e 
WHERE LOWER(ENAME) = 'clark' ;


-- 2) 문자열 길이 : LENGHT
--                  LENGTHB : 문자열에 사용된 바이트 수 반환
SELECT ENAME, LENGTH(ENAME), LENGTHB(ENAME) 
FROM EMP e ;

-- 함수 결과를 보고 싶은 데 테이블이 없을 경우  임시 테이블로 DUAL 사용
-- 한글은 문자 하나당 3byte 핟당, 영어 1byte
SELECT LENGTH('한글') FROM DUAL;

SELECT LENGTHB('한글') FROM DUAL;


-- 직책 이름이 6글자 이상인 사원 조회
SELECT *
FROM EMP e 
WHERE LENGTH(JOB) >= 6;


-- 3) 문자열 일부 추출 : substr(문자열 데이터, 시작위치, 추출길이)
--                       substr(문자열 데이터, 시작위치) : 시작위치~마지막까지 = 추출길이는 생략가능
--                       시작위치가 음수라면 오른쪽 끝부터 시작

SELECT job, SUBSTR(JOB,1,2), SUBSTR(job,3,2), SUBSTR(job,5)  
FROM EMP e ;

SELECT job, SUBSTR(JOB,-1,2), SUBSTR(job,-3,2), SUBSTR(job,-5)  
FROM EMP e ;


-- 4) INSTER(문자열 데이터, 위치를 찾으려는 문자, 시작위치, 시작위치에서 몇번째 위치)
--    문자열 데이터 안에서 특정 문자 위치 찾기

SELECT INSTR('HELLO, ORACLE!', 'L')  AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5)  AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2, 2)  AS INSTR_3
FROM DUAL ;


-- 사원 이름에 S 가 들어있는 사원 조회
-- LIKE 
SELECT *
FROM EMP e 
WHERE INSTR(ENAME, 'S') > 0;

-- 5) REPLACE : 특정 문자를 다른 문자로 변경
--              REPLACE(문자열데이터, 찾는문자, 변경할문자)

SELECT '010-1234-5678' AS REPLACE_before,
       REPLACE ('010-1234-5678', '-','') AS REPLACE_1,
       REPLACE ('010-1234-5678', '-') AS REPLACE_2,
       REPLACE ('010-1234-5678','-',' ') AS REPLACE_3
FROM DUAL ;
      


-- 6) CONCAT : 두 문자열 데이터를 합하는 함수
--             CONCAT(문자열 데이터1, 문자열데이터2)
SELECT CONCAT(EMPNO ,ENAME), CONCAT(EMPNO,ENAME,JOB)  
FROM EMP e 
WHERE ENAME = 'SMITH';

-- 7369 : SMITH 
SELECT CONCAT(EMPNO , ENAME), CONCAT(EMPNO, CONCAT(' : ',ENAME)) 
FROM EMP e 
WHERE ENAME = 'SMITH';


SELECT EMPNO || ' : ' || ENAME 
FROM EMP e 
WHERE ENAME = 'SMITH';


-- 7) TRIM : 공백 제거(기본)
--    TRIM(삭제옵션(선택), 삭제할문자) FROM 원본문자열
-- 'SMITH' = 'SMITH ', ' SMITH', ' SMITH '

SELECT '[' || ' __Oracle__ ' || ']' AS TRIM_BEFORE,
       '[' || TRIM(' __Oracle__ ') || ']' AS TRIM,
       '[' || LTRIM(' __Oracle__ ') || ']' AS LTRIM,
       '[' || RTRIM(' __Oracle__ ') || ']' AS RTRIM
FROM DUAL ;


-- LEADING(앞쪽), TRAILING(뒤쪽), BOTH(둘다)

SELECT '[' || '__Oracle__' || ']' AS TRIM_BEFORE,
       '[' || TRIM(LEADING '_' FROM '__Oracle__') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '__Oracle__') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '__Oracle__') || ']' AS TRIM_BOTH
FROM DUAL ;

-- 2. 숫자함수 : 숫자 데이터에 적용
--    반올림, 올림, 버림, 나머지 값 구하기
--    ROUND, CEIL, FLOOR, TRUNC, MOD


--    ROUND(숫자, 반올림 위치)
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678,0) AS ROUND1,
       ROUND(1234.5678,1) AS ROUND2,
       ROUND(1234.5678,2) AS ROUND3,
       ROUND(1234.5678,-1) AS ROUND_MINUS1,
       ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL ;


-- TRUNC(숫자, 버릴위치) : 버림
SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678,0) AS TRUNC0,
	TRUNC(1234.5678,1) AS TRUNC1,
	TRUNC(1234.5678,2) AS TRUNC2,
	TRUNC(1234.5678,-1) AS TRUNC_MINUS1,
	TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL ;


-- CEIL, FLOOR : 지정한 숫자와 가까운 정수를 찾기
-- CEIL : 지정한 숫자보다 큰 정수 중 가장 작은 정수 반환
-- FLOOR : 지정한 숫자보다 작은 정수 중 가장 큰 정수 반환
SELECT
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM DUAL ;


-- MOD : 나머지
SELECT 11/5, MOD(11,5)
FROM DUAL ;



-- 3. 날짜 함수 
-- 2023-01-24 or 2023/01/24

-- 오늘 날짜
SELECT SYSDATE , CURRENT_DATE , CURRENT_TIMESTAMP 
FROM DUAL ;

-- 날짜 데이터 + 숫자 : 날짜 데이터 보다 숫자만큼 이후의 날짜

SELECT SYSDATE , SYSDATE + 1 , SYSDATE -1
FROM DUAL ;


-- ADD_MONTHS() : 몇 개월 이후의 날짜 구하기
SELECT SYSDATE , ADD_MONTHS(SYSDATE,3)
FROM DUAL ;


-- 입사 30주년이 되는 날짜 구하기
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE ,360)
FROM EMP e ;


-- MONTHS_BETWEEN(날짜1, 날짜2) : 두 개의 날짜 데이터를 입력하고 두 날짜간의 개월 수 차이 구하기
-- 고용일과 오늘날짜 차이
SELECT
	EMPNO ,
	ENAME ,
	HIREDATE ,
SYSDATE,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))  AS MONTH3 
FROM EMP e ;


-- NEXT_DAY, LAST_DAY 
-- NEXT_DAY(날짜, 요일) : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- LAST_DAY(날짜) : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
	SYSDATE ,
	NEXT_DAY(SYSDATE, '월요일'),
	LAST_DAY(SYSDATE)
FROM DUAL ;


-- 데이터 타입(자료형)
-- NUMBER(숫자), VARCHAR2(문자), DATE(날짜/시간)
-- 자료형 변환(날짜 -> 문자, 문자 ->숫자)

-- NUMBER + 문자숫자 : 자동 형 변환으로 계산 처리
SELECT  EMPNO, ENAME, EMPNO + '500'
FROM EMP e 
WHERE ENAME = 'FORD';

-- 수치가 부적합 합니다
--SELECT  EMPNO, ENAME, EMPNO + 'ABCD'
--FROM EMP e 
--WHERE ENAME = 'FORD';


-- 명시적 형변환 
-- TO_CHAR(날짜(숫자) 데이터, '출력되기를 원하는 문자 형태') : 숫자, 날짜 데이터를 문자로 변환한다(주로 날짜 데이터에 사용) 
-- TO_NUMBER(문자열, 숫자형식) : 문자열 데이터를 지정한 형태의 숫자로 인식하여 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜로 변환한다



-- Y : 연도, M : 월, D : 일, HH : 시간,  MI : 분,  SS : ch, HH24 : 시를 24시간표기, AM(PM) : 오전, 오후표기 
SELECT
	TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
	SYSDATE,
	TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS AM')
FROM
	DUAL ;



SELECT
	1300 - '1500',
	'1300' + 1500
FROM
	DUAL ;

-- 수치가 부적합 합니다 
-- SELECT '1,300' + '1,500'
-- FROM DUAL ;


-- 9 : 숫자의 한 자리를 의미함(빈 자리를 채우지 않음)
-- 0 : 빈 자리를 0으로 채움
SELECT
	TO_NUMBER('1,300', '999,999') + TO_NUMBER('1,500', '999,999')
FROM
	DUAL ;


SELECT
	TO_CHAR(SAL, '999,999.00') AS sal1,
	TO_CHAR(SAL, '000,999,999.00') AS sal2
FROM
	EMP e ;


-- TO_DATE(문자, '인식될 날짜 형태) : 문자 데이터를 날짜 데이터로 변환
SELECT
	TO_DATE('2024-01-24') AS todate1,
	TO_DATE('20240124') AS todate2
FROM
	DUAL ;

-- 수치가 부적합 하다
-- SELECT '2024-01-24' - '2023-12-31' (날짜를 문자로 인식)
-- FROM DUAL ;

SELECT TO_DATE('2024-01-24') - TO_DATE('2023-12-31')
FROM DUAL ;


-- NULL 처리 함수
-- NULL * 숫자 => NULL, NULL + 숫자 => NULL
-- NULL 을 다른 값 으로 변경

SELECT EMPNO, ENAME , SAL, COMM , SAL + COMM 
FROM EMP e ;

-- NVL(NULL 인지 검사할 열이름(OR 데이터), 대체할 데이터)
SELECT
	EMPNO,
	ENAME,
	SAL,
	COMM,
	SAL + NVL(COMM, 0)
FROM
	EMP e ;


-- NVL2(NULL 인지 검사할 열이름(OR 데이터), NULL 이 아닐경우 반환 데이터(계산식), NULL 인 경우 반환 데이터(계산식))
SELECT
	EMPNO,
	ENAME,
	SAL,
	COMM,
	NVL2(COMM, 'O', 'X')
FROM
	EMP e ;

-- NVL2
-- COMM 이 NULL 이면 연봉=SAL*12, NULL 이 아니면 연봉=SAL*12+COMM
SELECT
	EMPNO,
	ENAME,
	SAL,
	COMM,
	NVL2(COMM, SAL*12+COMM, SAL*12) AS 연봉
FROM
	EMP e ;



-- JOB 이 MANAGER 라면 SAL * 1.1
-- JOB 이 SALESMAN 라면 SAL * 1.05
-- JOB 이 ANALYST 라면 SAL
-- JOB 이 나머지 직무 SAL * 1.03


-- DECODE 함수와 CASE 문
-- DECODE(검사대상, 조건1, 조건1이 참일때 반환할 결과, 
                    조건2, 조건2가 참일때 반환할 결과,........, 조건1~조건n 일치하지 않는경우 반환할 결과)

SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e ;



SELECT
	EMPNO,
	ENAME,
	JOB,
	SAL,
	CASE
		JOB 
		WHEN 'MANAGER' THEN SAL * 1.1
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL
		ELSE SAL  * 1.03
	END AS UPSAL2, 
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS UPSAL
FROM
	EMP e ;


-- COMM NULL 일 때 해당사항 없음
--      0 일 때 수당 없음
--    > 0  일 때   수당 : COMM

SELECT
	EMPNO,
	ENAME,
	COMM,
	CASE 
		WHEN COMM  IS NULL THEN '해당사항 없음'
		WHEN COMM = 0 THEN '수당 없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS COMM_TEXT
FROM
	EMP e ;




-- emp 테이블......반올림
SELECT
	EMPNO,
	ENAME,
	SAL,
	TRUNC(SAL / 21.5, 2) AS DAY_PAY,
	ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM
	EMP e ;


--EMP 테이블...... 추가수당은 N/A 로 출력
SELECT
	EMPNO,
	ENAME,
	HIREDATE,
    NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일') AS R_JOB,
	NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM
	EMP e ;






























