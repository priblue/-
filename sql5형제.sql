--2. 매출이 가장 높은 날이 언제인지 알 수 있게 날짜와 총 매출을 표시하시오.
select cust.order_date, sum(food.food_price) 총_매출
from cust_order cust, food_list food
group by cust.order_date
order by 총_매출 desc

--3.예약한 손님중 포장을 하는 사람 중 가장 비싼 음식을 시킨 주문 번호와, 음식 이름, 가격을 표시하세요.
select top 1 cust.order_num, food.food_name,food.food_price
from cust_order cust INNER JOIN food_list food ON cust.food_id = food.food_id
where cust.SMid = (select serve.SMid from serve_method serve where serve.method = '포장')
AND
cust.OSid = (Select order_state.OSid from order_state where order_state.order_state = '예약')
order by food.food_price desc

--현재 매장에 들어온 주문들을 전체적으로 조회하라.

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

--26일날 매장에서 식사를 하고 간 사람의 수와 그 사람들이 쓰고 간 총액을 구하시오
select count(cust.order_num),sum(food.food_price)
from cust_order cust INNER JOIN food_list food ON cust.food_id = food.food_id
					INNER JOIN serve_method ON cust.SMid = serve_method.SMid
where cust.order_date = '2017/01/26' and serve_method.method = '매장식사'

