---[ ���������� ����� ���� ����� ]---
-- 1) primary key - create table �Ҷ� ����
-- 2) CONSTRAINT ���̺��_�÷���_pk PRIMARY KEY - create table �Ҷ� ����
-- 3) alter table member add constraint ���̺��_�÷���_pk PRIMARY KEY (id)

-- 0. ȸ�� ���̺� ����
DROP TABLE member CASCADE CONSTRAINTS;

-- 1. ȸ�� ���̺� �����
CREATE TABLE member(
id VARCHAR2(20) CONSTRAINT member_id_pk PRIMARY KEY, -- ���̵�
pw VARCHAR2(20) CONSTRAINT member_pw_nn NOT NULL, -- ��й�ȣ
name VARCHAR2(30) CONSTRAINT member_name_nn NOT NULL, -- �̸�
gender VARCHAR2(6) CONSTRAINT member_gender_nn NOT NULL
       CONSTRAINT member_gender_ck CHECK(gender in('����','����')), -- ����
birth date CONSTRAINT member_birth_nn NOT NULL, -- �������
tel VARCHAR2(13), -- ����ó
email VARCHAR2(50) CONSTRAINT member_email_nn NOT NULL, -- �̸���
regDate date DEFAULT sysdate, -- ������
conDate date DEFAULT sysdate, -- �ֱ� ������
status VARCHAR2(6) DEFAULT '����' 
       CONSTRAINT member_status_ck CHECK(status in ('����','����','Ż��','�޸�')), -- ����
gradeNo NUMBER(2)  DEFAULT 1 CONSTRAINT member_gradeNo_fk REFERENCES grade(gradeNo), -- ���
photo varchar2(100) DEFAULT '/upload/member/noImage.jpg' 
);

-- ������ �����͸� �Է� �����ϰ� �ϴ� ���
-- 1) check 2) �ܷ�Ű

-- ���õ����� �Է�
-- insert into board(no, title, writer, writeDate) valuse(board_seq.nextval, 'java','javajjang','lee')
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', '�̿�ȯ','����','1980-01-01','leelj1@nate.com');
commit;

-- ������ Ȯ��
select * from member;

--<< ���� ���� Ȯ�� >>--
-- pk:id - ���� insert ó������ �ѹ� �� �����Ѵ�. -> id�� �ߺ��� �ǹǷ� ������ �߻��ȴ�.
-- nn:name - name �÷��� ���� ��Ű�ų� null�̸� �ȵȴ�.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', null,'����','1980-01-01','leelj1@nate.com');
-- check:gender - CHECK(gender in('����','����')) - �����̶�� ������ �Է� �Ұ�.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('admin','1111', '�̿�ȯ','����','1980-01-01','leelj1@nate.com');
-- fk : gradeNo - grade(gradeNo) : grade���̺� �����Ͱ� �Է��ϰ��� �ϴ� gradeNo�� ������ �����Ͱ� �־��
--                     ������ �Է��� ���ش�. �ƴϸ� ���� : ����� 1,9 �� �����Ѵ�.
-- ���� ��� ������ �����ϱ�
-- ������ ����. �ڽĵ����� ������ 
-- -> foriegn key(�ܷ�Ű, ����Ű)�� ������ �Ǿ� �ִµ� �ڽ��ʿ��� �����Ͱ� �Է��� �Ǿ� ������
--   1. �⺻������ �θ�Ű�� �������� ���ϵ��� ���´�. --> �ڽ� �����͸� ����� ���� �����͸� �����.
--   2. �ڽ� ���̺��� ������ �� references member(id) on delete cascade ����
--       -> �θ� �����͸� ����� �ڵ����� �ڽ� ���ڵ� �����͵� ��������.
--   2-1. �ڽ� ���̺��� ������ �� references member(id) on delete set null ����
--       -> �θ� �����͸� ����� �ڵ����� �ڽ� �����ʹ� null�� �ٲپ� �����Ѵ�.
--   3. �����͸� ���� �Է�(������ ���ؼ�) -> ������ �ȵǸ� delete��� update ����ؼ� �����͸� �����Ѵ�.
DELETE FROM member;
COMMIT;
select * from member;
-- ������ �����Է��ϱ�
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('admin','1111', '�̿�ȯ','����','1967-01-01','010-6324-5872','leelj1@nate.com', 9);
commit;
-- �Ϲ�ȸ�� �����Է��ϱ�
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('test','1111', 'ȫ�浿','����','1980-03-01', '010-1111-8888', 'honggd@naver.com', 1);
commit;
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('angel','1111', '������','����','1970-08-23','010-2222-1004' ,'angel@gmail.com', 1);
commit;

-- ��ȭ��ȣ�� �������, �̸��� ���� - �����͸� ã�� ���� pk(id)
UPDATE member
set tel = '010-6324-5873', birth = '1967-01-01'
where id ='admin';
UPDATE member
set tel = '010-1111-8888', birth = '1980-01-01', email = 'honggd@naver.com'
where id ='test';
UPDATE member
set tel = '010-2222-1004', birth = '1970-09-05'
where id ='angel';
commit;


-- ��� ���� �����Է��ϱ� - ��޹�ȣ�� 1, 9 �� �ƴϸ� ����
INSERT INTO member(id, pw, name, gender, birth, email, gradeNo)
VALUES('angel','1111', '��õ��','����','1980-01-01','leelj1@nate.com', 4);
commit;

-- ��ȭ��ȣ ���ڸ��� �˻�(1004) : �̸�, �������, ��ȭ��ȣ
select name, birth, tel
from member
where tel like '%1004';
-- �̸����� �˻�(��) : �̸�, �������, ��ȭ��ȣ
select name, birth, tel
from member
where name like '%��%';
-- �̸��Ͼ��̵�� �˻�(honggd) : �̸�, �������, ��ȭ��ȣ, �̸���
select name, birth, tel, email
from member
where email like 'hong%';

-- ��ȭ��ȣ ���ڸ��� �˻�(1004) : �̸�, �������, ��ȭ��ȣ(xxx-****-xxxx)
-- substr(���ڿ�������, �߶󳻴� ���� ��ġ, �������� ���ڿ� ����) : �κ� ������ ��������
-- substr(���ڿ�������, �߶󳻴� ���� ��ġ) : ���� ��ġ���� ������ ��ġ���� ��������
-- concat(���ڿ�, ���ڿ�) : ���ڿ� �̾� ���̱� - 2���� �̾� ���� �� �ִ�.
--   concat(���ڿ�, concat(���ڿ�, ���ڿ�)) - 3�� �̾� ���̱� ����
-- �����ϰ� ���ڿ� �̾� ���̱� : ���ڿ� || ���ڿ�
select name, birth, substr(tel, 1, 4) || '****' || substr(tel, 9) tel
from member
where tel like '%1004';



