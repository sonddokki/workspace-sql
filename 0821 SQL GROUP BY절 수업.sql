-- GROUP BY 절

--부서번호별 평균연봉을 구하시오 
select  department_id
        ,avg(salary)
from employees
group by department_id
order by department_id asc;

--부서번호별 연봉합계를 부서번호 오름차순으로 구하시오 
select  nvl(department_id,0) "부서번호"
        ,sum(salary) "연봉합계"
from employees
group by department_id
order by nvl(department_id,0) asc;

--부서번호별 연봉합계를 연봉합계 내림차순으로 구하시오 
select  nvl(department_id,0) "부서번호"
        ,sum(salary) "연봉합계"
from employees
group by department_id
order by sum(salary) desc;

-- 부서별 업무와 담당인원수,연봉의합을 구하시오
select  nvl(department_id,0) "부서번호"
        ,job_id "업무"
        ,count(*) "담당인원수"
        ,sum(salary) "연봉합"
from employees
group by department_id, job_id
order by nvl(department_id,0) asc;


SELECT  department_id
        ,job_id
        ,sum(salary) 
FROM employees
GROUP BY department_id, job_id;

-- 연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
SELECT  nvl(department_id,0)
        ,COUNT(*)
        ,SUM(salary)    
FROM employees
--where salary >= 20000
GROUP BY department_id
ORDER BY nvl(department_id,0) asc;

SELECT
    *
FROM employees;





--===========================================================================
-- HAVING 절
SELECT  nvl(department_id,0)
        ,COUNT(*)
        ,SUM(salary)    
FROM employees
GROUP BY department_id
having sum(salary) >= 20000
ORDER BY nvl(department_id,0) asc;


