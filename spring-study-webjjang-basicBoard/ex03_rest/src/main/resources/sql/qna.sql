-- ���� �亯 �ý���
-- 1. ��ü ����
drop table qna CASCADE CONSTRAINTS;
DROP SEQUENCE qna_seq;

-- 2. ��ü ���� -> member�� �ݵ�� ���� �־ �Ѵ�.
CREATE TABLE qna(
no number PRIMARY KEY, -- �۹�ȣ
title VARCHAR2(300) NOT NULL, -- ����
content VARCHAR2(2000) NOT NULL, -- ����
id VARCHAR2(20) NOT NULL 
    REFERENCES member(id), -- �ۼ��� ���̵�(�α��� �������� �ڵ����� ������)
writeDate date DEFAULT SYSDATE, -- �ۼ���
hit NUMBER DEFAULT 0, -- ��ȸ��
refNo NUMBER REFERENCES qna(no), -- ���ñ�
ordNo NUMBER, -- ������ȣ
levNo NUMBER, -- �鿩����
-- REFERENCES qna(no)�� ����Ű�� ����� �θ� �����Ͱ� �����Ǹ� ������ ��� ó���� ���ΰ� ���� �� �ִ�.
-- ON DELETE CASCADE : ���۵� �Բ� �����.
-- ON DELETE SET NULL : ������ ������ ���� ����Ű�� �Ǿ� �ִ� �÷��� null�� ������ �ּ���.
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- �θ��(���� �ִ� ��)
);

CREATE SEQUENCE qna_seq;

-- 3. ���õ�����
-- 1) �����ϱ� - 2�� �̻�
--   - ���ñ۹�ȣ�� �ڽ� �۹�ȣ�� ����. --> �����̴�.
--   - ������ 1���̴�.
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '�ڹٶ�?','�ڹٶ� �����ϱ��?', 'test',
       qna_seq.nextval, 1, 0, qna_seq.nextval);
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '����Ŭ�̶�?','����Ŭ�̶� �����ϱ��?', 'test',
       qna_seq.nextval, 1, 0, qna_seq.nextval);
       
-- 2) �亯�ϱ� - �Ѱ��� ������ 2���̻��� �亯
-- '�ڹٶ�?'�� ���� �亯 : �۹�ȣ 1, refNo : 1, ordNo : 1, levNo:0
-- ���� �޸� �亯�� ���� �� �ִ�. ���� �޸� �亯�� ������ȣ(�Է��Ϸ��� ���� ��ȣ���� ���ų� ū)�� ��ü + 1 ����� �Ѵ�.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 1 and ordNo >= 2;

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]�ڹٶ�?','��ü������ ���α׷��� ���', 'admin',
       1, 2, 1, 1); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]�ڹٶ�?','ȣȯ���� ����.', 'admin',
       1, 2, 1, 1); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no

-- '����Ŭ�̶�?' �亯 : �۹�ȣ 2, refNo : 2, ordNo : 1, levNo:0
-- ���� �޸� �亯�� ���� �� �ִ�. ���� �޸� �亯�� ������ȣ(�Է��Ϸ��� ���� ��ȣ���� ���ų� ū)�� ��ü + 1 ����� �Ѵ�.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 2 and ordNo >= 2;

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]����Ŭ�̶�?','DBMS �Դϴ�.', 'admin',
       2, 2, 1, 2); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯]����Ŭ�̶�?','����Ŭ�翡�� ����.', 'admin',
       2, 2, 1, 2); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no


-- 3) �亯>�亯�ϱ�
-- '[�亯]�ڹٶ�?' - 4 : �۹�ȣ 4, refNo : 1, ordNo : 2, levNo:1
-- ���� �޸� �亯�� ���� �� �ִ�. ���� �޸� �亯�� ������ȣ(�Է��Ϸ��� ���� ��ȣ���� ���ų� ū)�� ��ü + 1 ����� �Ѵ�.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 1 and ordNo >= 3; -- �����Ͱ� ������ ���� ��ȣ�� ���ų� ū ������ȣ�� 1����.

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯][�亯]�ڹٶ�?','��Ȱ�뼺�� ������ ���ϴ�.', 'admin',
       1, 3, 2, 4); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[�亯][�亯]�ڹٶ�?','�ߺ��� �Ͱ� ������ ���� ������..', 'admin',
       1, 3, 2, 4); -- refNo:�θ��� refNo�� �״�� �ִ´�. ordNo = ordNo + 1. levNo = levNo + 1. �θ���� no

COMMIT;




-- 4. ����Ʈ �Ѹ���
select levNo, no, title, id, writeDate, hit, refNo, ordNo, parentNo
from qna
order by refNo desc, ordNo; -- refNo ���ñ۳��� ������ ���� ���Ľ�Ų��. �ֽ� ������ ������ ������

-- �۹�ȣ�� 3���� ������ȣ�� 2->3 ���� - �ӽ������� ó��
UPDATE qna
set ordNo = ordNo + 1
where no = 3;
commit;
-- ** ������ Ȯ�ο�
select * from qna;

-- ** REFERENCES qna(no) ON DELETE CASCADE �׽�Ʈ -> create table ��ÿ� ����� ���� �����߾�߸� �Ѵ�.
delete from qna
where no = 4;
rollback;



		select rnum, no, title, name, id, to_char(writeDate, 'yyyy.mm.dd') writeDate, hit, levNo, ordNo
		from(
			select rownum rnum, no, title, name, id, writeDate, hit, levNo, ordNo
			from(
				select q.no, q.title, m.name, q.id, q.writeDate, q.hit, q.levNo, q.ordNo
				from qna q inner join member m on q.id=m.id
				order by q.refNo desc, q.ordNo
			)
		);