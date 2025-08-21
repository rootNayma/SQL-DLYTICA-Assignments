/* 2. **Category Mix per Customer**
    - For each customer, list categories purchased
	and the **count of distinct orders** per category. 
	Order by customer and count desc.  */


select 
    c.customer_id,
    p.category,
    count(distinct o.order_id) as orders_per_category
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by c.customer_id, p.category
order by c.customer_id, orders_per_category desc;
