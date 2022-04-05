-- 공지사항
-- 0. 공지사항 테이블 제거
DROP TABLE notice CASCADE CONSTRAINTS;

-- 시퀀스 제거
DROP SEQUENCE notice_seq;

-- 1. 공지사항 테이블 생성
CREATE TABLE notice(
no NUMBER PRIMARY KEY, -- 공지번호
title VARCHAR2(300) NOT NULL, -- 공지제목
content VARCHAR2(2000) NOT NULL, -- 공지 내용
startDate date DEFAULT SYSDATE, -- 공지 시작일
endDate date DEFAULT '9999-12-30', -- 공지 종료일
writeDate date DEFAULT SYSDATE, --공지 작성일
updateDate date DEFAULT SYSDATE -- 공지 수정일
);
-- 시퀀스 생성
CREATE SEQUENCE notice_seq;


-- 샘플데이터 - 현재 날짜 2021-06-14
-- 현재 공지 - 현재 날짜가 시작일과 종료일 사이에 있는 데이터
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '자바과정 진행', '이젠컴학원 자바', '2021-04-01', '2021-10-28');

-- 지난 공지 - 종료일이 현재 날짜보다 작은 데이터
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '자바과정 시작', '이젠컴학원 자바과정', '2021-05-15', '2021-06-01');
-- 예약 공지 - 시작일이 현재 날짜보자 큰 데이터

INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '자바과정 수료', '이젠컴학원 자바', '2021-10-13', '2021-10-28');
COMMIT;

?

select * from notice;


		select rnum, no, title, content
        , to_char(startDate, 'yyyy.mm.dd') startDate
		, to_char(writeDate, 'yyyy.mm.dd') writeDate
		, to_char(endDate, 'yyyy.mm.dd') endDate
		, to_char(updateDate, 'yyyy.mm.dd') updateDate
		from(
			select rownum rnum, no, title, content, startDate, endDate, updateDate, writeDate
			from(
				select no, title, content, startDate, endDate, updateDate, writeDate
				from notice
				order by no desc
			)
		)
		where rnum between 1 and 10;
        
        select count(*)from notice;
        
         select * from notice;


