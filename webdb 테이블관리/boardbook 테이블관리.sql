-- board 테이블관리
--  보드북이 아닌 보드로 관리
SELECT * FROM tab; 

SELECT * FROM board; 

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
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1);       
INSERT INTO board
VALUES (seq_board_no.nextval, '페이징테스트용', '페이징테스트용', 0, SYSDATE, 1); 
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

select  bo.no as no
				    ,bo.title as title
					,bo.content as content
					,bo.hit as hit
					,bo.reg_date as regDate
					,us.name as name
					,us.no as userNo
			FROM board bo, users us
			where bo.user_no = us.no
			ORDER BY bo.no desc;


--==== 계층형 게시판 만들기 =====================================================================        

SELECT * FROM rboard; 

-- 테이블,시퀸스 전체 삭제
DROP TABLE rboard;
drop SEQUENCE seq_rboard_no;

-- board 테이블 생성
create table rboard (no number,      
                    title varchar2(500), 
                    content varchar2(4000),
                    hit number not null ,
                    reg_date date,
                    user_no number not null ,
                    group_no number,   
                    order_no number,   
                    depth number,
                    PRIMARY KEY(no)         -- 프라이머리키 지정
                    -- 테이블끼리 관계 만들기
                    ,CONSTRAINT rNo_fk FOREIGN KEY (user_no) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                    REFERENCES users(no)  -- REFERENCES 참조할테이블(참조할칼럼명)
                    );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_rboard_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     

--===============================================================================================  
-- 게시글 등록시
INSERT INTO rboard
VALUES (seq_rboard_no.nextval 
        ,'글제목'
        ,'글내용'
        ,0 
        ,SYSDATE
        ,1
        ,seq_rboard_no.nextval + 1
        ,1 + 1
        ,0); 
-- 순서 (no지정, 제목, 내용, 조회수, 날짜, 그룹번호, 그룹내순서, 깊이)
--===============================================================================================  
-- 게시글 등록시
INSERT INTO rboard
VALUES (seq_rboard_no.nextval, '글제목', '글내용', 0 , SYSDATE, 1,1,1,0); 
-- 순서 (no지정, 제목, 내용, 조회수, 날짜, 그룹번호, 그룹내순서, 깊이)
-- 댓글 등록시
INSERT INTO rboard
VALUES (seq_rboard_no.nextval, '글제목', '글내용', 0 , SYSDATE, 1,1,1,0); 

UPDATE rboard
set order_no = (order_no+1)
where group_no = 69
and order_no > 1 ;

UPDATE rboard
set title = '>'+ title
where depth != 0;

select  bo.no as no
        ,LENGTH(bo.title) as LENGTH
        ,bo.title
        ,LPAD(bo.title,bo.depth+LENGTH(bo.title),'↳') as title1
        ,LPAD(' ',bo.depth+1,'↳')|| bo.title as title2
        ,LPAD(bo.title,bo.depth,'↳')|| bo.title as title3
        ,LPAD(bo.title,20,'↳') as title4
        ,LPAD(bo.title,(LENGTH(bo.title)),'↳') as title5
        ,LPAD(bo.title,(bo.depth+LENGTH(bo.title)),'↳') as title6
        ,bo.content as content
        ,bo.hit as hit
        ,bo.reg_date as regDate
        ,us.name as name
        ,us.no as userNo
        ,bo.group_no
        ,bo.order_no
        ,bo.depth
FROM rboard bo, users us
where bo.user_no = us.no
ORDER BY bo.group_no desc
        ,bo.order_no asc;
                    
select  bo.no as no
        ,LPAD('>',bo.depth,'>')|| bo.title as title
        ,bo.content as content
        ,bo.hit as hit
        ,bo.reg_date as regDate
        ,us.name as name
        ,us.no as userNo
FROM rboard bo, users us
where bo.user_no = us.no
ORDER BY bo.group_no desc
        ,bo.order_no asc;

UPDATE rboard
			set order_no = #{orderNo}+1
			where group_no = 93} 
			and order_no > 1;
            
          
            SELECT r.*
		  FROM (SELECT r.*, ROWNUM rown
		          FROM (SELECT r.*		                       
		                  FROM rboard r, users u
		                 WHERE r.user_no = u.no
		                 ORDER BY r.group_no desc, r.order_no) r) r
		WHERE rown BETWEEN 1 AND 5;
            
     
SELECT
    *
FROM ;      
 
-- 페이징처리용 쿼리문
SELECT rn2.*
FROM (SELECT rn.*, ROWNUM rown
      FROM  (select  bo.no as no
            ,LPAD(' ',bo.depth+1,'↳')|| bo.title as title
            ,bo.content as content
            ,bo.hit as hit
            ,bo.reg_date as regDate
            ,us.name as name
            ,us.no as userNo
     FROM rboard bo, users us
     where bo.user_no = us.no
     and bo.title LIKE '%%'
     ORDER BY bo.group_no desc
             ,bo.order_no asc) rn) rn2
WHERE rown BETWEEN 1 AND 6;

--////////////////////////////////////////////////////////////////////   
  
-- 페이징 리스트 쿼리문 

SELECT   ort.rn
        ,ort.no
        ,ort.title
        ,ort.content
        ,ort.hit
        ,ort.regDate
        ,ort.name 
        ,ort.userNo      
FROM (SELECT   rownum rn
              ,ot.no
              ,ot.title
              ,ot.content
              ,ot.hit
              ,ot.regDate
              ,ot.name 
              ,ot.userNo     
        FROM  (select b.no
                     ,b.title
                     ,b.content
                     ,b.hit
                     ,to_char(b.reg_date, 'yyyy-mm-dd hh:mi') regDate
                     ,u.name 
                     ,b.user_no userNo    
              from board b, users u
              where b.user_no = u.no
              ORDER BY u.no asc) ot ) ort
where ort.rn >= 151
and ort.rn <= 156;


SELECT rownum
      ,ot.no
      ,ot.title
      ,ot.content
      ,ot.hit
      ,ot.regDate
      ,ot.name 
      ,ot.userNo     
FROM  (select b.no
             ,b.title
             ,b.content
             ,b.hit
             ,to_char(b.reg_date, 'yyyy-mm-dd hh:mi') regDate
             ,u.name 
             ,b.user_no userNo    
      from board b, users u
      where b.user_no = u.no
      ORDER BY u.no asc) ot
where rownum >= 1
and rownum <= 10;







  
select  bo.no as no
        ,bo.title
        ,bo.group_no
        ,bo.order_no
        ,bo.depth
FROM rboard bo, users us
where bo.user_no = us.no
ORDER BY bo.group_no desc
        ,bo.order_no asc;
        
        
        