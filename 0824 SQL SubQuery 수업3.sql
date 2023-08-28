-- rownum 임의번호를 부여하는 가상칼럼

-- 급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

select rownum, 
       first_name, 
       salary
from employees
WHERE rownum between 1 and 5
ORDER BY salary desc ;
-- 번호를 먼저 부여하기 때문에 정렬했을때 번호가 뒤섞임

select first_name, 
       salary
from employees
ORDER BY salary desc;
-- 급여 정렬을 먼저 해놓기

SELECT rownum, 
       first_name, 
       salary
FROM (select first_name, salary  -- 급여정렬테이블을 넣고 가상칼럼으로 번호를 매기기
      from employees
      ORDER BY salary desc)
WHERE rownum between 1 and 5;
  
  
select rownum,
       first_name,
       salary
from (select first_name, salary
      from employees
      order by salary desc)  -- rownum이 이시점에서 번호를 하나씩 부여함
where rownum >= 1    -- 현재예제의 답은 맞으나 숫자를 1보다 큰 수로 바꾸면 작동안됨
and rownum <= 5;  
  
                   
select ort.rn || '위' "순위"
       ,ort.first_name "이름" 
       ,ort.salary  "급여"
from(select rownum rn, first_name, salary  -- rownum 기능은 여기서 쓰므로 별명을 지어준다
-- 연봉으로 정렬된 테이블에 번호를 부여한 테이블을 생성하여 조건문을 실행하면 번호를 1보다 크게 바꿔도 실행됨
     from (select  first_name, salary
           from employees
           order by salary desc)) ort
--WHERE rn between 5 and 15; -- 여기도 between 사용 가능
where ort.rn >= 10
and ort.rn <= 15 ;


-- 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 

SELECT  emp.rn || '등'  "순위"
        ,emp.first_name  "이름"
        ,to_char(emp.salary, '$999,999') "급여"
        ,to_char(emp.hire_date, 'YYYY-MM-DD' ) "입사일"
FROM (SELECT  ROWNUM rn
              ,first_name
              ,salary
              ,hire_date   
      FROM (SELECT  first_name
                    ,salary
                    ,hire_date    
            FROM employees
            WHERE hire_date like '07%'
            ORDER BY salary desc)) emp 
WHERE emp.rn between 3 and 7;




            