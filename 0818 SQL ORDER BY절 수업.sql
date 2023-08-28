-- ORDER BY 절
/*
    오름차순 - asc
    내림차순 - desc
*/
--================================================================================
SELECT  first_name
        ,salary
FROM employees
WHERE salary >= 9000
ORDER by salary desc;
-- 큰거 -> 작은거 내림차순정렬 de sc

SELECT  first_name
        ,salary
FROM employees
WHERE salary >= 3000
ORDER by salary ASC;
-- 작은거 -> 큰거 오름차순정렬 a sc

SELECT  first_name
        ,salary
FROM employees
WHERE salary >= 3000
ORDER by first_name ASC;
-- 작은거 -> 큰거 오름차순정렬 a sc

--==================================================================================

-- 연봉은 내림차순, 연봉이 겹칠시 이름은 오름차순으로 정렬하시오.
SELECT  first_name
        ,salary
FROM employees
WHERE salary >= 9000
ORDER by salary desc, first_name asc;
-- 첫번째 조건 이후에 ,를 찍고 두번째 정렬조건을 삽입

-- 부서번호를 오름차순으로 정렬하고 부서번호, 연봉, 이름을 출력하세요.
SELECT  department_id "부서번호"
        ,salary "연봉"
        ,first_name "이름"
FROM employees
ORDER by department_id asc;

-- 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요.
SELECT  first_name "이름"
        ,salary "연봉"    
FROM employees
WHERE salary >= 10000
order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요.
SELECT  department_id "부서번호"
        ,salary "연봉"
        ,first_name "이름"    
FROM employees
order by department_id asc, salary desc;



