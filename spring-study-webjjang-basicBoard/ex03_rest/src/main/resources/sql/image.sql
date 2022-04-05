-- 이미지 게시판
-- 1. 객체 제거
DROP TABLE image;
DROP SEQUENCE image_seq;

-- 2. 객체 생성 - member 테이블이 먼저 있어야 합니다.
CREATE TABLE image(
no NUMBER CONSTRAINT image_no_pk PRIMARY KEY, -- 글번호
title VARCHAR2(300) NOT NULL, -- 제목
content VARCHAR2(2000) NOT NULL, -- 내용
id VARCHAR2(20) NOT NULL REFERENCES member(id), -- 작성자 아이디 -> 로그인이 먼저 되어야만 한다.
writeDate DATE DEFAULT SYSDATE, -- 작성일
fileName VARCHAR2(50) NOT NULL -- 첨부된 이미지 파일명
);
CREATE SEQUENCE image_seq;

-- 3. 샘플데이터
INSERT INTO image(no, title, content, id, fileName)
values(image_seq.nextval, '강아지', '귀여운 강아지','test','/image/dog01.jpg');
INSERT INTO image(no, title, content, id, fileName)
values(image_seq.nextval, '고양이', '야옹야옹 고양이','admin','/image/cat01.jpg');

COMMIT;

------------  이미지 게시판 운영
select * from image;
-- 이미지 게시판에서 가져와 데이터
--  : 이미지 번호(i), 제목(i), 아이디(i), 이름(m), 이메일(m), 작성일(i), 파일명(i)
--  inner join: 조인하려는 테이블에 모두 있는 데이터만 보여준다.
--             그 중에 equal 조인 pk = fk
---            <--> outter join : 한쪽에 데이터가 없더라고 보여준다.
-- 오라클의 표현식 : 오라클 조인(기본-inner join:equal 조인)
select i.no, i.title, i.id, m.name, m.email, i.writeDate, i.fileName
from member m, image i
where m.id = i.id;

-- ANSI join - 똑같은 조인인다. 모든 DBMS에서 사용가능
select i.no, i.title, i.id, m.name, m.email, i.writeDate, i.fileName
from image i JOIN member m ON(i.id = m.id);

