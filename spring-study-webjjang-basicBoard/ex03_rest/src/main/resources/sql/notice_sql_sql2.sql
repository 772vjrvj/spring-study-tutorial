--- 공지사항
select * from notice
order by updateDate desc;

-- 현재 공지 찾아보기
select * from notice
where sysdate >= startDate and sysdate <= endDate + 1;
-- endDate + 1 하는 것 때문에 endDate 날짜를 '9999-12-30' -> endDate + 1 -> '9999-12-31'
-- endDate를 '9999-12-31'까지 표시하고자 한다면 endDate + 1 은 사용할 수 없다.
-- trunc(날짜시간) -> 시간을 없애 주셔 날짜 00:00:00으로 만들어 준다.
select * from notice
where sysdate >= startDate and trunc(sysdate) <= endDate;

select to_char(trunc(sysdate), 'yyyy.mm.dd hh24:mi:ss') today_time from dual;
select no, to_char(trunc(endDate), 'yyyy.mm.dd hh24:mi:ss') endDate from notice;

-- 오늘까지 공지가 되는 현재 공지 등록하기
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '데이터베이구현 종료', '데이터베이스구현', '2021-01-06', '2021.01.08');
commit;