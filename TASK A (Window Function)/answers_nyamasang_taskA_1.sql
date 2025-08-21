/*1. **Monthly Customer Rank by Spend**
   - For each month (based on `order_date`), rank customers by **total order value** in that month using `RANK()`.
   - Output: month (YYYY-MM), customer_id, total_monthly_spend, rank_in_month.*/

select
  to_char(o.order_date, 'yyyy-mm') as month, o.customer_id,  
  sum(oi.quantity * oi.unit_price) as total_monthly_spend,
  rank() over (
    partition by to_char(o.order_date, 'yyyy-mm')
    order by sum(oi.quantity * oi.unit_price) desc
  ) as rank_in_month
from orders o
join order_items oi on o.order_id = oi.order_id
group by to_char(o.order_date, 'yyyy-mm'), o.customer_id;

SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM customers;
select * from payments;
select * from products;
