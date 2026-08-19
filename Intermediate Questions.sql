-- QUES 1= Join the necessary  tables to find the total quantity of each pizza category.

 select  pizza_types.category , sum(order_details.quantity) as quantity from
 pizza_types join pizzas 
 on pizza_types.pizza_type_id=pizzas.pizza_type_id 
 join order_details 
 on order_details.pizza_id=pizzas.pizza_id
 group by pizza_types.category  order by quantity desc;
 
 -- here we have to calculate ki konsi category kitni quantity me sell hui h 
 -- so order_details me toh quantity present thi and pizza_types me category present thi 
--  abb hum inn dono tables ko combine nhi krr skte kyuki inn dono me koi bhi common column nhi h jiske basis prr hum inne join krr ske 
--  so here we use another table to join both of them . we chhose pizzas which also have pizza_type_id & pizza_id so on basis of pizzas table we 
--  can join them . and at last we need to group by on basis of category and order by quantity .


-- QUES 2= DETERMINE THE DISTRIBUTION OF ORDERS BY HOUR OF THE DAY .
-- means din k hour k bass prr order ka distribution dekhna h 
select hour(order_time) as per_hour, count(order_id) as total_order_per_hour from orders
group by per_hour;

-- QUES 3= JOIN RELEVANT TABLES TO FIND THE CATEGORY WISE DISTRIBUTION OF PIZZAS.
select * from pizza_types;
select category , count(name) from pizza_types 
group by category;


-- QUES 4= GROUP THE ORDERS BY DATE AND CALCULATE THE AVERAGE NUMBER OF PIZZAS ORDERED PER DAY 
select avg(quantity) from
(select orders.order_date, sum(order_details.quantity) as quantity from 
order_details join orders 
on order_details.order_id=orders.order_id
group by orders.order_date) as order_details;


-- QUES 5= DETERMINE  THE TOP 3 MOST ORDERED PIZZA TYPES BASED ON REVENUE
select pizza_types.name , sum(order_details.quantity* pizzas.price) as revenue from 
pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name order by revenue  desc limit 3;
