-- SubQuery 다중행

-- 부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
-- 사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

-- (1) 부서번호가 110인 직원
select salary
from employees
where department_id = 110;

-- (2) 구해진 A 급여보다 높은사람 또는 B 급여보다 높은사람 모두 출력
select  first_name
        ,salary
from employees
where salary > 12008
or salary > 8300;

-- (3) 합치기 any 사용(조건이 or일때)
select  first_name
        ,salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110);
                        
--=================================================================
-- 부서번호가 110인 직원의 급여 보다 큰 모든 직원의 
-- 사번, 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)

-- (2) 구해진 A 급여보다 높은사람 또는 B 급여보다 높은사람 모두 출력
select  first_name
        ,salary
from employees
where salary > 12008
and salary > 8300;
-- 두개값을 모두 충족해야하기 때문에 급여가 12008이상인 사람만 출력

-- (3) all 사용(조건이 and일때)
select  first_name
        ,salary
from employees
where salary >all (select salary
                   from employees
                   where department_id = 110);

-- ============================================================================
-- @@@@@@각 부서별로 최고급여를 받는 사원을 출력하세요.@@@@@@@

-- 각 부서별 최고급여를 출력하는 쿼리문
select department_id, max(salary) salary
                   from employees
                   group by department_id;

-- ============================================================================
/* select 부서아이디, 사원아이디, 사원이름, 급여
   from 직원테이블
   where (부서아이디,급여) in (select 부서아이디, 최고(급여)
                             from 직원테이블
                             group by 부서아이디);
*/
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id);

-- ============================================================================
/* select e.부서아이디, e.사원아이디, e.사원이름, e.급여
   from 직원테이블 , (select 부서아이디, 최고(급여)
                             from 직원테이블
                             group by 부서아이디) s
   where e.부서아이디 = s.sd         (가상테이블 별명.부서아이디)
   and e.급여 = s.급여;
*/
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.salary;
    
-- ============================================================================                                   
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s 
where (e.department_id,e.salary) in ((s.department_id,s.salary));  -- 이것도 됨


-- ============================================================================    


