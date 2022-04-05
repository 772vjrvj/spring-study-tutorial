-- 0. 사용자(객체) 제거
-- CASCADE : 관련된거 다 지우지는 옵션
-- 왼쪽 접속에서는 적용이 안된 것으로 나타나지만 새로고침을 하면 보인다.
DROP USER java00 CASCADE;
-- 1. 사용자(객체) 계정 만들기(관리자 권한이 필요하다.)
-- 오라클에서 객체에 해당되는 것을 만들 때 - CREATE 
-- 오라클에서 객체에 해당되는 것을 제거할 때 - DROP
-- 오라클에서 객체에 해당되는 것을 수정할 때 - ALTER
CREATE USER java00 IDENTIFIED BY java00;
-- CREATE USER 사용자이름(=DB이름) IDENTIFIED BY 암호;
-- 계정은 만들어 졌으나 권한이 없어서 접속도 안되고 사용도 안된다.

-- 2. 사용자 권한 부여하기(관리자 권한이 필요하다.)
-- 접속권한(CONNECT),
-- 자원을 관리해 주는 권한(create table, select, ..., 많다.- 롤:하나로 만듬-RESOURCE)
-- GRANT <-> REVOKE
GRANT CONNECT, RESOURCE TO java00;

-- 3. 사용자 정보 변경
ALTER USER java00 IDENTIFIED BY "1234";
