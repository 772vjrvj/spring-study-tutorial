-- �޽��� �ý���
-- 1. ��ü ����
DROP TABLE message CASCADE CONSTRAINTS;
DROP SEQUENCE message_seq;

-- 2. ��ü ���� - ���� ȸ�� ��Ű���� �����Ǿ� �־�� �Ѵ�. �����͵� �־���Ѵ�.
CREATE TABLE message(
no NUMBER PRIMARY KEY, -- �޽��� ��ȣ
content VARCHAR2(2000) NOT NULL, -- ����
-- ȸ���� ������� �޽����� �������. :  REFERENCES member(id) ON DELETE CASCADE
sender VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE , -- ������ ����� ID (FK-�����ϰ� �ִ� PK�� Ÿ�԰� ũ�⿡ �����.)
sendDate DATE DEFAULT SYSDATE, -- ���� ��¥ : ���糯¥�� �⺻
accepter VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE, -- �޴� ����� ID
acceptDate DATE DEFAULT NULL -- ���� ��¥ : ���糯¥- �⺻�� null
-- -> �޾Ҵ�:��¥�� �ִ�. ���� �ʾҴ�. ��¥�� ����.
);

CREATE SEQUENCE message_seq;