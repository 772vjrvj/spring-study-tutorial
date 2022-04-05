---[ 제약조건이 적용된 쿼리 만들기 ]---
-- 1) primary key - create table 할때 선언
-- 2) CONSTRAINT 테이블명_컬럼명_pk PRIMARY KEY - create table 할때 선언
-- 3) alter table member add constraint 테이블명_컬럼명_pk PRIMARY KEY (id)

-- 0. 회원 테이블 제거
DROP TABLE member CASCADE CONSTRAINTS;

-- 1. 회원 테이블 만들기
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
gradeNo NUMBER(2)  DEFAULT 1 CONSTRAINT member_gradeNo_fk REFERENCES grade(gradeNo), -- 등급
photo varchar2(100) DEFAULT '/upload/member/noImage.jpg' 
);

-- 정해진 데이터만 입력 가능하게 하는 방법
-- 1) check 2) 외래키

-- 샘플데이터 입력
-- insert into board(no, title, writer, writeDate) valuse(board_seq.nextval, 'java','javajjang','lee')
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', '이영환','남자','1980-01-01','leelj1@nate.com');
commit;

-- 데이터 확인
select * from member;

--<< 제약 조건 확인 >>--
-- pk:id - 위에 insert 처리문을 한번 더 실행한다. -> id가 중복이 되므로 오류가 발생된다.
-- nn:name - name 컬럼을 제외 시키거나 null이면 안된다.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', null,'남자','1980-01-01','leelj1@nate.com');
-- check:gender - CHECK(gender in('남자','여자')) - 남성이라는 데이터 입력 불가.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', '이영환','남성','1980-01-01','leelj1@nate.com');
-- fk : gradeNo - grade(gradeNo) : grade테이블에 데이터가 입력하고자 하는 gradeNo와 동일한 데이터가 있어야
--                     데이터 입력을 해준다. 아니면 오류 : 현재는 1,9 가 존재한다.
-- 이전 모든 데이터 제거하기
-- 오류가 난다. 자식데이터 때문에 
-- -> foriegn key(외래키, 참조키)로 연결이 되어 있는데 자식쪽에서 데이터가 입력이 되어 있으면
--   1. 기본적으로 부모키를 삭제하지 못하도록 막는다. --> 자식 데이터를 지우고 본인 데이터를 지운다.
--   2. 자식 테이블을 생성할 때 references member(id) on delete cascade 선언
--       -> 부모 데이터를 지우면 자동으로 자식 레코드 데이터도 지워진다.
--   2-1. 자식 테이블을 생성할 때 references member(id) on delete set null 선언
--       -> 부모 데이터를 지우면 자동으로 자식 데이터는 null로 바꾸어 저장한다.
--   3. 데이터를 새로 입력(수정을 위해서) -> 삭제가 안되면 delete대신 update 사용해서 데이터를 수정한다.
DELETE FROM member;
COMMIT;
select * from member;
-- 관리자 계정입력하기
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('admin','1111', '이영환','남자','1967-01-01','010-6324-5872','leelj1@nate.com', 9);
commit;
-- 일반회원 계정입력하기
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('test','1111', '홍길동','남자','1980-03-01', '010-1111-8888', 'honggd@naver.com', 1);
commit;
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('angel','1111', '김혜수','여자','1970-08-23','010-2222-1004' ,'angel@gmail.com', 1);
commit;

-- 전화번호와 생년월일, 이메일 수정 - 데이터를 찾는 조건 pk(id)
UPDATE member
set tel = '010-6324-5873', birth = '1967-01-01'
where id ='admin';
UPDATE member
set tel = '010-1111-8888', birth = '1980-01-01', email = 'honggd@naver.com'
where id ='test';
UPDATE member
set tel = '010-2222-1004', birth = '1970-09-05'
where id ='angel';
commit;


-- 등급 오류 계정입력하기 - 등급번호가 1, 9 가 아니면 오류
INSERT INTO member(id, pw, name, gender, birth, email, gradeNo)
VALUES('angel','1111', '김천사','여자','1980-01-01','leelj1@nate.com', 4);
commit;

-- 전화번호 뒷자리로 검색(1004) : 이름, 생년월일, 전화번호
select name, birth, tel
from member
where tel like '%1004';
-- 이름으로 검색(영) : 이름, 생년월일, 전화번호
select name, birth, tel
from member
where name like '%영%';
-- 이메일아이디로 검색(honggd) : 이름, 생년월일, 전화번호, 이메일
select name, birth, tel, email
from member
where email like 'hong%';

-- 전화번호 뒷자리로 검색(1004) : 이름, 생년월일, 전화번호(xxx-****-xxxx)
-- substr(문자열데이터, 잘라내는 시작 위치, 가져오는 문자열 갯수) : 부분 데이터 가져오기
-- substr(문자열데이터, 잘라내는 시작 위치) : 시작 위치부터 마지막 위치까지 가져오기
-- concat(문자열, 문자열) : 문자열 이어 붙이기 - 2개만 이어 붙일 수 있다.
--   concat(문자열, concat(문자열, 문자열)) - 3개 이어 붙이기 응용
-- 간단하게 문자열 이어 붙이기 : 문자열 || 문자열
select name, birth, substr(tel, 1, 4) || '****' || substr(tel, 9) tel
from member
where tel like '%1004';



