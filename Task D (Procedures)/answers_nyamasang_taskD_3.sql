/* 3. **`sp_reprice_stale_products(p_days INT, p_increase NUMERIC)`**
    - For products **not ordered** in the 
	last `p_days`, increase `unit_price` by `p_increase` percent. */


create table products2_copy_for_procedure_assignment as
table products
with data;


create or replace procedure sp_reprice_stale_products(p_days int, p_increase numeric)
language plpgsql
as $$
begin
    update products2_copy_for_procedure_assignment p
    set unit_price = unit_price * (1 + p_increase / 100.0)
    where not exists (
        select 1
        from orders o
        join order_items oi on o.order_id = oi.order_id
        where oi.product_id = p.product_id
        and o.order_date >= current_date - p_days
    );

    raise notice 'increased price of stale products by % percent', p_increase;
end;
$$;

call sp_reprice_stale_products(30, 5);
