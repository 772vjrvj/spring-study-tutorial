-- �������� ����Ʈ
select * from notice; 

-- ���� ��¥�� �ð� : 2021-01-06 11:51
-- ���� ������ �Է�
-- ���� ���� - ������ ���� ��¥���� �۴�. �������� ���� ��¥���� ũ��.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '�ڹ� ������ ���� ����', '�ڹٷ� �ַ���� �����ϴ� ����',
'2020-12-10', '2021-05-28');
-- ���� ���� - �������� ���� ��¥���� �۴�.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '�ڹ� ������ ���� ����', '�ڹٷ� �ַ���� �����ϴ� ����',
'2020-11-10', '2020-12-16');
-- ���� ���� - �������� ���� ��¥���� ũ��.
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '�ڹ� ������ ���� ����', '���Ḧ �����մϴ�.',
'2021-05-22', '2021-05-29');
-- ������ ���� ���� : ������ ������ �ϸ� ������ �ִ� ����� �۾� ������ �ٷ� �����Ѵ�.
--   ���� �۾��ϰ� �ִ� ����ڿ��Դ� ������ �����͸� �����ؼ� ������. �ٸ� ����ڴ� ����� �����͸�
--   ���ܽ�Ű�� �����ش�.
-- �׷��� �۾��� ������ ���� ����(commit)�� ��Ű�ų� ���(rollback)�� ���Ѿ� �Ѵ�.
commit;

-- ��ü ������ ���
select * from notice;


--[[ ������ ������ �����ִ� ���� �ۼ� - ����Ʈ : SQLȰ��]]--
-- ��ü ���� 
select no, title, startDate, endDate, updateDate
from notice
order by no desc;
-- ���� ���� - �������� ���� ��¥�� �ð����� �۴�. ������+1�� ���� ��¥�� �ð����� ũ��.
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate + 1 > sysdate
order by no desc;

-- ���� ���� - �������� ���� ��¥�� �ð����� ũ��.
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by no desc;

-- ���� ���� - ������ + 1�� ���� ��¥�� �ð����� �۴�.
select no, title, startDate, endDate, updateDate
from notice
where endDate + 1 < sysdate
order by no desc;

-- ���� �ִ� �������� �����̺�(���� ���̺�) �����
-- �����̺��� ����� ���� : ������ �����Ѵ�.

--<<���� ������ �����̺� �����>>
-- ** �ݵ�� "create view" ������ �־�߸� �Ѵ�. �����ڱ������� �����ؼ� �ϼž� �մϴ�.
-- sys �������� grant create view to java00; ����
-- resource �� �ȿ��� �����̺��� ����� ���� ����.
-- ���� ���� - �������� ���� ��¥�� �ð����� �۴�. ������+1�� ���� ��¥�� �ð����� ũ��.
-- create�� ����⸦ �ϱ� ������ ������ ������ �߻�
-- or replace �� �ִ� ��� ���� ���⸦ �����Ѵ�.
CREATE OR REPLACE VIEW notice_pre
AS
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate + 1 > sysdate
order by no desc;

-- ���� ������ �����ִ� ����
select * from notice_pre;
-- �����̺� - �������� ���̺�� �������� �ʴ´�. ����(select)�� �����ϰ� �ִٰ� ������ �����
-- ���̺� �������� �������ִ� ���� �ǹ��Ѵ�.

--<< ���� ������ �����̺� ����� - notice_old >>
CREATE OR REPLACE VIEW notice_old
AS
select no, title, startDate, endDate, updateDate
from notice
where endDate + 1 < sysdate
order by no desc;

select  no, title, startDate, endDate, updateDate
from notice_old;

--<< ���� ������ �����̺� ����� - notice_res >>
CREATE OR REPLACE VIEW notice_res
AS
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by no desc;

select no, title, startDate, endDate, updateDate
from notice_res;

