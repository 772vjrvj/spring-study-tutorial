-- ȸ����� ���̺�
-- 1 : �Ϲ�ȸ��, 9 : ������
-- 0. ������̺� ����
DROP TABLE grade CASCADE CONSTRAINTS;

-- 1. ������̺� �����
CREATE TABLE grade(
   gradeNo NUMBER(2) CONSTRAINT grade_gradeNo_pk PRIMARY KEY,
   gradeName VARCHAR2(20)
);

-- ���õ����� �ֱ�
INSERT INTO grade VALUES (1, '�Ϲ�ȸ��');
INSERT INTO grade VALUES (9, '������');
COMMIT;

