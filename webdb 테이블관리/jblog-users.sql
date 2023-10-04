SELECT * FROM tab; 

SELECT * FROM users; 
SELECT * FROM blog; 

-- 테이블,시퀸스 전체 삭제
DROP TABLE users  ;
DROP TABLE blog  ;
drop SEQUENCE seq_users_no;

-- users 테이블 생성
create table users (userNo number    
                    ,id varchar2(50) not null UNIQUE
                    ,userName varchar2(100) not null
                    ,password varchar2(50) not null
                    ,joinDate date
                    ,PRIMARY KEY(userNo)         -- 프라이머리키 지정
                    );

--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_users_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     


--=================== 유저생성
INSERT INTO users
VALUES (seq_users_no.nextval
        ,'아이디'
        ,'손성진'
        ,'99133'
        ,SYSDATE); 

DELETE from users
where password = 1234;                
--===============================================================================================  


SELECT b.id
      ,u.username
      ,b.blogtitle
      ,b.logofile    
FROM users u, blog b
where u.id = b.id;

--=================================blog 테이블  ============================================                  
--===============================================================================================                  
        
-- users 테이블 생성
create table blog (id  varchar2(50)  
                  ,blogTitle varchar2(200) not null
                  ,logoFile varchar2(200)
                  ,PRIMARY KEY(id)         -- 프라이머리키 지정 
                  -- 테이블끼리 관계 만들기
                  ,CONSTRAINT blog_id FOREIGN KEY (id) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                  REFERENCES users(id)  -- REFERENCES 참조할테이블(참조할칼럼명)
                  );
                  
INSERT INTO blog
	     VALUES ( '침착맨'
	             , '이병건'+'의 블로그입니다.'
	             ,null );
                 
INSERT INTO blog
	     VALUES ( '손또끼'
	             ,'손성진'
	             ,null );
                 
        
        
--===============================================================================================  