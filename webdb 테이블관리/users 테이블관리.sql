-- 전체 테이블 확인
SELECT * FROM tab;
-- author 테이블 확인
SELECT * FROM users; 

-- 테이블,시퀸스 전체 삭제
DROP TABLE users;
drop SEQUENCE seq_users_no;

--===============================================================================================
-- guestbook 테이블 생성
create table users      (no  number(5)     
                        ,id varchar2(20) unique not null
                        ,password varchar2(20) not null
                        ,name varchar2(20)
                        ,gender varchar2(20)
                        ,PRIMARY KEY(no)         -- 프라이머리키 지정
                        );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_users_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     
     
--===============================================================================================        
INSERT INTO users
VALUES (seq_users_no.nextval, '아이디', '99133', '손성진', 'male'); 

DELETE FROM users 
WHERE no = 2;

SELECT  no
        ,name    
FROM users
where id = '아이디'
and password = '99133';

--===테이블 확인===============
SELECT * FROM users; 

--===수정 쿼리문=======================================================================================        
UPDATE users
set password = '013013'
, name = '바꾼이름'
, gender = 'female'
where id = '아이디';


UPDATE users
set password = '1'
    , name = '이왕건'
    , gender = 'femle'
where id = '침착맨' ;
