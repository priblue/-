USE master
GO
CREATE DATABASE Chicken -- MagicCorp 데이터베이스 생성하기
GO
USE Chicken
GO

create table food_list(--매장에서 판매하고 있는 요리에 관한 테이블
	food_id INT PRIMARY KEY,
	food_name varchar(10) not null,
	food_price varchar(10) not null,
);

create table serve_method( --요리 제공 방법에 대한 테이블
	SMid INT PRIMARY KEY,
	method varchar(10)
);

create table payment_method(--결제 방법에 대한 테이블
	PMid INT PRIMARY KEY,
	method varchar(10)
);

create table order_state(
	OSid INT PRIMARY KEY,
	order_state varchar(10),--예약,취소,
);

create table cust_order(--손님 주문에 관한 테이블
	food_id INT REFERENCES food_list(food_id),--주문한 음식 코드
	order_num INT PRIMARY KEY,--주문번호. 입력된 순서대로 번호를 지정해주어야함. 0 1 2...이 코드로 손님들을 식별함.
	PMid INT REFERENCES payment_method(PMid),
	OSid INT REFERENCES order_state(OSid),
	SMid INT REFERENCES serve_method(SMid),
	order_address varchar(20)
);

ALTER TABLE cust_order
alter column order_address varchar(50)

INSERT INTO food_list VALUES(0,'후라이드',9000);
INSERT INTO food_list VALUES(1,'양념치킨',9500);
INSERT INTO food_list VALUES(2,'A세트',10000);
INSERT INTO food_list VALUES(3,'B세트',11000);
INSERT INTO food_list VALUES(4,'C세트',15000);

INSERT INTO serve_method VALUES(0,'매장식사');
INSERT INTO serve_method VALUES(1,'포장');
INSERT INTO serve_method VALUES(2,'배달');

INSERT INTO payment_method VALUES(0,'카드');
INSERT INTO payment_method VALUES(1,'현금');
INSERT INTO payment_method VALUES(2,'상품권');

INSERT INTO order_state VALUES(0,'정상주문');
INSERT INTO order_state VALUES(1,'예약');
INSERT INTO order_state VALUES(2,'취소');

INSERT INTO cust_order VALUES(0,0,0,0,1,'부산시 금정구 남산동 116-3 1층');

select * from food_list
select * from serve_method
select * from payment_method
select * from cust_order

--손님에게 영수증을 끊어줘 보자.
select food_list.food_name,food_list.food_price,payment_method.method
from food_list,cust_order,serve_method,payment_method,order_state
where cust_order.food_id = food_list.food_id and cust_order.PMid = payment_method.PMid
--위 쿼리문은 틀린 쿼리문

select food.food_name,food.food_price,pay.method,serve.method
from food_list food, payment_method pay, cust_order cust,serve_method serve
where cust.PMid = pay.PMid and cust.food_id = food.food_id and cust.SMid = serve.SMid
--요렇게 하면 원하는대로 작동함. 이 손님은 후라이드 한마리를 카드로 긁고 포장해서 가심..
