-- QUES 1= CALCULATE THE PERCENTAGE CONTRIBUTION OF EACH PIZZA TYPE OF TOTAL REVENUE 
select pizza_types.category, 
(sum(order_details.quantity * pizzas.price)/ (select  round(sum(order_details.quantity * pizzas.price),2) as total_sales
from  order_details join pizzas  
on pizzas.pizza_id = order_details.pizza_id) )*100 as revenue
from pizza_types join pizzas 
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id =pizzas.pizza_id 
group by pizza_types.category 
order by revenue desc;

-- QUESTION:
-- Har Pizza Category ka Total Revenue me Percentage Contribution Calculate Karna Hai
-- Pizza Category ka Name (Classic, Chicken, Veggie, Supreme etc.)
-- Percentage Contribution Nikalne Ka Formula
-- (Category Revenue / Total Revenue) * 100
-- SUBQUERY:
-- Sare Pizza Orders ka Total Revenue Calculate Karna
-- pizzas table ko join kiya taaki price mil sake
-- pizza_types aur pizzas ko join kiya
-- Taaki har pizza ki category mil sake
-- pizzas aur order_details ko join kiya
-- Taaki sold quantity mil sake
-- Category wise grouping ki
-- Taaki har category ka alag revenue calculate ho
-- Jiski revenue contribution sabse jyada ho
-- Use sabse upar dikhaya jayega
/***************************************************
DETAILED HINGLISH EXPLANATION
***************************************************/
-- STEP 1:
-- order_details.quantity * pizzas.price
-- Har order ka revenue calculate kar raha hai

-- Formula:
-- Revenue = Quantity Sold × Price
-- Example:
-- Quantity = 5
-- Price = 200
-- Revenue = 5 × 200 = 1000
----------------------------------------------------

-- STEP 2:
-- SUM(order_details.quantity * pizzas.price)
-- Ek hi category ke saare pizzas ka revenue add kar raha hai
-- Example:
-- Pizza 1 Revenue = 1000
-- Pizza 2 Revenue = 1500
-- Pizza 3 Revenue = 2500

-- Total Category Revenue = 5000
----------------------------------------------------

-- STEP 3: SUBQUERY

-- Sare categories ka combined revenue nikal raha hai
-- Example:
-- Classic Revenue = 5000
-- Chicken Revenue = 3000
-- Veggie Revenue = 2000

-- Total Revenue = 10000
----------------------------------------------------

-- STEP 4:

-- Formula:
-- (Category Revenue / Total Revenue) * 100
-- Ye batata hai ki kisi category ka
-- Total Revenue me kitna contribution hai

-- Example:
-- (5000 / 10000) * 100 = 50%

-- Matlab Category ne Total Revenue ka 50% contribute kiya


----------------------------------------------------
-- TABLES KA ROLe
-- pizza_types:
-- Category Name Store Karta Hai
-- pizzas:
-- Pizza ki Price Store Karta Hai
-- order_details:
-- Pizza ki Sold Quantity Store Karta Hai
---------------------------------------------------
-- INTERVIEW EXPLANATION
-- Pehle Quantity × Price se category-wise revenue nikala gaya hai.
-- Fir subquery ki help se overall total revenue calculate kiya gaya hai.
-- Uske baad category revenue ko total revenue se divide karke
-- 100 se multiply kiya gaya hai taaki percentage contribution mil sake.
-- Finally result ko descending order me sort kiya gaya hai.
----------------------------------------------------
-- FINAL FORMULA
-- Percentage Contribution
-- = (Category Revenue / Total Revenue) * 100
-- Ye hi poori query ka main logic hai.



-- QUES 2= ANALYZE THE COMMULATIVE REVENUE GENERATED OVER TIME 
-- COMMULATIVE means= Day 1 = 100
-- Day 2 = 100 + 200 = 300
-- Day 3 = 300 + 150 = 450
-- Day 4 = 450 + 250 = 700

select order_date, sum(revenue) over(order by order_date) as cum_revenue from
(select orders.order_date , sum(order_details.quantity * pizzas.price) as revenue from
order_details join pizzas 
on order_details.pizza_id=pizzas.pizza_id
join orders 
on orders.order_id =order_details.order_id
group by orders.order_date) as sales;

