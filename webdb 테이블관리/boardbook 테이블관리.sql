-- boardbook 테이블관리

-- boardbook 테이블 생성
create table boardbook (num  number(5),      
                        title varchar2(80),  
                        id varchar2(20) unique not null , 
                        content varchar2(2000),
                        views number(20),
                        reg_date date,
                        PRIMARY KEY(num)         -- 프라이머리키 지정
                        -- 테이블끼리 관계 만들기
                        ,CONSTRAINT id_fk FOREIGN KEY (id) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                        REFERENCES users(id)  -- REFERENCES 참조할테이블(참조할칼럼명)
                        );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_num 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     

--===============================================================================================        
INSERT INTO boardbook
VALUES (seq_num.nextval, '글제목', '침착맨', '글내용', 100, SYSDATE); 
INSERT INTO boardbook
VALUES (seq_num.nextval, '글제목', '아이유', '글내용', 100, SYSDATE); 

--===============================================================================================    

SELECT  num
        ,title
        ,id
        ,content
        ,views
        ,reg_date
FROM boardbook





