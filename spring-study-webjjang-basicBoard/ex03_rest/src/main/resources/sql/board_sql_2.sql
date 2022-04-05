-- 게시판을 이용한 SQL 활용
-- 1. 게시판 리스트 - 글번호, 제목, 작성자, 작성일, 조회수
SELECT no, title, writer, writeDate, hit
FROM board
order by no desc;

-- select 컬럼, 컬럼, ... from table, table, ...
-- select 컬럼들... from 데이터덩어리(table, select, view ...)
-- select 컬럼, sysdate, rownum, board_seq.nextval, (select count(*) from table), 값
-- from board

-- * sysdate : 오늘 날짜와 시간이 있는 숫자 정보 : long - 오라클 전용
-- * rownum : 여러개의 데이터를 불러오게 되는 경우 불러와지는 순서데로 순서번호를 붙이는 키워드
-- * squence 객체의 다음 글번호 - squence.nextval
-- * select(서브 쿼리)를 이용한 데이터 한개

-- 1-1. 페이지 처리가 된 게시판 리스트 : 1 페이지 : 1~10
---   원본데이터 가져오기 -> 번호표 나눠주기(rownum) -> 1~10 까지의 데이터 가져오기
--- 1) 원본 데이터
SELECT no, title, writer, writeDate, hit
from board
order by no desc;
--- 2) 가져온 원본 데이터에 번호표를 부여한다.
SELECT ROWNUM rnum, no, title, writer, writeDate, hit
from(
   -- 원본 데이터
   SELECT no, title, writer, writeDate, hit
   from board
   order by no desc
);
--- 3) 부여한 번호표 중 현재 페이지에 맞는 데이터 가져오기.
---     1페이지 : 1 ~ 10, 2페이지 : 11 ~ 20
SELECT  rnum, no, title, writer, writeDate, hit
from(
    -- 번호표를 부여 받는 데이터
    SELECT ROWNUM rnum, no, title, writer, writeDate, hit
    from(
       -- 원본 데이터
       SELECT no, title, writer, writeDate, hit
       from board
       order by no desc
    )
)
-- 페이지에 맞는 조건 - 1페이지
-- where rnum >= 1 and rnum <= 10;
-- 페이지에 맞는 조건 - 2페이지
-- where rnum >= 11 and rnum <= 20;
-- 페이지에 맞는 조건 - 3페이지 : 21~30 - 21부터 30 사이의 데이터(범위 데이터)
where rnum BETWEEN 21 AND 30;

--- where 조건 and 조건 -> 범위 -> where 컬럼 between a and b

--- where 조건 -> 여러개의 데이터 가져오기 : 1279, 1273, 1260 번 데이터 가져오기 - or 연산자를 이용해서 가져오기.
select * from board where no = 1279 or no = 1273 or no = 1260
order by no desc;
--- 여러개의 데이터 변경하기 : 1279, 1273, 1260 번 데이터의 작성일을 오늘 날짜(sysdate)로 변경
update board set writeDate = sysdate
where  no = 1279 or no = 1273 or no = 1260;
--- 여러개의 데이터를 or 연산을 간편하게 처리하는 in( ) 연산자
--- 날짜 데이터에 10일 지난 날짜 : + 10 --> 어제 날짜 : sysdate - 1
update board set writeDate = sysdate - 1
where  no in(1279, 1273, 1260);
select * from board where no in(1279, 1273, 1260)
order by no desc;

--- 게시판 리스트에서 여러개를 선택한 수 삭제를 한다. 1279, 1273, 1260
delete from board
where no in(1279, 1273, 1260);


select sysdate - 1 from dual;

commit;

select * from board order by no desc;

--- DTL(Data Transction Language - 트렌젝션 처리)
--- commit : 작업 데이터 완전 적용
--- rollback : 작업 데이터 취소
rollback;

