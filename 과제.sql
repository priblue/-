USE master
GO
CREATE DATABASE Chicken -- MagicCorp 데이터베이스 생성하기
GO
USE Chicken
GO

create table food_list(--매장에서 판매하고 있는 요리에 관한 테이블
	food_id INT CONSTRAINT PK_food_id PRIMARY KEY,
	food_name varchar(10),
	food_price varchar(10)
);

create table serve_method( --요리 제공 방법에 대한 테이블
	SMid INT CONSTRAINT PK_SMid PRIMARY KEY,
	method varchar(10)
);

create table payment_method(--결제 방법에 대한 테이블
	PMid INT CONSTRAINT PK_PMid PRIMARY KEY,
	method varchar(10)
);

create table order_state(
	OSid INT CONSTRAINT PK_OSid PRIMARY KEY,
	order_state varchar(10)--예약,취소,
);

create table cust_order(--손님 주문에 관한 테이블
	food_id INT CONSTRAINT FK_food_id REFERENCES food_list(food_id),--주문한 음식 코드
	order_num INT CONSTRAINT PK_order_num PRIMARY KEY IDENTITY(1,1),--주문번호. 입력된 순서대로 번호를 지정해주어야함. 0 1 2...이 코드로 손님들을 식별함.
	order_date DATETIME,
	PMid INT CONSTRAINT FK_PMid REFERENCES payment_method(PMid),
	OSid INT CONSTRAINT FK_OSid REFERENCES order_state(OSid),
	SMid INT CONSTRAINT FK_SMid REFERENCES serve_method(SMid),
	order_address varchar(50)
);

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

INSERT INTO cust_order VALUES(2,'2017/01/23',1,1,1,NULL); 
INSERT INTO cust_order VALUES(0,'2017/01/23',0,0,2,'부산시 금정구');
INSERT INTO cust_order VALUES(4,'2017/01/23',2,1,1,NULL);
INSERT INTO cust_order VALUES(3,'2017/01/24',1,0,0,NULL);
INSERT INTO cust_order VALUES(1,'2017/01/24',0,0,0,NULL);
INSERT INTO cust_order VALUES(4,'2017/01/24',1,0,2,'부산시 동래구');
INSERT INTO cust_order VALUES(2,'2017/01/25',2,0,0,NULL);
INSERT INTO cust_order VALUES(1,'2017/01/25',1,1,2,'부산시 ');
INSERT INTO cust_order VALUES(0,'2017/01/25',1,0,0,NULL);
INSERT INTO cust_order VALUES(4,'2017/01/26',0,0,1,NULL);
INSERT INTO cust_order VALUES(0,'2017/01/26',1,0,0,NULL);
INSERT INTO cust_order VALUES(2,'2017/01/26',2,0,1,NULL);
INSERT INTO cust_order VALUES(1,'2017/01/27',1,0,0,'부산시 ');
INSERT INTO cust_order VALUES(3,'2017/01/27',2,1,2,'부산시 ');
INSERT INTO cust_order VALUES(3,'2017/01/28',1,0,0,NULL);
INSERT INTO cust_order VALUES(0,'2017/01/28',0,0,1,NULL);

select * from food_list
select * from serve_method
select * from payment_method
select * from cust_order
