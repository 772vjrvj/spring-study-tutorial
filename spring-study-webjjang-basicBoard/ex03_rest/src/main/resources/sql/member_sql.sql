-- join - 분할되어 있는 테이블의 데이터를 조립해서 가져오는 기술
-- 오라클의 조인과 그외 DB에서 사용하는 조인(= ANSI 조인)이 있다.
--- 오라클 조인 작성 
-- 아이디, 이름, 이메일, 등급번호, 등급이름
-- 컬럼을 지정방식 : 계정.객체.항목 -> [member.]gradeNo / [grade].gradeNo
-- 이전 실습내용
select id, name, email, gradeNo from member;
-- 객체 안의 데이터 가져오는 표현식
select member.id, member.name, member.email,  member.gradeNo
from member;
-- 회원테이블 - 아이디, 이름, 이메일, 등급번호 / 등급테이블 - 등급이름
-- 별칭(별명) - member -> m
select m.id, m.name, m.email, m.gradeNo, g.gradeName
-- 여기가 맨처음 실행되는 곳으로 member를 별칭 m으로 바꿔 놓는다. 다음부터는 m으로 표기해야만 한다.
-- 여기가 맨처음 실행되는 곳으로 grade 별칭 g으로 바꿔 놓는다. 다음부터는 g으로 표기해야만 한다.
from member m, grade g
-- 조인 조건 : pk = fk
where g.gradeNo = m.gradeNo;
