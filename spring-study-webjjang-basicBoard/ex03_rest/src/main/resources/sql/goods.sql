create table goods(
no number primary key,
name VARCHAR2(50),
price number
);

create sequence goods_seq;

insert into goods values(goods_seq.nextval, '컴퓨터 완제품', 700000);
insert into goods values(goods_seq.nextval, '컴퓨터 본체', 500000);
insert into goods values(goods_seq.nextval, '24인치 모니터', 300000);
insert into goods values(goods_seq.nextval, '키보드-마우스', 25000);
commit;

select * from goods;

