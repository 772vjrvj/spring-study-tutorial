-- 0. 게시판 테이블 제거
DROP TABLE board CASCADE CONSTRAINTS;

-- 1. 게시판 테이블 생성
CREATE TABLE board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL,
-- SYSDATE : 오라클에서의 오늘 날짜를 의미하는 키워드
writeDate DATE DEFAULT SYSDATE, -- DEFAULT 값이 셋팅되어 있으면 NOT NULL을 사용하지 않는다.(의미없음)
hit NUMBER DEFAULT 0
);

-- 게시판 시퀀스 : 오라클에만 있는 객체
-- 게시판테이블(board)과는 완전 별개 - 단지 이름을 게시판에서 사용한다고 표시하는 것 뿐이다.
-- 목적 : 중복이 되지 않는 숫자를 사용하고 싶을 때 쓴다. 다음번호 : .nextval -> .nextval를 사용하면
--        현재글번호를 가르키는 키워드를 사용가능 : currentval
-- 0. 게시판을 위한 시퀀스 제거
DROP SEQUENCE board_seq;

-- 1. 게시판을 위한 시퀀스 생성
CREATE SEQUENCE board_seq;

-- [2. 샘플데이터 넣기]
