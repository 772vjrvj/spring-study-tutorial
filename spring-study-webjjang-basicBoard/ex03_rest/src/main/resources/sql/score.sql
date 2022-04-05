-- 점수 테이블
-- 학년, 반, 번호, 국어, 영어, 컴퓨터
-- 1. 객체 제거
DROP TABLE score CASCADE CONSTRAINTS;

-- 2. 객체 생성
CREATE TABLE score(
grade number(1), -- 학년
ban number(2), -- 반
bun number(2), -- 번호
kor number(3), -- 국어 점수
eng number(3), -- 영어 점수
com number(3) -- 컴퓨터 점수
);

-- 3. 샘플 데이터 입력
insert into score
values(1,1,1, 100, 80, 85);
insert into score
values(1,2,1, 70, 90, 85);
insert into score
values(1,2,2, 90, null, 100);
insert into score
values(2,1,1, 90, 95, 85);
insert into score
values(2,1,2, null, 100, null);
insert into score
values(2,2,1, 90, 80, 100);
insert into score
values(3,1,1, 100, 80, null);
insert into score
values(3,1,2, 90, 100, 85);
insert into score
values(3,1,2, 100, 80, 85);
commit;

-- 각각의 학생에 대해서 정보를 출력하고 점수의 합계와 평균을 구하시오.
select grade, ban, bun, kor, eng, com, kor + eng + com sum
from score;
-- 이때 합계에서 숫자인 경우 null이 있으면 결과는 null이 된다.
-- 점수가 null이면 0으로 처리해서 계산하자.
-- nvl(숫자, null과대체되는 값)
select grade, ban, bun, nvl(kor,0), nvl(eng,0), nvl(com,0),
nvl(kor,0) + nvl(eng,0) + nvl(com,0) sum
from score;
?
-- 각각 과목에 대한 합계와 평균을 구하시오.(null 데이터는 제외하고 연산해 준다.)
-- sum(컬럼) 컬럼의 합계, avg(컬럼) 컬럼의 평균
-- 데이터 표시하기 : 숫자 -> 문자 패턴 변화
-- 0: 자리수가 맞지 않으면 0을 표시한다. 생략하지 않는다.
-- 9: 자리수가 맞지 않으면 생략하게 된다.
-- 3번째 자리의 ,: 천단위 ,를 표시한다.
select to_char(sum(kor),'9,999') kor_sum, to_char(avg(kor),'999.00') kor_avg , to_char(sum(eng),'9,999') eng_sum,
to_char(avg(eng), '999.00') eng_avg, to_char(sum(com),'9,999') com_sum, to_char(avg(com),'999.00') com_avg 
from score;

select sum(kor), to_char(avg(kor),'99.00') kor_avg , sum(eng), to_char(avg(eng), '999.00') eng_avg, sum(com),
avg(com) com_avg 
from score;

-- 학년별 과목의 합계와 평균을 구해보자.(통계)
select grade sum(kor) kor_sum
from score
group by grade
order by grade;
-- 반별 과목의 합계와 평균을 구해보자.(통계)
select grade, ban, sum(kor) kor_sum
from score
group by grade, ban
order by grade, ban;



