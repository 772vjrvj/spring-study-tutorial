-- 공지사항 운영 쿼리
select * from notice;
-- 1. 공지사항 리스트
--   1) 현재 공지 보기
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate >= trunc(sysdate)
order by startDate desc;

--   2) 지난 공지 보기
select no, title, startDate, endDate, updateDate
from notice
where endDate < trunc(sysdate)
order by startDate desc;

--   3) 예약 공지 보기
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by startDate desc;

--   4) 전체 공지 보기
select no, title, startDate, endDate, updateDate
from notice
order by startDate desc;
--- 가. 원본 데이터를 가져와서 나. 순서번호를 붙인다.
select rownum rnum, no, title, startDate, endDate, updateDate
from(
    select no, title, startDate, endDate, updateDate
    from notice
    order by startDate desc
);
--- 다. 나에서 가져온 데이터에서 페이지에 맞는 데이터 가져오기.
select rnum, no, title, startDate, endDate, updateDate
from(
    select rownum rnum, no, title, startDate, endDate, updateDate
    from(
        select no, title, startDate, endDate, updateDate
        from notice
        order by startDate desc
    )
)
where rnum BETWEEN 1 and 10
;

--- **. 페이지 처리가 된 검색.
select rnum, no, title, startDate, endDate, updateDate
from(
    select rownum rnum, no, title, startDate, endDate, updateDate
    from(
        select no, title, startDate, endDate, updateDate
        from notice
        -- 게시판 검색 : or 연산 : 1=0(false) 맨앞에 붙이면 다음 부터는 or 다음에 조건
        -- 쇼핑몰 검색 : and 연산 : 1=1(true) 맨앞에 붙이면 다음 부터는 and 다음에 조건
        where (1=0
            -- title like '%모집%'
            -- content like '%구정%'
            or title like '%구정%'
            or content like '%구정%')
        order by startDate desc
    )
)
where rnum BETWEEN 1 and 10
;


-- 많은 데이터 만들기
insert into notice(no, title, content, startDate, endDate)
(select notice_seq.nextval, title, content, startDate, endDate from notice);
commit;

-- 2. 공지사항 보기(no = 2)
select no, title, content, startDate, endDate, updateDate
from notice
where no = 2;

-- 3. 공지사항 쓰기-제목,내용,시작일,종료일
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '구정 휴일 공지','2월11일~14일 수업이 없습니다.', sysdate, '2021-02-14');
commit;

-- 4. 공지사항 수정(no = 2)
update notice
set title = '자바 개발자 과정 모집' , content = '자바로 솔루션을 개발하는 과정', 
   startDate = sysdate, endDate=sysdate + 30
where no = 2;
commit;

-- 5. 공지사항 삭제(no = 70)
delete from notice
where no = 70;
commit;

