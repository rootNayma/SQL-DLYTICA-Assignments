/*2. **Share of Basket per Item**
   - For each order, compute each item's **revenue share** in that order:
     `item_revenue / order_total` using `SUM() OVER (PARTITION BY order_id)`.*/


select order_id, product_id, quantity, unit_price, (quantity*unit_price) AS item_revenue,
sum (quantity*unit_price) over (partition by order_id) as order_total,
(quantity*unit_price) / sum (quantity*unit_price) over (partition by order_id) as share
from order_items
;


SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM customers;
select * from payments;
select * from products;