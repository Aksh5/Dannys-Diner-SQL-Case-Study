-- View Sales table
select *
from sales;

-- View Menu table
select *
from menu;

-- View Members table
select *
from members;

-- View all data joined together
select 
s.customer_id, s.order_date, s.product_id, m.product_name, m.price, mem.join_date
from sales s
join menu m on s.product_id = m.product_id
left join members mem on s.customer_id = mem.customer_id
order by s.customer_id, s.order_date;

-- 1. What is the total amount each customer spent at the restaurant?
select s.customer_id, sum(m.price) as Total_Amt_spent
from sales s
join menu m on s.product_id = m.product_id
group by s.customer_id
order by s.customer_id;

-- 2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as Visit_days
from sales
group by customer_id
order by customer_id;

-- 3. What was the first item from the menu purchased by each customer?
select customer_id, product_name
from (
select 
s.customer_id, m.product_name,
ROW_NUMBER() over (
partition by s.customer_id
order by s.order_date, m.product_name
) as rn
from sales s 
join menu m on s.product_id = m.product_id
) ranked
where rn = 1;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select m.product_name, count(*) as purchase_count
from sales s
join menu m on s.product_id = m.product_id
group by m.product_name
order by purchase_count desc;

5. Which item was the most popular for each customer?
with customer_item_counts as (
select
s.customer_id, m.product_name,
count(*) as order_count,
rank() over (partition by s.customer_id order by count(*) desc) as rnk
from sales s
join menu m on s.product_id = m.product_id
group by s.customer_id, m.product_name
)
select customer_id, product_name, order_count
from customer_item_counts
where rnk = 1
order by customer_id;

-- 6. Which item was purchased first by the customer after they became a member?
with first_purchase_after_join as (
select s.customer_id, min(s.order_date) as first_order_date
from sales s
join members mem on s.customer_id = mem.customer_id
where s.order_date >=mem.join_date
group by s.customer_id
)
select f.customer_id, f.first_order_date, m.product_name
from first_purchase_after_join f
join sales s on f.customer_id = s.customer_id and f.first_order_date = s.order_date
join menu m on s.product_id = m.product_id
order by f.customer_id;

-- 7. Which item was purchased just before the customer became a member?


-- 8. What is the total items and amount spent for each member before they became a member?


-- 9. If each $10 spent equates to 1 point, how many points would each customer have?


-- 10. In the first week after a customer joins, they earn 2x points on all items. Calculate total points considering this rule.

