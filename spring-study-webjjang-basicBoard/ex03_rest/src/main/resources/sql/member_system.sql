--- [[회원관리 시스템에 필요한 스키마]] ---

-- 1. 객체 제거 - 회원테이블, 등급테이블
-- 제거 순서는 데이터를 사용하고 있는 테이블이 먼저 지운다. : 회원테이블 먼저 지운다.
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;


-- 2. 객체 생성 - 등급테이블, 회원테이블
-- 생성 순서는 원본데이터 쪽의 테이블을 먼저 만든다. : 등급테이블 먼저 만든다.
CREATE TABLE grade(
   gradeNo NUMBER(2) CONSTRAINT grade_gradeNo_pk PRIMARY KEY,
   gradeName VARCHAR2(20)
);

CREATE TABLE member(
id VARCHAR2(20) CONSTRAINT member_id_pk PRIMARY KEY, -- 아이디
pw VARCHAR2(20) CONSTRAINT member_pw_nn NOT NULL, -- 비밀번호
name VARCHAR2(30) CONSTRAINT member_name_nn NOT NULL, -- 이름
gender VARCHAR2(6) CONSTRAINT member_gender_nn NOT NULL
       CONSTRAINT member_gender_ck CHECK(gender in('남자','여자')), -- 성별
birth date CONSTRAINT member_birth_nn NOT NULL, -- 생년월일
tel VARCHAR2(13), -- 연락처
email VARCHAR2(50) CONSTRAINT member_email_nn NOT NULL, -- 이메일
regDate date DEFAULT sysdate, -- 가입일
conDate date DEFAULT sysdate, -- 최근 접속일
status VARCHAR2(6) DEFAULT '정상' 
       CONSTRAINT member_status_ck CHECK(status in ('정상','강퇴','탈퇴','휴면')), -- 상태
gradeNo NUMBER(2)  DEFAULT 1 CONSTRAINT member_gradeNo_fk REFERENCES grade(gradeNo) -- 등급
);

-- 3. 샘플 데이터 입력 - insert -> 원본 데이터 쪽의 데이터를 먼저 입력 - grade
-- <<grade 샘플 데이터>>
INSERT INTO grade VALUES (1, '일반회원');
INSERT INTO grade VALUES (9, '관리자');

-- <<member 샘플 데이터>>
-- 관리자 계정입력하기
INSERT INTO member(id, pw, name, gender, birth, email, gradeNo)
VALUES('admin','1111', '이영환','남자','1980-01-01','leelj1@nate.com', 9);
-- 일반회원 계정입력하기 - 회원가입을 할때 등급번호를 선택하지는 않는다. 기본값은 1(일반회원)로 셋팅해서 사용한다.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('test','1111', '홍길동','남자','1980-01-01','leelj1@nate.com');
COMMIT;



