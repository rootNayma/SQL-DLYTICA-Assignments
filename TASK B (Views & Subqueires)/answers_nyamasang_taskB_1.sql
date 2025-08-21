/* 1. **Create View: `vw_recent_orders_30d`**
   - View of orders placed in the **last 30 days** from `CURRENT_DATE`, excluding `cancelled`.
   - Columns: order_id, customer_id, order_date, status, order_total (sum of items). */

create or replace view vw_recent_orders_30d as
select 
  o.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  sum(oi.quantity * oi.unit_price) as order_total
from orders o
join order_items oi on o.order_id = oi.order_id
where o.status <> 'cancelled'
group by o.order_id, o.customer_id, o.order_date, o.status;

select * from vw_recent_orders_30d;
