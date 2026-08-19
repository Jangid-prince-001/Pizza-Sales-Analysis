-- QUES 1= Retreive the total numer of order  placed
select * from orders;
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- QUES 2= Calculate the total  revenue generated from pizza_sales 
select round(sum(order_details.quantity * pizzas.price),2) as total_sales
 from order_details join pizzas
 on pizzas.pizza_id =order_details.pizza_id; 
 
 -- agar hum data bss 2 decimal position me chiye toh we need round(2)
 
-- Here we find that ki total sales kitni hui so isko calculate krne k liye we need quantity and price . here quantity is present in orders_details 
-- and price is present in pizzas table . hume ye dono data chiye to calculate total revenue toh iske liye humne inn dono tables ko combine krna hoga 
-- using joins . lekin joins ki ek property hoti h ki dono table me ek column common hona choye toh inn dono me piiza_id common h toh uske basis prr join peform hoga

-- QUES 3=IDENTIFY THE HIGHEST-PRICED PIZZA
select pizza_types.name , pizzas.price from 
pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- here humme highest priced piiza chiye with uska name toh we need to join two tables which are pizza_types (it contains name of pizza)
--  and pizzas(it contains price of pizza) . the after join we need to order by pizzas.price in descending order and by using limit clause we set 1 it give top 1 

-- QUES 4= IDENTFY THE MOST COMMON PIZZA SIZE ORDERED
select  pizzas.size, count(order_details.order_details_id) as order_count from
pizzas join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizzas.size
order by order_count desc;

-- QUES 5= LIST HE TOP 5 MOST ORDERED PIZZA TYPE ALONG WITH THEIR QUANTITIES
select pizza_types.name , sum(order_details.quantity) as total_quantity
from 
pizza_types join pizzas on
pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details 
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name 
order by total_quantity desc limit 5;

-- Description= yha prr hum ek toh pizza name chiye jo ki pizza_types ki table me present h aur ek chiye quantity of pizza jo 
-- ki order_details me present h . as we know agar hum inn dono prr join lga te h toh uske liye inn dono table me ek column toh common hona chiye 
-- .lekin inn me koi column common nhi h . lekin ek table h pizzas jisme order_details aur pizza_types ka column present h . 
-- see order_details ka pizza_id preesent h . pizza_type ka pizza_type_id present h. toh hum yha prr teeno table ko join krr na pde ga 
-- phle pizzas & pizza_types join honge . phir order_details & pizzas join honge . AT last sum(order_details.quantity) then sum nikalne kbaad 
-- group by krre name k basis prr . then order by krro quantity k basis prr and last me limit 5 lga de.