-- 게시판 댓글 스키마 - 테이블 시퀀스

-- 제거 -> 생성 -> 샘플데이터

-- 제거 : FK(board_rep) -> PK(board)

DROP TABLE board_rep CASCADE CONSTRAINTS;

DROP SEQUENCE board_rep_seq;

?

-- 생성 : PK(board) -> FK(board_rep)

CREATE TABLE board_rep(

rno NUMBER PRIMARY KEY,

no NUMBER REFERENCES board(no),

content VARCHAR2(500) NOT NULL,

writer VARCHAR2(30) NOT NULL,

writeDate DATE DEFAULT SYSDATE

);

CREATE SEQUENCE board_rep_seq;

?

-- 샘플 데이터

-- 게시판의 있는 글번호

select * from board;

-- 게시판에 2번 글이 있고 거기에 댓글 작성

INSERT INTO board_rep(rno, no, content, writer)

VALUES(board_rep_seq.nextval, 2, '오라클 좋아요', 'lee');

INSERT INTO board_rep(rno, no, content, writer)

VALUES(board_rep_seq.nextval, 2, '오라클은 디비다.', 'lee');

COMMIT;

?

-- 게시판 글보기할 때 하단에 표시한다.(같이 불러온다.)

select * from board

where no = 2;

select * from board_rep

where no = 2

order by rno desc;