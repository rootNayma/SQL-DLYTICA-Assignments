/* 1. **`sp_apply_category_discount(p_category TEXT, p_percent NUMERIC)`**
    - Reduce `unit_price` of **active** products in a category 
	  by `p_percent` (e.g., 10 = 10%). 
	  Prevent negative or zero prices using a `CHECK` at update time.  */



create or replace procedure sp_apply_category_discount_all( p_category TEXT, p_percent NUMERIC
)
language plpgsql
as $$

begin
update products_copy_for_procedure_assignment
set unit_price = unit_price * (1 - p_percent / 100.0)
where category = p_category
and unit_price * (1 - p_percent / 100.0) > 0;  -- still prevents 0 or negative

raise notice 'Discount of %%% applied to category % (including inactive products)', p_percent, p_category;
end;
$$;

call sp_apply_category_discount_all('Electronics', 10);
select * from products_copy_for_procedure_assignment;
select * from products;
