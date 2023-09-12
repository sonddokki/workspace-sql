-- board 테이블관리


-- 테이블,시퀸스 전체 삭제
DROP TABLE board;
drop SEQUENCE seq_board_no;

-- board 테이블 생성
create table board (no number,      
                    title varchar2(500), 
                    content varchar2(4000),
                    hit number not null ,
                    reg_date date,
                    user_no number not null ,
                    PRIMARY KEY(no)         -- 프라이머리키 지정
                    -- 테이블끼리 관계 만들기
                    ,CONSTRAINT no_fk FOREIGN KEY (user_no) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                    REFERENCES users(no)  -- REFERENCES 참조할테이블(참조할칼럼명)
                    );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_board_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     

--===============================================================================================        
INSERT INTO board
VALUES (seq_board_no.nextval, '글제목', '글내용', 100, SYSDATE, 1); 
INSERT INTO board
VALUES (seq_board_no.nextval, '스윗홈', '글내용', 100, SYSDATE, 15); 
INSERT INTO board
VALUES (seq_board_no.nextval, '글제목', '글내용', 100, SYSDATE, 27); 

--===============================================================================================    

SELECT  no
        ,title
        ,content
        ,hit
        ,reg_date
        ,user_no
FROM board;

-- 리스트 검색
SELECT  bo.no,
        bo.title,
        bo.content,
        bo.hit,
        bo.reg_date,
        us.name,
        us.no
FROM board bo, users us
where bo.user_no = us.no
ORDER BY bo.no desc;

-- 읽기글 하나
SELECT  bo.no,
        bo.title,
        bo.content,
        bo.hit,
        bo.reg_date,
        us.name
FROM board bo, users us
where bo.user_no = us.no
and bo.no = 6;

-- 삭제
DELETE from board
where user_no = 1
and no = 1;

-- 수정
 UPDATE board
set title = '대충 제목'
    ,content = '대충 내용'
where user_no = 1
and no = 1;

UPDATE board
set hit = hit+1
where user_no = 1;

SELECT
    *
FROM board;


   
SELECT  bo.no,
        bo.title,
        bo.content,
        bo.hit,
        bo.reg_date,
        us.name,
        us.no
FROM board bo, users us
where bo.user_no = us.no
and title like '%글%'
ORDER BY bo.no desc;



