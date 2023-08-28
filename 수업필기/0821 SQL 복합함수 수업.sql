-- 그룹함수

-- avg(salary) = 평균값을 반환합니다.

--SELECT  first_name,
--        to_char(salary,'999,999'),
--        avg(salary)
--FROM employees;

SELECT avg(salary)
FROM employees;

-- 커미션 비율의 평균을 구하시오
select  count(*)
        ,sum(commission_pct)
        ,avg(commission_pct)
from employees;

-- null을 0으로 바꿔서 포함된 평균
select  count(*)
        ,sum(commission_pct)
        ,avg(nvl(commission_pct,0))
from employees;

-- ======================================================================

-- count() = 함수에 입력되는 데이터의 총 건수를 구하는 함수 (null은 제외)

SELECT  count(first_name),
        count(commission_pct),
        count(nvl(commission_pct,0)),
        count(*)        
FROM employees;

-- employees 테이블에서 연봉이 4000이상인 사람의 수를 구하시오.(count)
select count(*)
from employees
where salary >= 4000;

-- ======================================================================

-- sum() = 입력된 데이터들의 합계 값을 구하는 함수
select  count(*) "사원 수", -- 총 데이터(사원) 수
        sum(salary) "연봉합", -- 지급연봉의 총 합
        avg(salary) "연봉평균", -- 지급연봉의 평균값
        sum(salary)/count(*) "연봉평균" -- 지급연봉의 총 합 나누기 총 사원의 수 = 평균
from employees;


select  sum(salary),
        avg(salary),
        count(salary),
        count(*)
from employees
where salary > 16000;

-- ======================================================================
-- max() / min()
-- 입력된 값들중 가장 큰값/작은값 을 구하는 함수
-- 여러건의 데이터를 순서대로 정렬 후 값을 구하기때문에 데이터가 많을 때는 느리다(주의해서 사용) 

select  count(*),
        max(salary),
        min(salary)
from employees;

select  count(*),
        max(first_name)
from employees;

SELECT  first_name
--        ,MAX(salary)    
FROM employees
WHERE salary != MAX(salary);
