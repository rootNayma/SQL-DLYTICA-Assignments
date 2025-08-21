/*
5. **First and Last Purchase Category per Customer**
   - For each customer, show the **first** and 
   **most recent** product category 
   they've bought using `FIRST_VALUE` and `LAST_VALUE` over `order_date`.*/



with customer_buy as
(select c.customer_id, c.full_name, p.category, o.order_date,

first_value(p.category) over(partition by c.customer_id order by o.order_date) as first_item,
last_value(p.category) over(partition by c.customer_id order by o.order_date
rows between unbounded preceding and unbounded following) as last_item

from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
)
select customer_id, full_name, first_item, last_item
from customer_buy
order by customer_id;


