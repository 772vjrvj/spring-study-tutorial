-- ��������
-- 0. �������� ���̺� ����
DROP TABLE notice CASCADE CONSTRAINTS;

-- ������ ����
DROP SEQUENCE notice_seq;

-- 1. �������� ���̺� ����
CREATE TABLE notice(
no NUMBER PRIMARY KEY, -- ������ȣ
title VARCHAR2(300) NOT NULL, -- ��������
content VARCHAR2(2000) NOT NULL, -- ���� ����
startDate date DEFAULT SYSDATE, -- ���� ������
endDate date DEFAULT '9999-12-30', -- ���� ������
writeDate date DEFAULT SYSDATE, --���� �ۼ���
updateDate date DEFAULT SYSDATE -- ���� ������
);
-- ������ ����
CREATE SEQUENCE notice_seq;


-- ���õ����� - ���� ��¥ 2021-06-14
-- ���� ���� - ���� ��¥�� �����ϰ� ������ ���̿� �ִ� ������
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '�ڹٰ��� ����', '�������п� �ڹ�', '2021-04-01', '2021-10-28');

-- ���� ���� - �������� ���� ��¥���� ���� ������
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '�ڹٰ��� ����', '�������п� �ڹٰ���', '2021-05-15', '2021-06-01');
-- ���� ���� - �������� ���� ��¥���� ū ������

INSERT INTO notice(no, title, content, startDate, endDate)
VALUES(notice_seq.nextval, '�ڹٰ��� ����', '�������п� �ڹ�', '2021-10-13', '2021-10-28');
COMMIT;

?

select * from notice;


		select rnum, no, title, content
        , to_char(startDate, 'yyyy.mm.dd') startDate
		, to_char(writeDate, 'yyyy.mm.dd') writeDate
		, to_char(endDate, 'yyyy.mm.dd') endDate
		, to_char(updateDate, 'yyyy.mm.dd') updateDate
		from(
			select rownum rnum, no, title, content, startDate, endDate, updateDate, writeDate
			from(
				select no, title, content, startDate, endDate, updateDate, writeDate
				from notice
				order by no desc
			)
		)
		where rnum between 1 and 10;
        
        select count(*)from notice;
        
         select * from notice;


