-- 회원등급 테이블
-- 1 : 일반회원, 9 : 관리자
-- 0. 등급테이블 제거
DROP TABLE grade CASCADE CONSTRAINTS;

-- 1. 등급테이블 만들기
CREATE TABLE grade(
   gradeNo NUMBER(2) CONSTRAINT grade_gradeNo_pk PRIMARY KEY,
   gradeName VARCHAR2(20)
);

-- 샘플데이터 넣기
INSERT INTO grade VALUES (1, '일반회원');
INSERT INTO grade VALUES (9, '관리자');
COMMIT;

