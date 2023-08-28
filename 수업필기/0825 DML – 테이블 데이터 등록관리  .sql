/*****************************************************
   DML (테이블의 데이타)
        등록(c reate)  INSERT
        조회(r ead )   SELECT
        수정(u pdate)  UPDATE
        삭제(d elete)  DELET
        
        줄여서 CRUD
*****************************************************/
-- insert 문법

-- 묵시적 방법  
/*컬럼 이름, 순서 지정하지 않음. 
테이블 생성시 정의한 순서에 따라 값 지정*/

--INSERT INTO 테이블명
--VALUES ( 값 , 값 , 값 );   -- 테이블에있는 칼럼수만큼 지정해줘야함

INSERT INTO author
VALUES (1, '박경리', '토지 작가' );

-- 명시적 방법  
/*컬럼 이름명시적 사용
지정되지 않은 컬럼 NULL 자동입력*/

--INSERT INTO 테이블명 (칼럼명,칼럼명)
--VALUES ( 값 , 값 );   -- 지정한 칼럼에 세트로 맞춰서 삽입

INSERT INTO author( author_id, author_name )
VALUES (2, '이문열' );

INSERT INTO author(author_desc)
VALUES ('삼국지작가' );

INSERT INTO author( author_id, author_name,author_desc)
VALUES (3, '손성진','코드작성자' );

INSERT INTO author( author_id, author_name,author_desc)
VALUES (4123123, '고스트','존재하지않음' );

INSERT INTO author( author_name,author_id )
VALUES ('호스트', 5 );

/*****************************************************/
-- update 문법
-- UPDATE 테이블
-- set 칼럼명 = 바꿀값
-- where 절을 이용해 건드릴 칼럼(값) 선별하기

UPDATE author
set author_name = '기안84'
   ,author_desc = '방송인'
where author_id = 1;   

UPDATE author
set author_id = 4
where author_id = 4123123;   

-- WHERE 절이 생략되면 모든 레코드에 적용(주의)  
UPDATE author
SET author_name = '강풀' 
   ,author_desc = '인기웹툰작가';


UPDATE author
set author_name = '침착맨'
   ,author_desc = '유튜브스트리머'
where author_id = 2;   

UPDATE author
set author_name = '김풍'
   ,author_desc = '엔터테이너'
where author_id = 3;   

UPDATE author
set author_name = '궤도'
   ,author_desc = '과학커뮤니케이터'
where author_id = 4; 

UPDATE author
set author_name = '기안84'
where author_id = 1;

UPDATE author
set author_desc = '웹툰작가,방송인'
where author_name = '기안84' ;

update author
set author_desc = null
where author_name = '궤도';   

update author
set author_desc = '작가아님'
where author_name in ('궤도','빠니보틀');

/*****************************************************/
-- DELETE 문법
-- 한 줄을 다 삭제할때 사용
DELETE FROM author     -- 사용할 테이블 지정 
WHERE author_id = 1 ;  -- 조건문을 이용하여 칼럼값에 해당하는 줄을 삭제

-- TRUNCATE 명령: 테이블의 모든 로우를 제거     --> DML delete문과 비교
TRUNCATE TABLE author;



/*****************************************************/
-- 되돌리기 기능 같은것
commit;

insert into author
VALUES (8,'길','랩퍼');

ROLLBACK;

SELECT
    *
FROM author;



