-- �Խ����� �̿��� SQL Ȱ��
-- 1. �Խ��� ����Ʈ - �۹�ȣ, ����, �ۼ���, �ۼ���, ��ȸ��
SELECT no, title, writer, writeDate, hit
FROM board
order by no desc;

-- select �÷�, �÷�, ... from table, table, ...
-- select �÷���... from �����͵��(table, select, view ...)
-- select �÷�, sysdate, rownum, board_seq.nextval, (select count(*) from table), ��
-- from board

-- * sysdate : ���� ��¥�� �ð��� �ִ� ���� ���� : long - ����Ŭ ����
-- * rownum : �������� �����͸� �ҷ����� �Ǵ� ��� �ҷ������� �������� ������ȣ�� ���̴� Ű����
-- * squence ��ü�� ���� �۹�ȣ - squence.nextval
-- * select(���� ����)�� �̿��� ������ �Ѱ�

-- 1-1. ������ ó���� �� �Խ��� ����Ʈ : 1 ������ : 1~10
---   ���������� �������� -> ��ȣǥ �����ֱ�(rownum) -> 1~10 ������ ������ ��������
--- 1) ���� ������
SELECT no, title, writer, writeDate, hit
from board
order by no desc;
--- 2) ������ ���� �����Ϳ� ��ȣǥ�� �ο��Ѵ�.
SELECT ROWNUM rnum, no, title, writer, writeDate, hit
from(
   -- ���� ������
   SELECT no, title, writer, writeDate, hit
   from board
   order by no desc
);
--- 3) �ο��� ��ȣǥ �� ���� �������� �´� ������ ��������.
---     1������ : 1 ~ 10, 2������ : 11 ~ 20
SELECT  rnum, no, title, writer, writeDate, hit
from(
    -- ��ȣǥ�� �ο� �޴� ������
    SELECT ROWNUM rnum, no, title, writer, writeDate, hit
    from(
       -- ���� ������
       SELECT no, title, writer, writeDate, hit
       from board
       order by no desc
    )
)
-- �������� �´� ���� - 1������
-- where rnum >= 1 and rnum <= 10;
-- �������� �´� ���� - 2������
-- where rnum >= 11 and rnum <= 20;
-- �������� �´� ���� - 3������ : 21~30 - 21���� 30 ������ ������(���� ������)
where rnum BETWEEN 21 AND 30;

--- where ���� and ���� -> ���� -> where �÷� between a and b

--- where ���� -> �������� ������ �������� : 1279, 1273, 1260 �� ������ �������� - or �����ڸ� �̿��ؼ� ��������.
select * from board where no = 1279 or no = 1273 or no = 1260
order by no desc;
--- �������� ������ �����ϱ� : 1279, 1273, 1260 �� �������� �ۼ����� ���� ��¥(sysdate)�� ����
update board set writeDate = sysdate
where  no = 1279 or no = 1273 or no = 1260;
--- �������� �����͸� or ������ �����ϰ� ó���ϴ� in( ) ������
--- ��¥ �����Ϳ� 10�� ���� ��¥ : + 10 --> ���� ��¥ : sysdate - 1
update board set writeDate = sysdate - 1
where  no in(1279, 1273, 1260);
select * from board where no in(1279, 1273, 1260)
order by no desc;

--- �Խ��� ����Ʈ���� �������� ������ �� ������ �Ѵ�. 1279, 1273, 1260
delete from board
where no in(1279, 1273, 1260);


select sysdate - 1 from dual;

commit;

select * from board order by no desc;

--- DTL(Data Transction Language - Ʈ������ ó��)
--- commit : �۾� ������ ���� ����
--- rollback : �۾� ������ ���
rollback;

-- dual : ���� ���̺� - ���µ� ����� ���߱� ���� ���̺�
select sysdate from dual;
-- ��¥ ������ �� ������� -> to_char() -> ���ڿ��� ����� �ִ� �Լ�
-- to_char(��¥��ü, ���Ϲ���) ��Ī -> ����ϰ��� �Ҷ��� ��Ī�� ����Ѵ�.
-- ���Ϲ��� : yyyy - �⵵4�ڸ�, yy - �⵵ 2�ڸ�
--     mm - ��, dd - ��,  hh : �ð�12�ð���, hh24 : �ð� 24�ð���
--     mi - ��, ss - ��, day - ����
-- ��¥�� ���ڿ��� �����Ѱ� �ǰ� ��¥ ����� �Ұ���������.
-- ���࿡ ��¥ ����� �ؾ� �Ѵٸ� ���ڿ��� ��¥�� �ٲٴ� �Լ� : to_date(���ڿ�, ����)
-- '2021.01.08' ==> ���ڿ� -> ��¥������ �÷��� ������ �˾Ƽ� �����ؼ� �־� �ش�.
select TO_CHAR(sysdate, 'yyyy.mm.dd hh24:mi:ss day') today from dual;

