/* 1. **Average Order Value by City (Delivered Only)**
    - Output: city, avg_order_value, delivered_orders_count. 
	 Order by `avg_order_value` desc. Use `HAVING` to keep cities 
	 with at least 2 delivered orders.  */



select 
    c.city,
    avg(oi.quantity * oi.unit_price) as avg_order_value,
    count(distinct o.order_id) as delivered_orders_count
from orders o
join order_items oi on o.order_id = oi.order_id
join customers c on o.customer_id = c.customer_id
where o.status = 'delivered'
group by c.city
having count(distinct o.order_id) >= 2
order by avg_order_value desc;
