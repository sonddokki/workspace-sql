-- 단일행 함수

-- 문자함수
-- inicap(컬럼명) = 영어의 첫 글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
SELECT  email
        ,initcap(email)
        ,department_id    
FROM employees
where department_id = 100;

-- LOWER(컬럼명) / UPPER(컬럼명) = 입력되는 값을 전부 소문자/대문자로 변경하는 함수
SELECT  first_name
        ,lower(first_name)
        ,upper(first_name)
        ,department_id    
FROM employees
where department_id = 100;

-- SUBSTR(컬럼명, 시작위치, 글자수) = 주어진 문자열에서 특정길이의 문자열을 구하는 함수
SELECT  first_name
        ,SUBSTR(first_name,1,3) "이름" -- 첫번째 칸부터 3글자
        ,SUBSTR(first_name,-3,3) "이름요약" -- 뒤에서 세번째칸부터 3글자
FROM employees
where department_id = 100;

-- LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
-- LPAD() :왼쪽 공백에 특별한 문자로 채우기
-- RPAD() :오른쪽 공백에 특별한 문자로 채우기
SELECT  first_name
        ,lpad(first_name, 10, '*')
        ,rpad(first_name, 11, '~#!')
FROM employees;

-- REPLACE (컬럼명, 문자1, 문자2)
-- 컬럼명에서 문자1을 문자2로 바꾸는 함수
SELECT  first_name
        ,replace(first_name, 'a', '*') "name"   -- (칼럼의, 이것을, 이것으로 바꿔라) = (first_name의 a를 *로 바꿔라)
        ,replace(first_name, substr(first_name, 2, 3), '***') "event_name"  -- (first_name의 2번째글자부터 3글자를 ***로 바꿔라 )
FROM employees;

-- ================================================================================

-- 숫자함수
-- ROUND(숫자, 출력을 원하는 자리수) = 주어진 숫자의 '반올림'을 하는 함수
SELECT  round(123.346, 2) "r2"     -- .을 기준으로 오른쪽 두번째 글자를 반올림
        ,round(123.346, 0) "r0"    -- .을 기준으로 .에서 반올림 (.밑에 글자 반올림)
        ,round(123.456, -1) "r-1"  -- .을 기분으로 왼쪽 첫번째 글자를 반올림
FROM dual; -- dual은 가상 테이블

-- TRUNC(숫자, 출력을 원하는 자리수) = 주어진 숫자의 버림을 하는 함수
SELECT  trunc(123.346, 2) "r2"     -- .을 기준으로 오른쪽 두번째 글자를 버림
        ,trunc(123.346, 0) "r0"    -- .을 기준으로 .에서 반올림 (.밑에 글자 버림)
        ,trunc(123.456, -1) "r-1"  -- .을 기분으로 왼쪽 첫번째 글자를 버림
FROM dual; -- dual은 가상 테이블

-- ================================================================================

-- 날짜함수
-- SYSDATE = 현재날짜와 시간을 출력해주는 함수
select sysdate
from dual;

-- MONTH_BETWEEN(d1, d2) = d1날짜와 d2날짜의 개월수를 출력하는 함수 
select  first_name
        ,hire_date
        ,sysdate
        ,months_between(sysdate, hire_date) "결과"
       ,trunc(months_between(sysdate, hire_date),0) "버림" -- sysdate는 현재 컴퓨터 시간
from employees
where department_id = 100;

-- ================================================================================

-- TO_CHAR(숫자, ‘출력모양’)  숫자형?문자형으로 변환하기
SELECT  TO_char(987622113, '999999999') "9수 만큼출력"
        ,TO_char(987624, '00000999') "빈공간 0"
        , TO_char(987624, '$9999999') "$기호추가"
        , TO_char(9876, '9999.9999999999') "소숫점표시"
        , TO_char(9876, '999,999') "천 단위 구분기호"
        , TO_char(9876, '$0999,999.99') "종합"
FROM dual;

-- TO_CHAR 예제
-- 업무번호가 100인 사원의 월급을 $기호,천단위구분,소숫점두자리까지 표현하여 이름(first_name)과 함께 출력하시오
select  first_name,
        to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id =100;

-- ================================================================================

-- 변환함수>TO_CHAR(날짜, ‘출력모양’)  날짜?문자형으로 변환하기
select hire_date, 
       to_char(hire_date, 'YYYY-MM-DD HH24:MI:SS') "날짜,시간",
       to_char(hire_date, 'YY.MM.DD') "날짜",
       to_char(hire_date, 'YYYY-MM-DD HH:MI') "날짜, 시,분",
       to_char(hire_date, 'YY"년"MM"월"DD"일"') "날짜"
from employees
WHERE department_id = 100;

-- ================================================================================

-- NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
-- NVL(조사할 컬럼, NULL 일 경우 치환할 값)
-- NVL2(조사할 컬럼, NULL이 아닐때 치환할 값, NULL일때 치환할 값)

select  first_name
        ,commission_pct "커미션"
        ,salary "연봉"
        ,salary + salary*nvl(commission_pct, 0) "보너스합산연봉"
        ,nvl(commission_pct, 0) "커미션수정"
from employees;

select  first_name "이름"
        ,salary "연봉"
        ,commission_pct "커미션"
        ,nvl(commission_pct, 0) "커미션수정1"
        ,nvl2(commission_pct,100,0) "커미션수정2"
from employees;


