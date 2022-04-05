-- �Խ��� ��� ��Ű�� - ���̺� ������

-- ���� -> ���� -> ���õ�����

-- ���� : FK(board_rep) -> PK(board)

DROP TABLE board_rep CASCADE CONSTRAINTS;

DROP SEQUENCE board_rep_seq;

?

-- ���� : PK(board) -> FK(board_rep)

CREATE TABLE board_rep(

rno NUMBER PRIMARY KEY,

no NUMBER REFERENCES board(no),

content VARCHAR2(500) NOT NULL,

writer VARCHAR2(30) NOT NULL,

writeDate DATE DEFAULT SYSDATE

);

CREATE SEQUENCE board_rep_seq;

?

-- ���� ������

-- �Խ����� �ִ� �۹�ȣ

select * from board;

-- �Խ��ǿ� 2�� ���� �ְ� �ű⿡ ��� �ۼ�

INSERT INTO board_rep(rno, no, content, writer)

VALUES(board_rep_seq.nextval, 2, '����Ŭ ���ƿ�', 'lee');

INSERT INTO board_rep(rno, no, content, writer)

VALUES(board_rep_seq.nextval, 2, '����Ŭ�� ����.', 'lee');

COMMIT;

?

-- �Խ��� �ۺ����� �� �ϴܿ� ǥ���Ѵ�.(���� �ҷ��´�.)

select * from board

where no = 2;

select * from board_rep

where no = 2

order by rno desc;