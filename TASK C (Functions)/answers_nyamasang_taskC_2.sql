/* 2. **Table Function: `fn_recent_orders(p_days INT)`**
    - Return `order_id, customer_id, order_date, status, 
	 order_total` for orders in the last `p_days` days. */

SELECT * 
FROM fn_recent_orders(65); 

create or replace function fn_recent_orders(p_days int)
returns table (
    order_id int, 
    customer_id int, 
    order_date date,
    status text, 
    order_total numeric
)
language plpgsql
as $$
begin
    return query
    select
        o.order_id, 
        o.customer_id, 
        o.order_date::date,
        o.status::text,
        sum(oi.quantity * oi.unit_price) as order_total
    from orders o
    join order_items oi on o.order_id = oi.order_id
    where o.order_date >= current_date - (p_days || ' days')::interval
    group by o.order_id, o.customer_id, o.order_date, o.status;
end;
$$;



