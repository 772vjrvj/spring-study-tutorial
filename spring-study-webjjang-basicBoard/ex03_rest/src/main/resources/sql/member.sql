-- 0. 회원테이블 제거하기
--  테이블에서 제약조건을 사용하면 따로 관리를 하게 된다. 그런데 이런 것 때문에 테이블이 지워
--  지지 않을 수도 있다. 무조건 지우는 CASCADE CONSTRAINTS 옵션을 사용하여 제거하면 무조건 지워진다.
DROP TABLE member CASCADE CONSTRAINTS;

-- 1. 회원테이블 만들기
-- 테이블이름 - 회원(member)
-- 컬럼 이름 - 아이디(id), 비밀번호(pw), 이름(name), 나이(age), 연락처(tel)
-- 컬럼의 데이터 타입과 길이

-- << 문자열 타입 >>
-- CHAR : 고정길이 문자열 - 모든 데이터가 정해진 길이에 맞아야 한다. 
--                  맞지 않으면 나머지는 공백문자를 추가
-- VARCHAR : 가변 길이 문자열. 2000자 이내
-- VARCHAR2 : 가변 길이 문자열. 4000자 이내(****)

-- << 제약조건 : 입력 제한 : insert나 update에서 입력 데이터 검사 >>
-- PK(PRIMARY KEY) - 주키 : 중복배제(UK), NULL이면 안된다.(NN) - 데이터의 대표
-- NN(NOT NULL) - NULL이면 안된다. = 비워놓으면 안된다.
CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY, -- 아이디 ; 영문자와 숫자 조합으로 20자까지 사용가능라고 정의
pw VARCHAR2(20) NOT NULL,
-- 이름 : 한글기준으로 10자까지 입력 - 다른 프로그램에서는 한글을 2바이트 처리한다.
--   그러나 오라클 11g 부터는 한글을 3바이트 처리를 한다.
--   모든 제3국언어에 코드를 붙여서 중복이되는 코드가 하나도 없도록 처리한 것이다.
name VARCHAR2(30) NOT NULL, -- 이름
-- 숫자
--   NUMBER(숫자) - 정수
--   NUMBER(숫자-전체길이, 숫자-소숫점이하) - 실수
--   NUMBER - 오라클에서 사용가능한 길이 만큼
age NUMBER(3) NULL, -- 나이
tel VARCHAR2(13) NULL -- 연락처 : xxx-xxxx-xxxx
);

-- 데이터 확인
SELECT
    *
FROM member;

-- 객체 구조 확인
DESCRIBE member;
