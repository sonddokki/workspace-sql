-- 전체 테이블 확인
SELECT * FROM tab;
-- person 테이블 확인
SELECT * FROM person; 


-- 테이블,시퀸스 전체 삭제
DROP TABLE person;
drop SEQUENCE seq_person_id;



-- person 테이블 생성
create table person(person_id  number(5)       -- pk
                    ,name varchar2(50)  not null
                    ,hp varchar2(50)
                    ,company varchar2(50)
                    ,PRIMARY KEY(person_id)    -- 프라이머리키 지정
                    );
                    
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_person_id 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     


INSERT INTO person
VALUES (seq_person_id.nextval, '손성진' , '010-7130-9913' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '정우성' , '111-2222-3334' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '이정재' , '222-3333-4444' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '박소담' , '010-7130-9913' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '매직박' , '010-7130-9913' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '침착맨' , '555-5555-3333' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '풍월량' , '111-5455-2333' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '우왁굳' , '421-3232-2322' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '소니쇼' , '010-7130-9913' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '오영택' , '010-7130-9913' , '412-2312-2312'  );
INSERT INTO person
VALUES (seq_person_id.nextval, '고세구' , '010-7130-9913' , '412-2312-2312'  );


DELETE FROM person 
WHERE name = '강호동' ;           

SELECT  person_id
        ,name
        ,hp
        ,company    
FROM person
where name like '%성%' ;

-- 테이블 출력 테스트

-- 리스트 아이디 공백주기 확인
SELECT  lpad(person_id, 2, '0') 
        ,name 
        ,hp 
       ,company 
FROM person ;

-- 수정
UPDATE person
set hp = '000-000-0000'
where name = '손성진';   

UPDATE person
set company = '999-999-9999'
where name = '손성진';   

UPDATE person  
set name = '송아지'  
where person_id = 27;


SELECT  person_id
        ,name 
        ,hp 
       ,company 
FROM person
where person_id = 1;


UPDATE person
set company = '999-999-9999'
where name = '손성진';   