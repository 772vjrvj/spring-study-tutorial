-- 1.�޽��� ����Ʈ
--   1)���� �޽���
--  admin ���� �޽���
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : �Ϲ����� , (sender = id) : ���� ����
where (accepter = 'admin') and (sender = id)
order by no desc;

--  admin ���� �޽��� - ���� ���� �޽�
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : �Ϲ����� , (sender = id) : ���� ����
where (accepter = 'admin'
   -- acceptDate is null : ���� ���� �޽���
   -- and acceptDate is null)
   -- acceptDate is null : ���� �޽���
   and acceptDate is not null)
   and (sender = id)
order by no desc;

--  test ���� �޽���
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'test') : �Ϲ����� , (sender = id) : ���� ����
where (accepter = 'test') and (sender = id)
order by no desc;

--   2)���� �߿��� ���� �޽���
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : �Ϲ����� , (sender = id) : ���� ����
--   acceptDate is null : �Ϲ����� - ���� ��¥�� null���� ��� �� is null�� ����Ѵ�.
where (accepter = 'admin' and acceptDate is null) and (sender = id)
order by no desc;

--   3)���� �޽���(sender = 'test')�� ���� �޽���(accepter = 'test') ��θ� �������� ����Ʈ
select m.no, m.sender, sm.name senderName, m.sendDate, m.accepter, am.name accepterName, m.acceptDate
from message m, member sm, member am
where (m.sender = 'test' or m.accepter = 'test') and (sender = sm.id and accepter = am.id)
order by m.no desc;



-- 2. �޽��� ����
--     �޽����� �������� �켱 ó���Ѵ�.
update message
set acceptDate = sysdate
where no = 1;
commit;
select no, content, sender, name senderName, sendDate, acceptDate
from message, member
where (accepter = 'admin') and (sender = id)
order by no desc;


-- 3. �޽��� ������ - �޽��� ������ DB�� �����Ѵ�.
-- test -> admin
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '��������?', 'test', 'admin');
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '�������Դϴ�.?', 'test', 'admin');
commit;
-- admin -> test
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '�������� �ֽ��ϴ�. �����մϴ�.', 'admin', 'test');
commit;

-- 4. �޽��� ���� - �̹� ���� �޽����� ���� ��� �޽����� �����ϸ� ������ ���� �� �°� �ȴ�. �׷��� ������ ���� �ʴ� ������ ����.
-- 5. �޽��� ����
--   - �޴� ����� �޽����� ���� ���� ��� ���� ����. �о����� ���� �Ұ���.\
--   - ������ ���� ����϶� ���� ����.
delete from message
where no = 1 and (accepter = 'test' or acceptDate is null);


select * from message;