create table goods(
no number primary key,
name VARCHAR2(50),
price number
);

create sequence goods_seq;

insert into goods values(goods_seq.nextval, '��ǻ�� ����ǰ', 700000);
insert into goods values(goods_seq.nextval, '��ǻ�� ��ü', 500000);
insert into goods values(goods_seq.nextval, '24��ġ �����', 300000);
insert into goods values(goods_seq.nextval, 'Ű����-���콺', 25000);
commit;

select * from goods;

