/* 2. **Products Never Ordered**
   - Using a subquery, list products that **never** appear in `order_items`.
   */

select product_id, product_name
from products
where product_id not in (select  product_id from order_items);

-- there is nothing to return so its shwoing no any data