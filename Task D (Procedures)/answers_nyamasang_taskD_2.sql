/* 2. **`sp_cancel_order(p_order_id INT)`**
    - Set order `status` to `cancelled` **only if** 
	  it is not already `delivered`.
    - (Optional) Delete unpaid `payments` 
	if any exist for that order (there shouldn’t be, but handle defensively).  */


select * from payments
where order_id = 10;
 
create or replace procedure sp_cancel_order(p_order_id int)
language plpgsql
as $$
begin
    -- update the order if it is not delivered
    update orders
    set status = 'cancelled'
    where order_id = p_order_id
      and status <> 'delivered';

    -- delete payments for that order (defensive)
    delete from payments
    where order_id = p_order_id;

    raise notice 'order % cancelled (if it was not delivered)', p_order_id;
end;
$$;



