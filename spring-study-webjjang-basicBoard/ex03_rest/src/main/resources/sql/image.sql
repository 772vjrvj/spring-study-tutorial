-- �̹��� �Խ���
-- 1. ��ü ����
DROP TABLE image;
DROP SEQUENCE image_seq;

-- 2. ��ü ���� - member ���̺��� ���� �־�� �մϴ�.
CREATE TABLE image(
no NUMBER CONSTRAINT image_no_pk PRIMARY KEY, -- �۹�ȣ
title VARCHAR2(300) NOT NULL, -- ����
content VARCHAR2(2000) NOT NULL, -- ����
id VARCHAR2(20) NOT NULL REFERENCES member(id), -- �ۼ��� ���̵� -> �α����� ���� �Ǿ�߸� �Ѵ�.
writeDate DATE DEFAULT SYSDATE, -- �ۼ���
fileName VARCHAR2(50) NOT NULL -- ÷�ε� �̹��� ���ϸ�
);
CREATE SEQUENCE image_seq;

-- 3. ���õ�����
INSERT INTO image(no, title, content, id, fileName)
values(image_seq.nextval, '������', '�Ϳ��� ������','test','/image/dog01.jpg');
INSERT INTO image(no, title, content, id, fileName)
values(image_seq.nextval, '�����', '�߿˾߿� �����','admin','/image/cat01.jpg');

COMMIT;

------------  �̹��� �Խ��� �
select * from image;
-- �̹��� �Խ��ǿ��� ������ ������
--  : �̹��� ��ȣ(i), ����(i), ���̵�(i), �̸�(m), �̸���(m), �ۼ���(i), ���ϸ�(i)
--  inner join: �����Ϸ��� ���̺� ��� �ִ� �����͸� �����ش�.
--             �� �߿� equal ���� pk = fk
---            <--> outter join : ���ʿ� �����Ͱ� ������� �����ش�.
-- ����Ŭ�� ǥ���� : ����Ŭ ����(�⺻-inner join:equal ����)
select i.no, i.title, i.id, m.name, m.email, i.writeDate, i.fileName
from member m, image i
where m.id = i.id;

-- ANSI join - �Ȱ��� �����δ�. ��� DBMS���� ��밡��
select i.no, i.title, i.id, m.name, m.email, i.writeDate, i.fileName
from image i JOIN member m ON(i.id = m.id);

