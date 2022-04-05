-- �Խ����� ������ó���ϴ� ���� �ۼ�
-- 1. �Խ����� ���� �����͸� �ҷ��´�. -> ���±��� ����� ����. - select
-- 2. ������ �����Ϳ� ���� ��ȣ�� �ٿ��� �ҷ� �´�.(����Ŭ���� �ִ� �۹�ȣ ���̴� Ű���带 ���:rownum) - select
-- 3. ������ȣ�� �ٿ��� �����Ƿ� �ش��������� ���۰� �� ��ȣ�� ������ �������� �����´�. - select

-- �Խ��� ����Ʈ
select no, title, writer, writeDate, hit
from board;

-- ���� ������ �Է� - �Խ��� �۾���
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

-- ���� �����͸� ����� �ϱ� -> ������ �ִ� ������ ��ŭ �ٽ� �Է� ��Ų��.
insert into board(no, title, content, writer)
(select board_seq.nextval, title, content, writer from board);
commit;

-- 1�������� ������ ��ȣ�� ���̸� : 1~10
-- 1. ���� �����͸� �ҷ��´�.
select no, title, writer, writeDate, hit
from board;
-- 2. �ҷ��� ���� �����Ϳ� ���� ��ȣ�� ���δ�.
select ROWNUM rnum, no, title, writer, writeDate, hit
from(
    select no, title, writer, writeDate, hit
    from board
);
-- 3. 1�������� �ش�Ǵ� ������ �������� : �ٿ��� ��ȣ�� 1~10
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

