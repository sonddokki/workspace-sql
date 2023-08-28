-- 시퀀스 삽입 (일렬번호부여 생성기)
CREATE SEQUENCE seq_author_id   -- 해당칼럼에 일렬번호 생성하기
INCREMENT BY 1                  -- 1씩 올리기 
START WITH 1                    -- 1부터 시작하기
nocache;                        -- 미리번호 생성 쓰지않기


INSERT INTO author
VALUES (seq_author_id.nextval, '매직박', '치과의사' );

SELECT
    *
FROM author;

SELECT
    *
FROM user_sequences;

DELETE FROM author     -- 사용할 테이블 지정 
WHERE author_id BETWEEN 8 and 38;

-- 작가시퀸스의 현재값확인 (가상테이블 dual 사용)
SELECT seq_author_id.currval
from dual;



-- 시퀸스 삭제
drop SEQUENCE seq_author_id;


-- 시퀸스 재생성
CREATE SEQUENCE seq_author_id   -- 해당칼럼에 일렬번호 생성하기
INCREMENT BY 1                  -- 1씩 올리기 
START WITH 9                    -- 9부터 시작하기
nocache;                        -- 미리번호 생성 쓰지않기

commit;
ROLLBACK;

-- 테이블 날리기
drop TABLE author;

drop TABLE book;