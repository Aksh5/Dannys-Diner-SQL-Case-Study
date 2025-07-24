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

1. What is the total amount each customer spent at the restaurant?


2. How many days has each customer visited the restaurant?


3. What was the first item from the menu purchased by each customer?


4. What is the most purchased item on the menu and how many times was it purchased by all customers?


5. Which item was the most popular for each customer?


6. Which item was purchased first by the customer after they became a member?


7. Which item was purchased just before the customer became a member?


8. What is the total items and amount spent for each member before they became a member?


9. If each $10 spent equates to 1 point, how many points would each customer have?


10. In the first week after a customer joins, they earn 2x points on all items. Calculate total points considering this rule.

