/* 1. **Scalar Function: `fn_customer_lifetime_value(customer_id)`**
    - Return total **paid** amount 
	  for the customer's delivered/shipped/placed (non-cancelled) orders.  */

create or replace function fn_customer_lifetime_value(P_customer_id int)
returns decimal(12,2)
language plpgsql
as $$
declare
  total decimal(12,2);
begin
  select sum(oi.quantity * oi.unit_price)
  into total
  from orders o
  join order_items oi on o.order_id = oi.order_id
  where o.customer_id = P_customer_id
    and o.status not in ('cancelled');

  return coalesce(total, 0);
end;
$$;


SELECT fn_customer_lifetime_value(3);
