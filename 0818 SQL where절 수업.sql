SELECT  first_name            -- 가져온다 칼럼 퍼스트네임을
FROM employees                -- employees 테이블에서
where department_id = 10;     -- 칼럼 department_id가 10인 사람의

SELECT *                      -- 가져온다 칼럼(속성) 모두를
FROM employees                -- employees 테이블에서
where department_id = 10;     -- 칼럼 department_id가 10인 사람의

SELECT  first_name "이 름"      -- 가져온다 칼럼 퍼스트네임을 "이름"로 바꿔서
        ,department_id "부서 아이디"  -- department_id을 "부서 아이디"로 바꿔서
FROM employees                -- employees 테이블에서
where department_id = 10;     -- 칼럼 department_id가 10인 사람의
-- employees 테이블에서 칼럼 department_id가 10인 사람의 칼럼 퍼스트네임을 "이름"로 바꿔서,department_id을 "부서 아이디"로 바꿔서 가져온다

-- 연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요.
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE salary >= 15000;     -- 출력을 걸러내는 필터역할

-- 07/01/01 이후에 입사한 사원들의 이름과 입사일을 출력하세요.
SELECT  first_name "이름"
        ,hire_date "입사일"    
FROM employees
where hire_date >= '07/01/01';

-- 이름이 Lex인 직원의 연봉을 출력하세요.
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
where first_name = 'Lex';

-- 연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오. ( 조건 다수를 동시 충족 )
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE salary >= 14000
and salary <= 17000;
--===================== between연산자 사용 ===========================
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
where salary between 14000 and 17000;

-- 연봉이 4000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요. ( 조건 다수를 각각 충족 )
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE salary <= 4000 
or salary >= 17000;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요.
SELECT  first_name "이름"
        ,hire_date "입사일"
FROM employees
WHERE hire_date >= '04/01/01'
and hire_date <= '05/12/31';

-- 이름이 니나,렉스,존 인 사원의 이름과 연봉을 출력하세요.
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';
--======================= in 연산자 사용 ================================
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE first_name in ('Neena', 'Lex', 'John');

-- 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오.
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;
--======================= in 연산자 사용 ================================
SELECT  first_name "이름"
        ,salary "연봉"
FROM employees
WHERE salary in (2100, 3100, 4100, 5100);

--==================== Like 연산자 사용 =================================
-- 이름이 L로 시작하는 사원의 이름과 연봉을 출력하시오. 
select first_name, last_name, salary
from employees
where first_name like 'L%';

-- 이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요.
select first_name, last_name, salary
from employees
where first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name like '_a%';

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요.
select first_name, last_name, salary
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요.
select first_name, last_name, salary
from employees
where first_name like '__a_';

select first_name, last_name, salary
from employees
where first_name like '____'
and first_name like '%a_';

--======================= NULL ===========================
select  
        first_name
        ,salary
        ,commission_pct "판매수당"
        ,salary*commission_pct
from employees
where salary between 13000 and 15000;

-- 커미션이 null인 사원을 구하시오
select * 
--first_name, salary, commission_pct
from employees
where commission_pct is null;

-- 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요.
select  first_name "이름"
        ,salary "연봉"
        ,'0'||commission_pct||'%' "커미션비율"
from employees
where commission_pct is not null;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요.
SELECT  first_name "이름"
--        ,commission_pct "커미션비율"
--        ,manager_id "담당매니저"
FROM employees
WHERE commission_pct is null
and manager_id is null;





