-- 0. �Խ��� ���̺� ����
DROP TABLE noseq_board CASCADE CONSTRAINTS;

-- 1. �Խ��� ���̺� ����
CREATE TABLE noseq_board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL,
-- SYSDATE : ����Ŭ������ ���� ��¥�� �ǹ��ϴ� Ű����
writeDate DATE DEFAULT SYSDATE, -- DEFAULT ���� ���õǾ� ������ NOT NULL�� ������� �ʴ´�.(�ǹ̾���)
hit NUMBER DEFAULT 0
);

-- [2. ���̺� � ����]
-- ���� ū ��ȣ ã��
select max(no) -- �����Ͱ� ������ null�� ���´�.
from noseq_board;
-- ���� �۹�ȣ = ���� ū ��ȣ + 1
select max(no) + 1 -- �����Ͱ� ������ null�� ���´�.
from noseq_board;
select nvl(max(no),0) + 1 -- �����Ͱ� ������ null�� �����µ� null�� 0�� ����ϰ� �����.
from noseq_board;

-- 1. �Խ��� ����Ʈ
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

-- 2. �Խ��� �ۺ���(no = 1)
select no, title, content, writer, writeDate, hit
from board
where no =1;

-- 3. �Խ��� �۾���
insert into noseq_board(no, title, content, writer)
values((select nvl(max(no), 0) + 1 from noseq_board), 'java', 'java jjang', 'lee');
insert into noseq_board(no, title, content, writer)
values((select nvl(max(no), 0) + 1 from noseq_board), 'oracle', 'oracel jjang', 'kim');
commit;

-- 4. �Խ��� �ۼ���(no = 1)
update noseq_board
set title = '�ڹ�', content = '�ڹ�¯', writer = 'lee'
where no = 1;
commit;

-- 5. �Խ��� �ۻ���(no = 3)
--  1) 3. �� �����. 2) 3���� ū �۹�ȣ�� -1 �Ѵ�.
delete from noseq_board
where no = 3;
update noseq_board
set no = no - 1
where no > 3;
commit;

select * from noseq_board;

-- 1. �������� ��� ��ȣ�� �߰��� ������ �Ǿ rownum�� ����Ͽ� �����͸� �����´�.
--   --> �������� ������� �ʰ� �߰��� ���� �����Ͱ� ���ٰ� �ϸ� ������ ��Ű�� ���� ū��ȣ ���� ������ ���� ��ŭ �������� �ȴ�.
select no, title, writer, writeDate, hit
from noseq_board
where no between (select max(no) from noseq_board) - 10 and (select max(no) from noseq_board)
order by no desc;

select max(no), count(no) from noseq_board;
