-- grades 테이블 관리


-- 전체 테이블 확인
SELECT * FROM tab;
-- person 테이블 확인
SELECT * FROM grades; 


-- 테이블,시퀸스 전체 삭제
DROP TABLE grades;
drop SEQUENCE seq_?;



-- grades 테이블 생성
create table person(person_id  number(5)       -- pk
                    ,name varchar2(50)  not null
                    ,hp varchar2(50)
                    ,company varchar2(50)
                    ,PRIMARY KEY(person_id)    -- 프라이머리키 지정
                    );
                    
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_person_id 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기 