-- QUESTION:
-- Analyze the Cumulative Revenue Generated Over Time

-- CUMULATIVE REVENUE KYA HOTA HAI?
-- Cumulative Revenue ka matlab Running Total Revenue hota hai

-- Example:

-- Day 1 Revenue = 100
-- Cumulative Revenue = 100

-- Day 2 Revenue = 200
-- Cumulative Revenue = 100 + 200 = 300

-- Day 3 Revenue = 150
-- Cumulative Revenue = 300 + 150 = 450

-- Day 4 Revenue = 250
-- Cumulative Revenue = 450 + 250 = 700

-- Har naye din ka revenue pichhle total revenue me add hota rehta hai


/***************************************************
STEP 1: DAILY REVENUE CALCULATE KARNA
***************************************************/

-- order_details.quantity * pizzas.price

-- Har sold pizza ka revenue calculate kar raha hai

-- Formula:
-- Revenue = Quantity Sold × Pizza Price

-- Example:
-- Quantity = 5
-- Price = 200

-- Revenue = 5 × 200 = 1000


----------------------------------------------------

-- SUM(order_details.quantity * pizzas.price)

-- Ek hi din ke saare pizza orders ka revenue add kar raha hai

-- Example:

-- 01-Jan Revenue = 1000 + 2000 + 3000
-- Daily Revenue = 6000


----------------------------------------------------

-- order_details JOIN pizzas

-- pizzas table se pizza ki price lene ke liye join kiya

-- Kyunki order_details table me quantity hoti hai
-- Price pizzas table me stored hoti hai


----------------------------------------------------

-- JOIN orders

-- orders table se order_date lene ke liye join kiya

-- Taaki revenue ko date wise analyze kar sake


----------------------------------------------------

-- GROUP BY orders.order_date

-- Same date ke saare orders ko ek group me convert kar raha hai

-- Result:
-- Har date ka ek total revenue milega


/***************************************************
STEP 2: CUMULATIVE REVENUE CALCULATE KARNA
***************************************************/

-- SUM(revenue) OVER(ORDER BY order_date)

-- Window Function use kiya gaya hai

-- Ye Running Total calculate karta hai
-- ORDER BY order_date
-- Revenue ko date ke sequence me process karega
-- Sabse purani date se latest date tak
-- Example:
-- Date         Revenue
-- 01-Jan       100
-- 02-Jan       200
-- 03-Jan       150
-- 04-Jan       250


-- Cumulative Revenue Calculation
-- 01-Jan = 100

-- 02-Jan = 100 + 200
--         = 300

-- 03-Jan = 300 + 150
--         = 450

-- 04-Jan = 450 + 250
--         = 700

-- FINAL OUTPUT
-- order_date     revenue     cum_revenue
-- 01-Jan         100         100
-- 02-Jan         200         300
-- 03-Jan         150         450
-- 04-Jan         250         700

-- INTERVIEW EXPLANATION
-- Pehle subquery ki help se har date ka total revenue
-- calculate kiya gaya hai using:

-- Quantity Sold × Pizza Price

-- Uske baad Window Function
-- SUM() OVER(ORDER BY order_date)
-- ka use karke running total ya cumulative revenue
-- calculate kiya gaya hai.
-- Isse hume pata chalta hai ki time ke saath
-- total revenue kitna accumulate hua hai.


-- IMPORTANT CONCEPT
-- GROUP BY
-- Daily Revenue Deta Hai
-- WINDOW FUNCTION
-- Running Total / Cumulative Revenue Deti Hai


-- SHORT INTERVIEW ANSWER
-- Is query me pehle date-wise revenue calculate kiya gaya hai.
-- Fir SUM() OVER(ORDER BY order_date) window function ka use karke
-- cumulative revenue ya running total nikala gaya hai.
-- Ye dikhata hai ki time ke saath revenue kaise grow hua.


-- QUES 3= DETERMINE THE TOP 3 MOST ORDERED PIZZA TYPES BASED ON REVENUE FOR EACH PIZZA CATEGORY 
select name , revenue from
(select category , name , revenue ,
rank()  over( partition by category order by revenue desc) as rn
from
(select pizza_types.category, pizza_types.name,
sum((order_details.quantity) * pizzas.price) as revenue 
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details 
on order_details.pizza_id =pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where rn>=3;