-- �������� � ����
select * from notice;
-- 1. �������� ����Ʈ
--   1) ���� ���� ����
select no, title, startDate, endDate, updateDate
from notice
where startDate < sysdate and endDate >= trunc(sysdate)
order by startDate desc;

--   2) ���� ���� ����
select no, title, startDate, endDate, updateDate
from notice
where endDate < trunc(sysdate)
order by startDate desc;

--   3) ���� ���� ����
select no, title, startDate, endDate, updateDate
from notice
where startDate > sysdate
order by startDate desc;

--   4) ��ü ���� ����
select no, title, startDate, endDate, updateDate
from notice
order by startDate desc;
--- ��. ���� �����͸� �����ͼ� ��. ������ȣ�� ���δ�.
select rownum rnum, no, title, startDate, endDate, updateDate
from(
    select no, title, startDate, endDate, updateDate
    from notice
    order by startDate desc
);
--- ��. ������ ������ �����Ϳ��� �������� �´� ������ ��������.
select rnum, no, title, startDate, endDate, updateDate
from(
    select rownum rnum, no, title, startDate, endDate, updateDate
    from(
        select no, title, startDate, endDate, updateDate
        from notice
        order by startDate desc
    )
)
where rnum BETWEEN 1 and 10
;

--- **. ������ ó���� �� �˻�.
select rnum, no, title, startDate, endDate, updateDate
from(
    select rownum rnum, no, title, startDate, endDate, updateDate
    from(
        select no, title, startDate, endDate, updateDate
        from notice
        -- �Խ��� �˻� : or ���� : 1=0(false) �Ǿտ� ���̸� ���� ���ʹ� or ������ ����
        -- ���θ� �˻� : and ���� : 1=1(true) �Ǿտ� ���̸� ���� ���ʹ� and ������ ����
        where (1=0
            -- title like '%����%'
            -- content like '%����%'
            or title like '%����%'
            or content like '%����%')
        order by startDate desc
    )
)
where rnum BETWEEN 1 and 10
;


-- ���� ������ �����
insert into notice(no, title, content, startDate, endDate)
(select notice_seq.nextval, title, content, startDate, endDate from notice);
commit;

-- 2. �������� ����(no = 2)
select no, title, content, startDate, endDate, updateDate
from notice
where no = 2;

-- 3. �������� ����-����,����,������,������
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '���� ���� ����','2��11��~14�� ������ �����ϴ�.', sysdate, '2021-02-14');
commit;

-- 4. �������� ����(no = 2)
update notice
set title = '�ڹ� ������ ���� ����' , content = '�ڹٷ� �ַ���� �����ϴ� ����', 
   startDate = sysdate, endDate=sysdate + 30
where no = 2;
commit;

-- 5. �������� ����(no = 70)
delete from notice
where no = 70;
commit;

