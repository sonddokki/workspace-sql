-- 지난수업 복습
SELECT  SUM(salary),
        department_id    
FROM employees
GROUP BY department_id;



-- 부서별로 함계를 내시오
-- (부서별 합계가 10000이상 되는 부서만)
SELECT  sum(salary),
        department_id
FROM employees
GROUP by department_id
HAVING sum(salary) >= 10000;

-- HAVING 절
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

-- CASE ~ END 문 / DECODE() 함수
-- jop_id가 특정 업무면 보너스를 지급

SELECT  employee_id,
        first_name,
        job_id,
        salary,
        CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
             WHEN job_id = 'SA_REP'     THEN salary + salary * 0.2
		     WHEN job_id = 'ST_CLERK'   THEN salary + salary * 0.3
             ELSE salary
	    END Salary_bouns
FROM employees;

-- DECODE 문
SELECT  employee_id,
        first_name,
        salary,
        job_id,
--        decode (1일때 a 2일때는 b)as bouns
        decode(job_id ,'AC_ACCOUNT',salary + salary * 0.1,
                       'SA_REP',salary + salary * 0.2,
                       'ST_CLERK',salary + salary * 0.3,
                       salary ) bouns
FROM employees;

--[예제]
--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.

SELECT first_name,
        department_id,
        CASE WHEN department_id BETWEEN 10 and 50 THEN 'A-TEAM'
             WHEN department_id BETWEEN 60 and 100 THEN 'B-TEAM'
             WHEN department_id BETWEEN 110 and 150 THEN 'C-TEAM'
             ELSE '팀없음'
	    END TEAM
FROM employees
ORDER by TEAM asc;


