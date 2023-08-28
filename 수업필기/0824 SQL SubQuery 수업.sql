-- SubQuery

-- 단일행

--'Den' 보다 급여를 많은 사람의 이름과 급여를 구하여라

-- 기존에 배운 방식대로라면 일단 Den의 월급을 구함
SELECT  first_name
        ,salary    
FROM employees
where first_name = 'Den';
-- 값 11000이 나옴
SELECT  first_name
        ,salary     
FROM employees
WHERE salary >= 11000;
-- 값 11000을 기준으로 그보다 급여가 많은 사람을 출력

-- subQuery => 조건문안에 질의문을 넣는다.
SELECT  first_name
        ,salary     
FROM employees
WHERE salary >= (SELECT salary    
                 FROM employees
                 where first_name = 'Den');

-- 'Den'보다 입사일이 빠른사람               
SELECT  first_name
        ,hire_date    
FROM employees
WHERE hire_date <= (SELECT hire_date 
                    FROM employees
                    WHERE first_name = 'Den');
                 
-- 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
SELECT  first_name
        ,salary
        ,employee_id
FROM employees
WHERE salary = (SELECT min(salary)    
                FROM employees);

-- 평균급여보다 적게 받는 사람들의 이름, 급여, 사원번호는? (급여 내림차순 출력)
-- 평균만 구하기
SELECT avg(salary)    
FROM employees; 

-- 합치기
SELECT  first_name
        ,salary
        ,employee_id
FROM employees
WHERE salary < (SELECT avg(salary)    
                FROM employees)
ORDER BY salary desc;

-- 다중행
-- Row 값이 여러개일때

SELECT *
FROM employees
where salary in (12008, 8300);

SELECT *
FROM employees
where salary = 12008
or salary = 8300;

-- 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요

-- 부서번호가 110인 직원
SELECT  first_name
        ,salary
FROM employees
WHERE department_id = 110;
-- 'Shelley' 와 'William'  (12008,8300)

SELECT
    *
FROM employees
WHERE first_name in ('Shelley', 'William');
-- 부서번호가 110이 아닌 'William'가 한놈 더 있음

SELECT salary
FROM employees
WHERE department_id = 110;
-- 부서번호가 110인 직원의 월급만 출력하게 만듦

SELECT  first_name
        ,salary
        ,employee_id
        ,department_id
FROM employees
WHERE salary in (SELECT salary
                 FROM employees
                 WHERE department_id = 110);
-- 부서번호가 110인 직원의 월급과 같은 직원을 전체사원에서 뽑아옴 (답 맞음)

-- 부서번호가 110인 직원은 빼고 출력해보자
SELECT  first_name
        ,salary
        ,employee_id
        ,department_id
FROM employees
WHERE salary in (SELECT salary
                 FROM employees
                 WHERE department_id = 110)
and department_id <> 110;              

-- 각 부서별로 최고급여를 받는 사원을 출력하세요

SELECT  nvl(department_id,0)
        ,max(salary)
FROM employees
GROUP BY department_id
ORDER BY nvl(department_id,0) asc;
-- 각 부서별 최고급여

SELECT  nvl(department_id,0)
        ,first_name
        ,salary
FROM employees
where salary in (SELECT max(salary)
                 FROM employees
                 GROUP BY department_id)
ORDER BY nvl(department_id,0) asc;                 
-- 이건 틀린답


SELECT  nvl(department_id,0)
        ,first_name
        ,salary
FROM employees
where department_id in (SELECT  department_id
                       FROM employees
                       GROUP BY department_id) 
         and salary in (SELECT max(salary)
                       FROM employees
                       GROUP BY department_id);
-- 다른부서 최고 월급이랑 같은 다른 부서사람도 출력됨 => 틀림           

SELECT  department_id
        ,max(salary)
FROM employees
GROUP BY department_id;

--=====================================못품=================================================

SELECT  department_id
        ,first_name
        ,salary
FROM employees
where (nvl(department_id,0),salary) in (SELECT nvl(department_id,0),max(salary)
                                        FROM employees
                                        GROUP BY department_id)       
ORDER BY nvl(department_id,0) asc;     
-- null인 애까지 표현한 정답

-- 연습
SELECT  department_id
        ,first_name
        ,salary
FROM employees
where (salary,department_id) in ( (12008,110) , (4400,10) ); 

-- where 문에 (A,B) in ((a,b),(a,b),(a,b)...)  이렇게 세트로 비교할 수 있음

-- =====================================================================================
SELECT
    *
FROM departments;

--SELECT  
--FROM 보여줄 테이블 A,B
--WHERE A테이블의 1칼럼과 B테이블의 1칼럼이 일치하는것들

-- 각 부서별로 최고급여를 받는 사원을 출력하세요 
-- 부서번호,부서명,사원번호,사원이름,사원폰번호,입사일,급여를 출력하시오  + 부서가 null인사람 중에서도 + 맡은 업무도

SELECT  nvl(em.department_id,0) "부서번호"
        ,nvl(de.department_name, '부서없음') "부서명"
        ,em.employee_id "사원번호"
        ,em.first_name || ' - ' || em.last_name "사원이름"
        ,js.job_title  "업무명"
        ,em.salary "급여"
        ,replace(em.phone_number,'.','-') "전화번호"
        ,em.email || '@gmail.com' "이메일"
        ,to_char(em.hire_date, 'YYYY-MM-DD') "입사일"
FROM (SELECT nvl(department_id,0) dep   
      FROM employees
      GROUP BY department_id) new,employees em, departments de, jobs js
where new.dep = nvl(em.department_id,0)
and nvl(em.department_id,0) = de.department_id(+)      
and em.job_id = js.job_id
and(new.dep,em.salary) in (SELECT nvl(department_id,0),max(salary)
                                           FROM employees
                                           GROUP BY department_id)
ORDER BY nvl(em.department_id,0) asc;

-- 성공!

/* 조건 직원테이블.부서아이디 = 부서테이블.부서아이디 
 그리고 직원테이블.업무아이디 = 업무테이블.업부아이디
 그리고 (직원테이블.부서아이디,직원테이블.연봉) 맞는 세트 ((부서아이디,최고연봉))
*/

