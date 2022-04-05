-- 1.메시지 리스트
--   1)받은 메시지
--  admin 받은 메시지
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : 일반조건 , (sender = id) : 조인 조건
where (accepter = 'admin') and (sender = id)
order by no desc;

--  admin 받은 메시지 - 읽지 않은 메시
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : 일반조건 , (sender = id) : 조인 조건
where (accepter = 'admin'
   -- acceptDate is null : 읽지 않은 메시지
   -- and acceptDate is null)
   -- acceptDate is null : 읽은 메시지
   and acceptDate is not null)
   and (sender = id)
order by no desc;

--  test 받은 메시지
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'test') : 일반조건 , (sender = id) : 조인 조건
where (accepter = 'test') and (sender = id)
order by no desc;

--   2)받은 중에서 읽지 메시지
select no, sender, name senderName, sendDate, acceptDate
from message, member
--   (accepter = 'admin') : 일반조건 , (sender = id) : 조인 조건
--   acceptDate is null : 일반조건 - 받은 날짜가 null인지 물어볼 때 is null을 사용한다.
where (accepter = 'admin' and acceptDate is null) and (sender = id)
order by no desc;

--   3)보낸 메시지(sender = 'test')와 받은 메시지(accepter = 'test') 모두를 가져오는 리스트
select m.no, m.sender, sm.name senderName, m.sendDate, m.accepter, am.name accepterName, m.acceptDate
from message m, member sm, member am
where (m.sender = 'test' or m.accepter = 'test') and (sender = sm.id and accepter = am.id)
order by m.no desc;



-- 2. 메시지 보기
--     메시지를 읽음으로 우선 처리한다.
update message
set acceptDate = sysdate
where no = 1;
commit;
select no, content, sender, name senderName, sendDate, acceptDate
from message, member
where (accepter = 'admin') and (sender = id)
order by no desc;


-- 3. 메시지 보내기 - 메시지 정보를 DB에 저장한다.
-- test -> admin
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '잘지내지?', 'test', 'admin');
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '오랜만입니다.?', 'test', 'admin');
commit;
-- admin -> test
insert into message(no, content, sender, accepter)
values(message_seq.nextval, '잘지내고 있습니다. 감사합니다.', 'admin', 'test');
commit;

-- 4. 메시지 수정 - 이미 받은 메시지를 읽은 경우 메시지를 수정하면 내용이 서로 안 맞게 된다. 그래서 수정을 하지 않는 것으로 하자.
-- 5. 메시지 삭제
--   - 받는 사람이 메시지를 읽지 않은 경우 삭제 가능. 읽었으면 삭제 불가능.\
--   - 본인이 받은 사람일때 삭제 가능.
delete from message
where no = 1 and (accepter = 'test' or acceptDate is null);


select * from message;