-- 게시판의 페이지처리하는 쿼리 작성
-- 1. 게시판의 원본 데이터를 불러온다. -> 여태까지 배웠던 내용. - select
-- 2. 가져온 데이터에 순서 번호를 붙여서 불러 온다.(오라클에만 있는 글번호 붙이는 키워드를 사용:rownum) - select
-- 3. 순서번호가 붙여져 있으므로 해당페이지의 시작과 끝 번호를 가지고 조건으로 가져온다. - select

-- 게시판 리스트
select no, title, writer, writeDate, hit
from board;

-- 샘플 데이터 입력 - 게시판 글쓰기
insert into board(no, title, content, writer)
values(board_seq.nextval, 'java', 'java jjang', 'lee');
insert into board(no, title, content, writer)
values(board_seq.nextval, 'oracle', 'oracle jjang', 'kim');
insert into board(no, title, content, writer)
values(board_seq.nextval, 'web', 'web jjang', 'hong');
insert into board(no, title, content, writer)
values(board_seq.nextval, 'jsp', 'jsp jjang', 'kang');
insert into board(no, title, content, writer)
values(board_seq.nextval, 'spring', 'spring jjang', 'song');
commit;

-- 많은 데이터를 생기게 하기 -> 가지고 있는 데이터 만큼 다시 입력 시킨다.
insert into board(no, title, content, writer)
(select board_seq.nextval, title, content, writer from board);
commit;

-- 1페이지의 데이터 번호를 붙이면 : 1~10
-- 1. 원본 데이터를 불러온다.
select no, title, writer, writeDate, hit
from board;
-- 2. 불러온 원본 데이터에 순서 번호를 붙인다.
select ROWNUM rnum, no, title, writer, writeDate, hit
from(
    select no, title, writer, writeDate, hit
    from board
);
-- 3. 1페이지에 해당되는 데이터 가져오기 : 붙여진 번호가 1~10
select no, title, writer, writeDate, hit
from(
    select ROWNUM rnum, no, title, writer, writeDate, hit
    from(
        select no, title, writer, writeDate, hit
        from board
        order by no desc
    )
)
where rnum >= 1 and rnum <= 10;

