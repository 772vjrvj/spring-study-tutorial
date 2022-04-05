-- 공지사항 리스트
select * from notice; 

-- 현재 날짜와 시간 : 2021-01-06 11:51
-- 샘플 데이터 입력
-- 현재 공지 - 시작일 현재 날짜보다 작다. 종료일이 현재 날짜보다 크다.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '자바 개발자 과정 진행', '자바로 솔루션을 개발하는 과정',
'2020-12-10', '2021-05-28');
-- 지난 공지 - 종료일이 현재 날짜보다 작다.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '자바 개발자 과정 모집', '자바로 솔루션을 개발하는 과정',
'2020-11-10', '2020-12-16');
-- 예약 공지 - 시작일이 현재 날짜보다 크다.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '자바 개발자 과정 수료', '수료를 축하합니다.',
'2021-05-22', '2021-05-29');
-- 데이터 완전 적용 : 데이터 변경을 하면 접속해 있는 사용자 작업 내용을 다로 보관한다.
--   현재 작업하고 있는 사용자에게는 변경한 데이터를 적용해서 보여줌. 다른 사용자는 변경된 데이터를
--   제외시키고 보여준다.
-- 그래서 작업이 끝나면 완전 적용(commit)을 시키거나 취소(rollback)을 시켜야 한다.
commit;

-- 전체 데이터 출력
select * from notice;


--[[ 각각의 공지를 보여주는 쿼리 작성 - 리스트 : SQL활용]]--
-- 전체 공지 
select no, title, startDate, endDate, updateDate
from notice
order by no desc;
-- 현재 공지 - 시작일이 현재 날짜와 시간보다 작다. 종료일+1이 현재 날짜와 시간보다 크다.
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate + 1 > sysdate
order by no desc;

-- 예약 공지 - 시작일이 현재 날짜와 시간보다 크다.
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by no desc;

-- 지난 공지 - 종료일 + 1이 현재 날짜와 시간보다 작다.
select no, title, startDate, endDate, updateDate
from notice
where endDate + 1 < sysdate
order by no desc;

-- 위에 있는 내용으로 뷰테이블(가상 테이블) 만들기
-- 뷰테이블을 만드는 목적 : 쿼리를 간단한다.

--<<현재 공지의 뷰테이블 만들기>>
-- ** 반드시 "create view" 권한이 있어야만 한다. 관리자권한으로 접속해서 하셔야 합니다.
-- sys 계정에서 grant create view to java00; 실행
-- resource 롤 안에는 뷰테이블을 만드는 권한 없음.
-- 현재 공지 - 시작일이 현재 날짜와 시간보다 작다. 종료일+1이 현재 날짜와 시간보다 크다.
-- create는 만들기를 하기 때문에 있으면 오류가 발생
-- or replace 는 있는 경우 덮어 쓰기를 진행한다.
CREATE OR REPLACE VIEW notice_pre
AS
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate + 1 > sysdate
order by no desc;

-- 현재 공지를 보여주는 쿼리
select * from notice_pre;
-- 뷰테이블 - 실제적인 테이블로 존재하지 않는다. 쿼리(select)를 저장하고 있다가 실행한 결과를
-- 테이블 형식으로 제공해주는 것을 의미한다.

--<< 지난 공지의 뷰테이블 만들기 - notice_old >>
CREATE OR REPLACE VIEW notice_old
AS
select no, title, startDate, endDate, updateDate
from notice
where endDate + 1 < sysdate
order by no desc;

select  no, title, startDate, endDate, updateDate
from notice_old;

--<< 예약 공지의 뷰테이블 만들기 - notice_res >>
CREATE OR REPLACE VIEW notice_res
AS
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by no desc;

select no, title, startDate, endDate, updateDate
from notice_res;

