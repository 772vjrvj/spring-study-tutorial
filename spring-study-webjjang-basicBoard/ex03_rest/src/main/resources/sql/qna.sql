-- 질문 답변 시스템
-- 1. 객체 제거
drop table qna CASCADE CONSTRAINTS;
DROP SEQUENCE qna_seq;

-- 2. 객체 생성 -> member가 반드시 먼저 있어만 한다.
CREATE TABLE qna(
no number PRIMARY KEY, -- 글번호
title VARCHAR2(300) NOT NULL, -- 제목
content VARCHAR2(2000) NOT NULL, -- 내용
id VARCHAR2(20) NOT NULL 
    REFERENCES member(id), -- 작성자 아이디(로그인 정보에서 자동으로 가져옴)
writeDate date DEFAULT SYSDATE, -- 작성일
hit NUMBER DEFAULT 0, -- 조회수
refNo NUMBER REFERENCES qna(no), -- 관련글
ordNo NUMBER, -- 순서번호
levNo NUMBER, -- 들여쓰기
-- REFERENCES qna(no)로 참조키를 만들면 부모 데이터가 삭제되면 내글을 어떻게 처리할 것인가 정할 수 있다.
-- ON DELETE CASCADE : 내글도 함께 지운다.
-- ON DELETE SET NULL : 내글은 지우지 말고 참조키로 되어 있는 컬럼을 null로 셋팅해 주세요.
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- 부모글(보고 있는 글)
);

CREATE SEQUENCE qna_seq;

-- 3. 샘플데이터
-- 1) 질문하기 - 2개 이상
--   - 관련글번호가 자신 글번호와 같다. --> 질문이다.
--   - 순서가 1번이다.
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '자바란?','자바란 무엇일까요?', 'test',
       qna_seq.nextval, 1, 0, qna_seq.nextval);
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '오라클이란?','오라클이란 무엇일까요?', 'test',
       qna_seq.nextval, 1, 0, qna_seq.nextval);
       
-- 2) 답변하기 - 한개의 질문에 2개이상의 답변
-- '자바란?'에 대한 답변 : 글번호 1, refNo : 1, ordNo : 1, levNo:0
-- 먼저 달린 답변이 있을 수 있다. 먼저 달리 답변의 순서번호(입력하려는 순서 번호보다 같거나 큰)를 전체 + 1 해줘야 한다.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 1 and ordNo >= 2;

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변]자바란?','객체지향적 프로그래밍 언어', 'admin',
       1, 2, 1, 1); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변]자바란?','호환성이 좋다.', 'admin',
       1, 2, 1, 1); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no

-- '오라클이란?' 답변 : 글번호 2, refNo : 2, ordNo : 1, levNo:0
-- 먼저 달린 답변이 있을 수 있다. 먼저 달리 답변의 순서번호(입력하려는 순서 번호보다 같거나 큰)를 전체 + 1 해줘야 한다.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 2 and ordNo >= 2;

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변]오라클이란?','DBMS 입니다.', 'admin',
       2, 2, 1, 2); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변]오라클이란?','오라클사에서 만듬.', 'admin',
       2, 2, 1, 2); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no


-- 3) 답변>답변하기
-- '[답변]자바란?' - 4 : 글번호 4, refNo : 1, ordNo : 2, levNo:1
-- 먼저 달린 답변이 있을 수 있다. 먼저 달리 답변의 순서번호(입력하려는 순서 번호보다 같거나 큰)를 전체 + 1 해줘야 한다.
UPDATE qna
SET ordNo = ordNo + 1
WHERE refNo = 1 and ordNo >= 3; -- 데이터가 들어가야할 순서 번호와 같거나 큰 순서번호를 1증가.

INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변][답변]자바란?','재활용성과 관리가 편하다.', 'admin',
       1, 3, 2, 4); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
values(qna_seq.nextval, '[답변][답변]자바란?','중복된 것과 복잡한 것을 꺼낸다..', 'admin',
       1, 3, 2, 4); -- refNo:부모의 refNo를 그대로 넣는다. ordNo = ordNo + 1. levNo = levNo + 1. 부모글의 no

COMMIT;




-- 4. 리스트 뿌리기
select levNo, no, title, id, writeDate, hit, refNo, ordNo, parentNo
from qna
order by refNo desc, ordNo; -- refNo 관련글끼리 모으기 위해 정렬시킨다. 최신 질문이 맨위에 오도록

-- 글번호가 3번인 순서번호를 2->3 변경 - 임시적으로 처리
UPDATE qna
set ordNo = ordNo + 1
where no = 3;
commit;
-- ** 데이터 확인용
select * from qna;

-- ** REFERENCES qna(no) ON DELETE CASCADE 테스트 -> create table 당시에 선언된 것을 실행했어야만 한다.
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