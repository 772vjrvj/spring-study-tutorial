-- 0. 게시판 테이블 제거
DROP TABLE noseq_board CASCADE CONSTRAINTS;

-- 1. 게시판 테이블 생성
CREATE TABLE noseq_board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL,
-- SYSDATE : 오라클에서의 오늘 날짜를 의미하는 키워드
writeDate DATE DEFAULT SYSDATE, -- DEFAULT 값이 셋팅되어 있으면 NOT NULL을 사용하지 않는다.(의미없음)
hit NUMBER DEFAULT 0
);

-- [2. 테이블 운영 쿼리]
-- 제일 큰 번호 찾기
select max(no) -- 데이터가 없으면 null이 나온다.
from noseq_board;
-- 다음 글번호 = 제일 큰 번호 + 1
select max(no) + 1 -- 데이터가 없으면 null이 나온다.
from noseq_board;
select nvl(max(no),0) + 1 -- 데이터가 없으면 null이 나오는데 null면 0을 사용하게 만든다.
from noseq_board;

-- 1. 게시판 리스트
select no, title, writer, writeDate, hit
from noseq_board
order by no desc;
select rnum, no, title, writer, writeDate, hit
from(
   select rownum rnum, no, title, writer, writeDate, hit
   from(
       select no, title, writer, writeDate, hit
       from noseq_board
       order by no desc
   )
)
where rnum between 1 and 10;

-- 2. 게시판 글보기(no = 1)
select no, title, content, writer, writeDate, hit
from board
where no =1;

-- 3. 게시판 글쓰기
insert into noseq_board(no, title, content, writer)
values((select nvl(max(no), 0) + 1 from noseq_board), 'java', 'java jjang', 'lee');
insert into noseq_board(no, title, content, writer)
values((select nvl(max(no), 0) + 1 from noseq_board), 'oracle', 'oracel jjang', 'kim');
commit;

-- 4. 게시판 글수정(no = 1)
update noseq_board
set title = '자바', content = '자바짱', writer = 'lee'
where no = 1;
commit;

-- 5. 게시판 글삭제(no = 3)
--  1) 3. 글 지운다. 2) 3보다 큰 글번호를 -1 한다.
delete from noseq_board
where no = 3;
update noseq_board
set no = no - 1
where no > 3;
commit;

select * from noseq_board;

-- 1. 시퀀스인 경우 번호가 중간에 빠지게 되어서 rownum을 사용하여 데이터를 가져온다.
--   --> 시퀀스를 사용하지 않고 중간에 빠진 데이터가 없다고 하면 정렬은 시키고 제일 큰번호 부터 페이지 갯수 만큼 가져오면 된다.
select no, title, writer, writeDate, hit
from noseq_board
where no between (select max(no) from noseq_board) - 10 and (select max(no) from noseq_board)
order by no desc;

select max(no), count(no) from noseq_board;
