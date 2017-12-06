USE master
GO
DROP DATABASE Chicken
CREATE DATABASE Chicken -- MagicCorp 데이터베이스 생성하기
GO
USE Chicken
GO

create table food_list(--매장에서 판매하고 있는 요리에 관한 테이블
	food_id INT CONSTRAINT PK_food_id PRIMARY KEY,
	food_name varchar(10),
	food_price INT
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
	order_address varchar(50) DEFAULT NULL--추가됨 적용은 아직 안됨/.
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

select * from cust_order
select * from food_list
select * from serve_method
select * from payment_method


--손님에게 영수증을 끊어줘 보자.
select food_list.food_name,food_list.food_price,payment_method.method
from food_list,cust_order,serve_method,payment_method,order_state
where cust_order.food_id = food_list.food_id and cust_order.PMid = payment_method.PMid
--위 쿼리문은 틀린 쿼리문

select food.food_name,food.food_price,pay.method,serve.method
from food_list food, payment_method pay, cust_order cust,serve_method serve
where cust.PMid = pay.PMid and cust.food_id = food.food_id and cust.SMid = serve.SMid

--요렇게 하면 원하는대로 작동함. 이 손님은 후라이드 한마리를 카드로 긁고 포장해서 가심..

select food_list.food_name,  cust_order.order_num,  cust_order.order_date,  payment_method.method,  order_state.order_state,  serve_method.method,cust_order.order_address
from cust_order,  food_list,  order_state,  serve_method,  payment_method
where cust_order.OSid = order_state.OSid AND cust_order.PMid = payment_method.PMid AND cust_order.SMid = serve_method.SMid AND cust_order.food_id = food_list.food_id

--위 SQL 구문을 inner join 으로 바꿔보기

select * from cust_order
select * from food_list

select food_list.food_name,  cust_order.order_num,  cust_order.order_date,  payment_method.method,  order_state.order_state,  serve_method.method,cust_order.order_address
from cust_order INNER JOIN food_list ON cust_order.food_id = food_list.food_id
				INNER JOIN payment_method ON cust_order.PMid = payment_method.PMid
				INNER JOIN serve_method ON cust_order.SMid = serve_method.SMid
				INNER JOIN order_state ON cust_order.OSid = order_state.OSid

--1. 각 메뉴 중 가장 잘나가는 음식(매출이 높은)순으로 음식 이름과 가격을 표시하시오.

select cust.food_id ,food.food_name 메뉴,count(*) * food.food_price 총매출
from cust_order cust inner join food_list food on cust.food_id = food.food_id
group by food.food_price, food.food_name, cust.food_id
order by 총매출 desc

--현금으로 결제한 사람들에게는 5% 할인을 해주고자 한다. 주문번호와 음식 이름, 결제 방법 그리고 최종 음식 가격을 주문 전체에서 뽑아라.
select cust.order_num, food.food_name, pay.method, food.food_price
from cust_order cust INNER JOIN food_list food ON cust.food_id = food.food_id
					INNER JOIN payment_method pay ON cust.PMid = pay.PMid

--현금으로 결제한 사람들에게는 5% 할인을 해주고자 한다. 주문번호와 음식 이름, 결제 방법 그리고 최종 음식 가격을 주문 전체에서 뽑아라.
select cust.order_num, food.food_name, pay.method, (Select food_price from food_list where method = '현금') * 0.95
from cust_order cust INNER JOIN food_list food ON cust.food_id = food.food_id
					INNER JOIN payment_method pay ON cust.PMid = pay.PMid

--주문 번호, 시킨 음식, 결제 방법, 음식 가격.
select cust_order.order_num, food_list.food_name, payment_method.method, (select food_list.food_price * 0.95 from food_list where payment_method.method = '현금')
from cust_order INNER JOIN food_list ON cust_order.food_id = food_list.food_id
				INNER JOIN payment_method ON cust_order.PMid = payment_method.PMid

select cust_order.order_num, food_list.food_name, payment_method.method, food_price
from cust_order INNER JOIN food_list ON cust_order.food_id = food_list.food_id
				INNER JOIN payment_method ON cust_order.PMid = payment_method.PMid
where payment_method.method = '현금'

--2. 매출이 가장 높은 날이 언제인지 알 수 있게 날짜와 총 매출을 표시하시오.
select cust.order_date, sum(food.food_price)
from cust_order cust, food_list food
group by cust.order_date