-- dual : 더미 테이블 - 없는데 양식을 맞추기 위한 테이블
select sysdate from dual;
-- 날짜 형식을 내 마음대로 -> to_char() -> 문자열로 만들어 주는 함수
-- to_char(날짜객체, 패턴문자) 별칭 -> 사용하고자 할때는 별칭을 사용한다.
-- 패턴문자 : yyyy - 년도4자리, yy - 년도 2자리
--     mm - 월, dd - 일,  hh : 시간12시간제, hh24 : 시간 24시간제
--     mi - 분, ss - 초, day - 요일
-- 날짜를 문자열로 변경한게 되고 날짜 계산을 불가능해진다.
-- 만약에 날짜 계산을 해야 한다면 문자열을 날짜로 바꾸는 함수 : to_date(문자열, 패턴)
-- '2021.01.08' ==> 문자열 -> 날짜형식의 컬럼에 넣으면 알아서 변경해서 넣어 준다.
select TO_CHAR(sysdate, 'yyyy.mm.dd hh24:mi:ss day') today from dual;

select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
order by no desc;

-- '2021.01.08' ==> 문자열 -> 날짜형식의 컬럼에 넣으면 알아서 변경해서 넣어 준다.
select to_date('2021.01.08', 'yyyy.mm.dd') from dual;
select to_date('20210108', 'yyyymmdd') from dual;

-- 게시판 리스트를 표시할 때는 날짜를 표시용도로만 사용하므로 문자열로 만들어서 작업을 해도 무방하다.
-- to_char()사용, 페이지 처리
-- 1. 원본데이터 가져오기 - 날짜 -> 문자열
select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
order by no desc;
-- 2. 원본 데이터에 순서번호(rownum) 붙이기
select rownum rnum, no, title, writer, writeDate, hit
from(
    select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
    from board
    order by no desc
);
-- 3. 붙여진 순서번호 중에서 1페이지에 해당이 되는 1~10를 가져온다.
select rnum, no, title, writer, writeDate, hit
from(
    select rownum rnum, no, title, writer, writeDate, hit
    from(
        select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
        from board
        order by no desc
    )
)
-- (1-1) * 10 + 1
-- 1페이지에 해당이 되는 1~10를 가져온다.
-- where rnum between 1 and 10
-- (2 - 1) * 10 + 1
-- 2페이지에 해당이 되는 11~20를 가져온다.
-- where rnum between 11 and 20
-- (3 - 1) * 10 + 1
-- 3페이지에 해당이 되는 21~30를 가져온다.
where rnum between 21 and 30
;

--- 2. 글보기 - 1280번 글의 내용 보기 -> 있는지 여부를 확인하시고 있는 글번호만 사용한다.
---   글보기를 하면 조회수가 1 증가되어야 한다. 그래서 먼저 조회수를 1증가시켜준다. -> 데이터를 수정한다.
update board
set hit = hit + 1
where no = 1280;
commit;
select no, title, content, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
where no = 1280;

--- 3. 글쓰기 - 사용자 : 제목, 내용, 작성자, 시스템 시퀀스 글번호
--    입력을 할때 테이블(컬럼...) values(값...) : (컬럼...) 은 모든 데이터를 순서대로 입력할 때는 생략 가능하다.
insert into board
values(board_seq.nextval, '데이터입력','모든데이터 입력','이영환', sysdate, 0);
commit;
insert into board(no, title, content, writer)
values(board_seq.nextval, '간략한','잘들어감', '홍길동');

select * from board order by no desc;

---  4. 글수정 -
update board
set title = '간략한 데이터', content = '잘들어감', writer = '홍길순'
where no = 1282;
commit;

--- 5. 글삭제
--    글번호가 1280번 한개만 지운다.
delete from board
where no = 1282;
--    게시판 글 전체 지우기
delete from board
where 1=1;
--   where true (X) -> where 1=1 : 항상 true  : and 연산으로 형식을 맞출 때
--   where false (X) -> where 1= 0 : 항상 false가 된다. : or 연산으로 형식을 맞출 때

-- where이 붙는 경우 : select, update, delete

rollback;

-- *** 페이지 처리를 위해 전체 페이지 계산이 되어야 한다.
-- 1페이지에 표시할 데이터 수 : 10
-- 전체 페이지수 --> 전체 데이터의 갯수
select * from board
order by no desc;
-- count(컬럼) - 컬럼 중에서 null이 아닌 데이터의 갯수
-- 컬럼 - pk, *
select count(no) cnt from board;
select * from board;
-- lee가 작성한 글의 갯수
select count(no) cnt 
from board
where writer = 'lee';
-- 게시판의 게시글을 작성자별 작성한 글의 갯수
select writer, count(*) cnt
from board
GROUP BY writer
order by cnt desc;







