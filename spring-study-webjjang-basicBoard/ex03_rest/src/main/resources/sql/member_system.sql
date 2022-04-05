--- [[ȸ������ �ý��ۿ� �ʿ��� ��Ű��]] ---

-- 1. ��ü ���� - ȸ�����̺�, ������̺�
-- ���� ������ �����͸� ����ϰ� �ִ� ���̺��� ���� �����. : ȸ�����̺� ���� �����.
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE grade CASCADE CONSTRAINTS;


-- 2. ��ü ���� - ������̺�, ȸ�����̺�
-- ���� ������ ���������� ���� ���̺��� ���� �����. : ������̺� ���� �����.
CREATE TABLE grade(
   gradeNo NUMBER(2) CONSTRAINT grade_gradeNo_pk PRIMARY KEY,
   gradeName VARCHAR2(20)
);

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
gradeNo NUMBER(2)  DEFAULT 1 CONSTRAINT member_gradeNo_fk REFERENCES grade(gradeNo) -- ���
);

-- 3. ���� ������ �Է� - insert -> ���� ������ ���� �����͸� ���� �Է� - grade
-- <<grade ���� ������>>
INSERT INTO grade VALUES (1, '�Ϲ�ȸ��');
INSERT INTO grade VALUES (9, '������');

-- <<member ���� ������>>
-- ������ �����Է��ϱ�
INSERT INTO member(id, pw, name, gender, birth, email, gradeNo)
VALUES('admin','1111', '�̿�ȯ','����','1980-01-01','leelj1@nate.com', 9);
-- �Ϲ�ȸ�� �����Է��ϱ� - ȸ�������� �Ҷ� ��޹�ȣ�� ���������� �ʴ´�. �⺻���� 1(�Ϲ�ȸ��)�� �����ؼ� ����Ѵ�.
INSERT INTO member(id, pw, name, gender, birth, email)
VALUES('test','1111', 'ȫ�浿','����','1980-01-01','leelj1@nate.com');
COMMIT;



