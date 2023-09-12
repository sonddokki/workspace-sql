-- 전체 테이블 확인
SELECT * FROM tab;
-- author 테이블 확인
SELECT * FROM guestbook; 

-- 테이블,시퀸스 전체 삭제
DROP TABLE guestbook;
drop SEQUENCE seq_no;

--===============================================================================================
-- guestbook 테이블 생성
create table guestbook (no  number(5),      
                        name varchar2(80),  
                        password varchar2(20),
                        content varchar2(2000),
                        reg_date date,
                        PRIMARY KEY(no)         -- 프라이머리키 지정
                        );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     
     
--===============================================================================================        
INSERT INTO guestbook
VALUES (seq_no.nextval, '손성진', '99133', '안녕하세요',SYSDATE); 
INSERT INTO guestbook
VALUES (seq_no.nextval, '이정재', '913', '반갑습니다',SYSDATE); 
INSERT INTO guestbook
VALUES (seq_no.nextval, '오영택', '9133', '오랜만이에요',SYSDATE); 
INSERT INTO guestbook
VALUES (seq_no.nextval, '고세구', '133', '즐거운하루되세요',SYSDATE); 
INSERT INTO guestbook
VALUES (seq_no.nextval, '침착맨', '99133', '오히려 좋아',SYSDATE); 
INSERT INTO guestbook
VALUES (seq_no.nextval, '아이유', '99133', '안녕 오래 기다렸지',SYSDATE); 
--===============================================================================================        

-- 

                   
-- 출력         
SELECT  no
        ,name
        ,password
        ,content
        ,reg_date    
FROM guestbook;

-- 삭제
DELETE FROM guestbook 
WHERE password = ;

DELETE FROM guestbook 
WHERE no = 5;

