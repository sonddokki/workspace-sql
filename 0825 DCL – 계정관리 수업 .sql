-- system으로 접속

-- DCL

-- 계정삭제
drop user webdb cascade;

-- 계정만들기
create user webdb identified by 1234;

-- 권한부여
grant resource, connect to webdb;

-- 비밀번호 변경
alter user webdb IDENTIFIED BY webdb;

