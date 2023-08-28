-- JOIN

-- 테이블끼리 연결되어있는 프라이머리키(유일값 찾아갈 수 있는 키 포링키)를 이용해서 합치기(JOIN) 

-- 테이블 지도를 ERD라고 함

--직원의 이름과 직원이 속한 부서명을 함께 보고 싶다면
--select first_name, department_name
--from employees, departments;

--결과: 두 테이블의 행들의 가능한 모든 쌍이 추출됨
--일반적으로 사용자가 원하는 결과가 아님.
--107*27=2889

--카티젼 프로덕트(Cartesian Product)
--올바른 Join조건을 WHERE 절에 부여 해야 함.

SELECT  e.first_name "사원" -- 이 칼럼은 유일하기 때문에 테이블약자(테이블별명)를 지정하지 않아도 되지만 구분을 확실히 하기 위해 사용
--      ,department_id  -- 두 테이블에 중복으로 있기때문에 오류가 남
        ,e.department_id "부서번호"  -- 약자테이블을 활용하여 칼럼을 확실히 지정
        ,de.department_id "부서번호"  -- 칼럼명이 같으면 임의로 번호를 붙여버림 그래서 별명을 지정해서 구분
        ,de.department_name "부서"  -- 부서번호끼리 매칭된 값에 부서명을 잘 JOIN시키고 있음
FROM employees e, departments de           -- 테이블에 약자(Alias,별명)부여
WHERE e.department_id = de.department_id;  -- 약자(Alias)로 지정된 테이블안의 칼럼끼리 조건을 부여


-- 모든 직원이름, 부서이름, 업무명 을 출력하세요

SELECT  e.first_name "직원이름"
        ,d.department_name "부서이름"
        ,j.job_title "업무명" 
FROM employees e, departments d,jobs j  -- 테이블 3개 넣기
WHERE e.department_id = d.department_id -- 각테이블에서 같은 칼럼을 공유하는 부분을 조인
and e.job_id = j.job_id;  -- 조인할때는 보통 동시에 조건을 충족해야하는 and일 확률이 높음
 
-- department_id가 null값이라 빠진 사람을 찾으러~
-- OUTER Join
-- left outer join

SELECT  e.department_id
        ,e.first_name
        ,d.department_name
FROM employees e left outer join departments d  -- 왼쪽 테이블의 모든 row를 출력함
on e.department_id = d.department_id; -- department_id끼리의 값은 맞춤

-- 오라클에서는 (+)를 쓸 수 있음
select  e.department_id
        ,e.first_name
        ,d.department_name
from employees e, departments d
where e.department_id = d.department_id(+); 

-- =========================================================
-- right outer join 

SELECT  e.department_id
        ,e.first_name
        ,d.department_name  
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- 오라클에서는 (+)를 쓸 수 있음
SELECT  e.department_id
        ,e.first_name
        ,d.department_name  
FROM employees e ,departments d
WHERE e.department_id(+) = d.department_id;

-- right outer join  left outer join
SELECT  e.department_id
        ,e.first_name
        ,d.department_name  
FROM departments d LEFT OUTER JOIN employees e -- 테이블 순서를 바꿔서 적용
ON e.department_id = d.department_id;

-- ==========================================================
-- full outer join

SELECT  e.department_id
        ,e.first_name
        ,d.department_name  
FROM employees e full outer join departments d
ON e.department_id = d.department_id;

-- 오라클에서는 (+)를 쓸 수 있음 하지만 full에서는 못씀
SELECT  e.department_id
        ,e.first_name
        ,d.department_name  
FROM employees e , departments d
WHERE e.department_id(+) = d.department_id(+);

-- ============================================================
-- Self Join 자기자신을 참조하기

SELECT  e.employee_id  "사원번호"
        ,e.first_name  "사원이름"
        ,e.phone_number  "사원 폰번호"
        ,e.salary  "사원연봉"
        ,e.manager_id  "매니저번호"
        ,e2.first_name  "매니저이름"
        ,e2.phone_number  "매니저 폰번호"
FROM employees e, employees e2  -- 테이블 단계에서 별명(Alias)을 지어서 하나의 테이블을 두개로 나눔
WHERE e.manager_id = e2.employee_id
ORDER BY e.employee_id asc;

-- ===============================================================
-- 데이터 확인하기
SELECT
    *
FROM employees;

SELECT
    *
FROM departments;

SELECT
    *
FROM jobs;

