/* 3. **Top Category by City**
   - For each `city`, find the **single category** 
   with the highest total revenue. 
   Use an inner subquery or a view plus a filter on rank. */


select city, category, total_revenue
from (

    select c.city,p.category,
    sum(oi.quantity * oi.unit_price) as total_revenue,
    rank()over(partition by c.city order by sum(oi.quantity * oi.unit_price)desc) as rnk
    from customers c
    join orders o       on c.customer_id = o.customer_id
    join order_items oi on o.order_id    = oi.order_id
    join products p     on oi.product_id = p.product_id
    group by c.city, p.category
) ranked
where rnk = 1;
