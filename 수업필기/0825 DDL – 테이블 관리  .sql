-- webdb로 접속

-- 테이블 확인
SELECT
    *
FROM book;

-- 테이블 생성
-- create table 테이블이름( 칼럼이름() , , , , ); 함수
--       테이블이름(칼럼이름 자료형
create table book(book_id  number(5),      -- 숫자 (전체자리수)
                  title    varchar2(50),   -- 문자 (전체자리수) -- 전체자리수 생략하면 최대 4000byte
                  author   varchar2(10),   -- 위와 동일
                  pub_date date);          -- 날짜+시간 );
                  

-- 테이블에 컬럼 추가 
-- ALTER TABLE 테이블위치 ADD (추가할칼럼명 자료형());
ALTER TABLE book ADD (pubs VARCHAR2(50));

-- 칼럼 수정
-- 칼럼의 자료형 수정
-- ALTER TABLE 테이블 MODIFY (칼럼명 자료형);
ALTER TABLE book MODIFY (title VARCHAR2(100));

-- 칼럼의 이름 수정
-- ALTER TABLE 테이블 RENAME COLUMN 칼럼명 TO 바꿀칼럼명;
ALTER TABLE book RENAME COLUMN title TO subject;

ALTER TABLE book RENAME COLUMN subject TO 출판사;  -- 한글도 가능

-- 칼럼 삭제
-- ALTER TABLE 테이블 DROP (칼럼명);
ALTER TABLE book DROP (author);

-- 테이블 명 수정
RENAME book TO article;
-- 테이블 삭제
DROP TABLE article;

-- 테이블 확인
SELECT
    *
FROM article;
 
-- TRUNCATE 명령: 테이블의 모든 로우를 제거     --> DML delete문과 비교
TRUNCATE TABLE article;

-- 제약조건 (세부옵션)


SELECT
    *
FROM tab;
/*----------------------------------------------------------------------------------
테이블 만들기
*/----------------------------------------------------------------------------------
-- author 테이블
create table author (author_id number(10)                 -- 작가아이디생성
                    ,author_name varchar2(100) not null   -- 작가이름생성 null이면 안됨
                    ,author_desc varchar2(500)            -- 작가설명생성
                    ,primary key (author_id)              -- 프라이머리키 지정
                    );

-- book 테이블
create table book (book_id number(10)
                  ,title VARCHAR2(100) not null
                  ,pubs VARCHAR2(100)
                  ,pub_date DATE
                  ,author_id number(10)
                  ,PRIMARY KEY(book_id)  -- 프라이머리키 지정
                  -- 테이블끼리 관계 만들기
                  ,CONSTRAINT book_fk FOREIGN KEY (author_id) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                   REFERENCES author(author_id)  -- REFERENCES 참조할테이블(참조할칼럼명)
                  );









 
 