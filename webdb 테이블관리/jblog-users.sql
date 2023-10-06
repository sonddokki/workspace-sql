SELECT * FROM tab; 

SELECT * FROM users; 
SELECT * FROM blog; 
SELECT * FROM category; 
SELECT * FROM post; 
SELECT * FROM comments;

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
        
-- blog 테이블 생성
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
                 

UPDATE blog
set blogTitle = '013013'
   ,logoFile = 'female'
where id = '아이디';  
--===============================================================================================  

--=================================category 테이블  ============================================                  
--===============================================================================================         
-- category 테이블 생성
create table category (cateNo number  
                      ,id varchar2(50)
                      ,cateName varchar2(200) not null
                      ,description varchar2(500)
                      ,regDate date
                      ,PRIMARY KEY(cateNo)         -- 프라이머리키 지정 
                      -- 테이블끼리 관계 만들기
                      ,CONSTRAINT cate_id FOREIGN KEY (id) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                      REFERENCES blog(id)  -- REFERENCES 참조할테이블(참조할칼럼명)
                      );

-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_category_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기    

SELECT  ctr.rn
        ,ctr.cateNo
        ,ctr.id
        ,(SELECT count(p.cateno)
        FROM  blog b,category c,post p
        where b.id = c.id
        and c.cateno = p.cateno
        and b.id = '아이유'
        and ctr.cateNo = c.cateNo) post
        ,ctr.catename
        ,ctr.description
        ,ctr.regdate
FROM  (SELECT rownum rn
               ,ct.cateNo
               ,ct.id
               ,ct.catename
               ,ct.description
               ,ct.regdate    
        FROM  (SELECT   c.cateNo
                        ,c.id                       
                        ,c.catename
                        ,c.description
                        ,c.regdate
                FROM  blog b,category c
                where b.id = c.id
                and b.id = '아이유'
                ORDER BY c.cateno asc) ct) ctr
       ;

SELECT rownum rn
       ,ot.cateNo
       ,ot.id
       ,ot.catename
       ,ot.description
       ,ot.regdate    
FROM  (SELECT   c.cateNo
                ,c.id
                ,c.catename
                ,c.description
                ,c.regdate
        FROM  blog b,category c
        where b.id = c.id
        and b.id = '아이유'
        ORDER BY c.cateno asc) ct;



SELECT   c.cateNo
        ,c.id
        ,c.catename
        ,c.description
        ,c.regdate
FROM  blog b,category c
where b.id = c.id
and b.id = '아이유'
ORDER BY c.cateno asc;

DELETE FROM category 
WHERE id = '아이유'
and cateNo = 9;


--=================================post 테이블  ============================================                  
--===============================================================================================         
-- post 테이블 생성
create table post (    postNo number  
                      ,cateNo number
                      ,PostTitle varchar2(300) not null
                      ,postContent varchar2(4000)                      
                      ,regDate date not null
                      ,PRIMARY KEY(postNo)         -- 프라이머리키 지정 
                      -- 테이블끼리 관계 만들기
                      ,CONSTRAINT post_no FOREIGN KEY (cateNo) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                      REFERENCES category(cateNo)  -- REFERENCES 참조할테이블(참조할칼럼명)
                      );

-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_post_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기    

SELECT count(p.cateno)
FROM  blog b,category c,post p
where b.id = c.id
and c.cateno = p.cateno
and b.id = '아이유'
and p.cateno = 42;


SELECT  p.postno
       ,p.cateno
       ,p.posttitle
       ,p.postcontent
       ,p.regdate
FROM  blog b,category c,post p
where b.id = c.id
and c.cateno = p.cateno
and b.id = '아이유'
and p.cateno = 42
ORDER BY p.postno desc;

-- 최상단 카테고리의 글들 불러오기
SELECT  p.postno
       ,p.cateno
       ,p.posttitle
       ,p.postcontent
       ,to_char(p.regdate, 'yyyy/mm/dd') regDate
FROM  blog b,category c,post p
where b.id = c.id
and c.cateno = p.cateno
and b.id = '아이유'
and p.cateno = ( SELECT min(p.cateno) 
                 FROM  blog b,category c,post p
                 where b.id = c.id
                 and c.cateno = p.cateno
                 and b.id = '아이유') ;
                 
 SELECT  p.postno
       ,p.cateno
       ,p.posttitle
       ,p.postcontent
       ,to_char(p.regdate, 'yyyy/mm/dd') regDate
FROM  blog b,category c,post p
where b.id = c.id
and c.cateno = p.cateno
and b.id = '아이유'

and p.cateno = (SELECT min(p.postno) 
			                 FROM  blog b,category c,post p
			                 where b.id = c.id
			                 and c.cateno = p.cateno
			                 and b.id = '아이유');
SELECT min(c.cateno) 
	                 FROM  blog b,category c,post p
	                 where b.id = c.id
	                 and c.cateno = p.cateno
	                 and b.id = '아이유';

  SELECT  p.postno
			       ,p.cateno
                   ,c.cateName
			       ,p.posttitle
			       ,p.postcontent
			       ,to_char(p.regdate, 'yyyy/mm/dd') regDate
			FROM  blog b,category c,post p
			where b.id = c.id
			and c.cateno = p.cateno
			and b.id = '아이유'
			and p.cateno = 
		
					(SELECT min(c.cateno) 
	                 FROM  blog b,category c,post p
	                 where b.id = c.id
	                 and c.cateno = p.cateno
	                 and b.id = '아이유')
		
			ORDER BY p.postno desc;

ORDER BY p.postno desc   ;   
            
-- <if test="cate > 0">	and p.cateno = #{cate} </if>      
       
-- 최근글만 불러오기
SELECT  p.postno
       ,p.cateno
       ,p.posttitle
       ,p.postcontent
       ,to_char(p.regdate, 'yyyy/mm/dd') regDate
FROM  blog b,category c,post p
where b.id = c.id
and c.cateno = p.cateno
and b.id = '아이유'
and p.postno = ( SELECT MAX(p.postno) 
                 FROM  blog b,category c,post p
                 where b.id = c.id
                 and c.cateno = p.cateno
                 and b.id = '아이유') ;    
                 
--=================================comments 테이블  ============================================                  
--===============================================================================================         
-- comments 테이블 생성
create table comments (cmtNo number
                      ,postNo number  
                      ,userNo number
                      ,cmtContent varchar2(1000) not null          
                      ,regDate date not null
                      ,PRIMARY KEY(cmtNo)         -- 프라이머리키 지정 
                      -- 테이블끼리 관계 만들기
                      ,CONSTRAINT userCmt FOREIGN KEY (userNo) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                      REFERENCES users(userNo)  -- REFERENCES 참조할테이블(참조할칼럼명)
                      ,CONSTRAINT postCmt FOREIGN KEY (postNo) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                      REFERENCES post(postNo)  -- REFERENCES 참조할테이블(참조할칼럼명)
                      );

-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_comments_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기 


SELECT  c.cmtNo
       ,c.postNo
       ,c.userNo
       ,u.userName
       ,c.cmtContent
       ,to_char(c.regdate, 'yyyy/mm/dd') regDate
FROM  comments c, users u
where c.userNo = u.userNo
and c.postno = 20;


