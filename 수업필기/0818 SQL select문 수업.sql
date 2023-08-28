-- 단일주석
/*
여러줄 주석
*/

-- select 문 기본
select * from employees;
select * from departments;
select * from jobs;

-- 원하는 컬럼 가져오기
select first_name from employees;

-- 사원의 이름과 전화번호 입사일 연봉을 출력하세요.
select first_name
       ,phone_number
       ,hire_date
       ,salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요.
select  first_name
        ,last_name
        ,salary
        ,phone_number
        ,email
        ,hire_date
from employees;

-- 출력 칼럼명 변경하기
select employee_id as empNO, first_name "f-name", salary "연 봉" 
from employees;

-- 사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요.
select first_name as 이름
       ,phone_number "phoneNumber"
       ,hire_date 입사일
       ,salary "연봉"
from employees;       

-- 사원의 사원번호 이름(first_name) 성(last_name) 연봉 전화번호 이메일 입사일로 표시되도록 출력하세요.
select  employee_id as 사원번호
        ,first_name as 이름
        ,last_name as 성
        ,salary as 연봉
        ,phone_number as 전화번호
        ,email as 이메일
        ,hire_date as 입사일
from employees;

-- 사원의 eID 이름(first_name) 성(last_name) 연 봉 전화번호 이메일 입사일로 표시되도록 출력하세요.
select  employee_id "eID"
        ,first_name as 이름
        ,last_name 성
        ,salary "연 봉"
        ,phone_number as 전화번호
        ,email as 이메일
        ,hire_date as 입사일
from employees;

-- 컬럼들을 합쳐서 출력해보세요. (연결연산자)
SELECT  first_name || ' - ' || last_name 
        as name
FROM employees;
-- ""은 컬럼명을 별명으로 출력할때만 사용 그외에는 ''작은 따옴표만 사용
SELECT  first_name || '의 입사일 = ' || hire_date "직원"
    
FROM employees;

-- 산술연산자 사용하기
SELECT  first_name
        ,salary
FROM employees;

SELECT  first_name
        ,salary as 월급
        ,salary*12 as 연봉
FROM employees;

SELECT  first_name
        ,salary/30 as 일급
        ,salary*12 as 연봉
FROM employees;

SELECT  'name ' || first_name
        ,salary+2200 as 월급
        ,(salary+2200)*12 as 연봉
FROM employees;

SELECT  job_id * 10  -- job_id는 문자라서 * 곱할 수 없음
FROM employees;

-- 전체직원의 정보를 다음과 같이 출력하세요.
SELECT  first_name||' - '||last_name "성명"
        ,salary "급여"
        ,salary*12 "연봉"
        ,(salary*12)+5000 "연봉2"
        ,phone_number as "전화번호"
FROM employees;



