-- 메시지 시스템
-- 1. 객체 제거
DROP TABLE message CASCADE CONSTRAINTS;
DROP SEQUENCE message_seq;

-- 2. 객체 생성 - 먼저 회원 시키마가 구현되어 있어야 한다. 데이터도 있어야한다.
CREATE TABLE message(
no NUMBER PRIMARY KEY, -- 메시지 번호
content VARCHAR2(2000) NOT NULL, -- 내용
-- 회원이 사라지면 메시지도 사라진다. :  REFERENCES member(id) ON DELETE CASCADE
sender VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE , -- 보내는 사람의 ID (FK-참조하고 있는 PK의 타입과 크기에 맞춘다.)
sendDate DATE DEFAULT SYSDATE, -- 보낸 날짜 : 현재날짜가 기본
accepter VARCHAR2(20) NOT NULL REFERENCES member(id) ON DELETE CASCADE, -- 받는 사람의 ID
acceptDate DATE DEFAULT NULL -- 받은 날짜 : 현재날짜- 기본은 null
-- -> 받았다:날짜가 있다. 받지 않았다. 날짜가 없다.
);

CREATE SEQUENCE message_seq;