-- join - ���ҵǾ� �ִ� ���̺��� �����͸� �����ؼ� �������� ���
-- ����Ŭ�� ���ΰ� �׿� DB���� ����ϴ� ����(= ANSI ����)�� �ִ�.
--- ����Ŭ ���� �ۼ� 
-- ���̵�, �̸�, �̸���, ��޹�ȣ, ����̸�
-- �÷��� ������� : ����.��ü.�׸� -> [member.]gradeNo / [grade].gradeNo
-- ���� �ǽ�����
select id, name, email, gradeNo from member;
-- ��ü ���� ������ �������� ǥ����
select member.id, member.name, member.email,  member.gradeNo
from member;
-- ȸ�����̺� - ���̵�, �̸�, �̸���, ��޹�ȣ / ������̺� - ����̸�
-- ��Ī(����) - member -> m
select m.id, m.name, m.email, m.gradeNo, g.gradeName
-- ���Ⱑ ��ó�� ����Ǵ� ������ member�� ��Ī m���� �ٲ� ���´�. �������ʹ� m���� ǥ���ؾ߸� �Ѵ�.
-- ���Ⱑ ��ó�� ����Ǵ� ������ grade ��Ī g���� �ٲ� ���´�. �������ʹ� g���� ǥ���ؾ߸� �Ѵ�.
from member m, grade g
-- ���� ���� : pk = fk
where g.gradeNo = m.gradeNo;
