--- ��������
select * from notice
order by updateDate desc;

-- ���� ���� ã�ƺ���
select * from notice
where sysdate >= startDate and sysdate <= endDate + 1;
-- endDate + 1 �ϴ� �� ������ endDate ��¥�� '9999-12-30' -> endDate + 1 -> '9999-12-31'
-- endDate�� '9999-12-31'���� ǥ���ϰ��� �Ѵٸ� endDate + 1 �� ����� �� ����.
-- trunc(��¥�ð�) -> �ð��� ���� �ּ� ��¥ 00:00:00���� ����� �ش�.
select * from notice
where sysdate >= startDate and trunc(sysdate) <= endDate;

select to_char(trunc(sysdate), 'yyyy.mm.dd hh24:mi:ss') today_time from dual;
select no, to_char(trunc(endDate), 'yyyy.mm.dd hh24:mi:ss') endDate from notice;

-- ���ñ��� ������ �Ǵ� ���� ���� ����ϱ�
insert into notice(no, title, content, startDate, endDate)
values(notice_seq.nextval, '�����ͺ��̱��� ����', '�����ͺ��̽�����', '2021-01-06', '2021.01.08');
commit;