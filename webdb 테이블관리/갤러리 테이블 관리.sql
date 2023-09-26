-- 전체 테이블 확인
SELECT * FROM tab;
-- person 테이블 확인
SELECT * FROM gallery; 


-- 테이블,시퀸스 전체 삭제
DROP TABLE gallery;
drop SEQUENCE seq_gallery_no;



-- person 테이블 생성
create table gallery(no  number       -- pk
                    ,user_no  number       -- fk
                    ,content varchar2(1000) 
                    ,filePath varchar2(500)
                    ,orgName varchar2(200)
                    ,saveName varchar2(500)
                    ,fileSize number
                    ,PRIMARY KEY(no)    -- 프라이머리키 지정
                    -- 테이블끼리 관계 만들기
                    ,CONSTRAINT gal_fk FOREIGN KEY (user_no) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                    REFERENCES users(no)  -- REFERENCES 참조할테이블(참조할칼럼명)
                    );
                    
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_gallery_no 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     


-- 등록
INSERT INTO gallery
VALUES (seq_gallery_no.nextval
                      , 1
                      ,'코멘트'
                      ,'파일경로'
                      ,'오리지날파일명'
                      ,'저장파일명'
                      , 100
                      );
                      
INSERT INTO gallery
VALUES (seq_gallery_no.nextval
                      , 1
                      ,null
                      ,'C:\\javaStudy\\upload\1695712819821f8e844c5-dea9-4e20-bf99-df0d1793137c.jpg'
                      ,'Park-Myung- Soo.jpg'
                      ,'1695712819821f8e844c5-dea9-4e20-bf99-df0d1793137c.jpg'
                      , 63548
                      );                      
                      
-- 리스트
SELECT  gal.no
        ,us.no
        ,us.name
        ,gal.content
        ,gal.filepath
        ,gal.orgname
        ,gal.savename
        ,gal.filesize       
FROM gallery gal, users us
where gal.user_no = us.no
ORDER BY gal.no desc;


SELECT  gal.no as no
			        ,us.no as userNo
			        ,us.name as userName
			        ,gal.content as content
			        ,gal.filepath as filepath
			        ,gal.orgname as orgname
			        ,gal.savename as savename
			        ,gal.filesize as filesize    
			FROM gallery gal, users us
			where gal.user_no = us.no
			ORDER BY gal.no desc;
            
 -- 삭제           
DELETE FROM gallery 
WHERE user_no = 1; 
