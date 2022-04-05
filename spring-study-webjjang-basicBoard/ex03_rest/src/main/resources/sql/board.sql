-- 0. �Խ��� ���̺� ����
DROP TABLE board CASCADE CONSTRAINTS;

-- 1. �Խ��� ���̺� ����
CREATE TABLE board(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
writer VARCHAR2(30) NOT NULL,
-- SYSDATE : ����Ŭ������ ���� ��¥�� �ǹ��ϴ� Ű����
writeDate DATE DEFAULT SYSDATE, -- DEFAULT ���� ���õǾ� ������ NOT NULL�� ������� �ʴ´�.(�ǹ̾���)
hit NUMBER DEFAULT 0
);

-- �Խ��� ������ : ����Ŭ���� �ִ� ��ü
-- �Խ������̺�(board)���� ���� ���� - ���� �̸��� �Խ��ǿ��� ����Ѵٰ� ǥ���ϴ� �� ���̴�.
-- ���� : �ߺ��� ���� �ʴ� ���ڸ� ����ϰ� ���� �� ����. ������ȣ : .nextval -> .nextval�� ����ϸ�
--        ����۹�ȣ�� ����Ű�� Ű���带 ��밡�� : currentval
-- 0. �Խ����� ���� ������ ����
DROP SEQUENCE board_seq;

-- 1. �Խ����� ���� ������ ����
CREATE SEQUENCE board_seq;

-- [2. ���õ����� �ֱ�]
