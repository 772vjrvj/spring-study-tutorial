-- ���� ���̺�
-- �г�, ��, ��ȣ, ����, ����, ��ǻ��
-- 1. ��ü ����
DROP TABLE score CASCADE CONSTRAINTS;

-- 2. ��ü ����
CREATE TABLE score(
grade number(1), -- �г�
ban number(2), -- ��
bun number(2), -- ��ȣ
kor number(3), -- ���� ����
eng number(3), -- ���� ����
com number(3) -- ��ǻ�� ����
);

-- 3. ���� ������ �Է�
insert into score
values(1,1,1, 100, 80, 85);
insert into score
values(1,2,1, 70, 90, 85);
insert into score
values(1,2,2, 90, null, 100);
insert into score
values(2,1,1, 90, 95, 85);
insert into score
values(2,1,2, null, 100, null);
insert into score
values(2,2,1, 90, 80, 100);
insert into score
values(3,1,1, 100, 80, null);
insert into score
values(3,1,2, 90, 100, 85);
insert into score
values(3,1,2, 100, 80, 85);
commit;

-- ������ �л��� ���ؼ� ������ ����ϰ� ������ �հ�� ����� ���Ͻÿ�.
select grade, ban, bun, kor, eng, com, kor + eng + com sum
from score;
-- �̶� �հ迡�� ������ ��� null�� ������ ����� null�� �ȴ�.
-- ������ null�̸� 0���� ó���ؼ� �������.
-- nvl(����, null����ü�Ǵ� ��)
select grade, ban, bun, nvl(kor,0), nvl(eng,0), nvl(com,0),
nvl(kor,0) + nvl(eng,0) + nvl(com,0) sum
from score;
?
-- ���� ���� ���� �հ�� ����� ���Ͻÿ�.(null �����ʹ� �����ϰ� ������ �ش�.)
-- sum(�÷�) �÷��� �հ�, avg(�÷�) �÷��� ���
-- ������ ǥ���ϱ� : ���� -> ���� ���� ��ȭ
-- 0: �ڸ����� ���� ������ 0�� ǥ���Ѵ�. �������� �ʴ´�.
-- 9: �ڸ����� ���� ������ �����ϰ� �ȴ�.
-- 3��° �ڸ��� ,: õ���� ,�� ǥ���Ѵ�.
select to_char(sum(kor),'9,999') kor_sum, to_char(avg(kor),'999.00') kor_avg , to_char(sum(eng),'9,999') eng_sum,
to_char(avg(eng), '999.00') eng_avg, to_char(sum(com),'9,999') com_sum, to_char(avg(com),'999.00') com_avg 
from score;

select sum(kor), to_char(avg(kor),'99.00') kor_avg , sum(eng), to_char(avg(eng), '999.00') eng_avg, sum(com),
avg(com) com_avg 
from score;

-- �г⺰ ������ �հ�� ����� ���غ���.(���)
select grade sum(kor) kor_sum
from score
group by grade
order by grade;
-- �ݺ� ������ �հ�� ����� ���غ���.(���)
select grade, ban, sum(kor) kor_sum
from score
group by grade, ban
order by grade, ban;