select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
order by no desc;

-- '2021.01.08' ==> ���ڿ� -> ��¥������ �÷��� ������ �˾Ƽ� �����ؼ� �־� �ش�.
select to_date('2021.01.08', 'yyyy.mm.dd') from dual;
select to_date('20210108', 'yyyymmdd') from dual;

-- �Խ��� ����Ʈ�� ǥ���� ���� ��¥�� ǥ�ÿ뵵�θ� ����ϹǷ� ���ڿ��� ���� �۾��� �ص� �����ϴ�.
-- to_char()���, ������ ó��
-- 1. ���������� �������� - ��¥ -> ���ڿ�
select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
order by no desc;
-- 2. ���� �����Ϳ� ������ȣ(rownum) ���̱�
select rownum rnum, no, title, writer, writeDate, hit
from(
    select no, title, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
    from board
    order by no desc
);
-- 3. �ٿ��� ������ȣ �߿��� 1�������� �ش��� �Ǵ� 1~10�� �����´�.
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
-- 1�������� �ش��� �Ǵ� 1~10�� �����´�.
-- where rnum between 1 and 10
-- (2 - 1) * 10 + 1
-- 2�������� �ش��� �Ǵ� 11~20�� �����´�.
-- where rnum between 11 and 20
-- (3 - 1) * 10 + 1
-- 3�������� �ش��� �Ǵ� 21~30�� �����´�.
where rnum between 21 and 30
;

--- 2. �ۺ��� - 1280�� ���� ���� ���� -> �ִ��� ���θ� Ȯ���Ͻð� �ִ� �۹�ȣ�� ����Ѵ�.
---   �ۺ��⸦ �ϸ� ��ȸ���� 1 �����Ǿ�� �Ѵ�. �׷��� ���� ��ȸ���� 1���������ش�. -> �����͸� �����Ѵ�.
update board
set hit = hit + 1
where no = 1280;
commit;
select no, title, content, writer, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit
from board
where no = 1280;

--- 3. �۾��� - ����� : ����, ����, �ۼ���, �ý��� ������ �۹�ȣ
--    �Է��� �Ҷ� ���̺�(�÷�...) values(��...) : (�÷�...) �� ��� �����͸� ������� �Է��� ���� ���� �����ϴ�.
insert into board
values(board_seq.nextval, '�������Է�','��絥���� �Է�','�̿�ȯ', sysdate, 0);
commit;
insert into board(no, title, content, writer)
values(board_seq.nextval, '������','�ߵ�', 'ȫ�浿');

select * from board order by no desc;

---  4. �ۼ��� -
update board
set title = '������ ������', content = '�ߵ�', writer = 'ȫ���'
where no = 1282;
commit;

--- 5. �ۻ���
--    �۹�ȣ�� 1280�� �Ѱ��� �����.
delete from board
where no = 1282;
--    �Խ��� �� ��ü �����
delete from board
where 1=1;
--   where true (X) -> where 1=1 : �׻� true  : and �������� ������ ���� ��
--   where false (X) -> where 1= 0 : �׻� false�� �ȴ�. : or �������� ������ ���� ��

-- where�� �ٴ� ��� : select, update, delete

rollback;

-- *** ������ ó���� ���� ��ü ������ ����� �Ǿ�� �Ѵ�.
-- 1�������� ǥ���� ������ �� : 10
-- ��ü �������� --> ��ü �������� ����
select * from board
order by no desc;
-- count(�÷�) - �÷� �߿��� null�� �ƴ� �������� ����
-- �÷� - pk, *
select count(no) cnt from board;
select * from board;
-- lee�� �ۼ��� ���� ����
select count(no) cnt 
from board
where writer = 'lee';
-- �Խ����� �Խñ��� �ۼ��ں� �ۼ��� ���� ����
select writer, count(*) cnt
from board
GROUP BY writer
order by cnt desc;







