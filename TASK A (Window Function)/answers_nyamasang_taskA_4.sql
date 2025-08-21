/* 4. **Product Revenue Quartiles**
   - Compute total revenue per product and 
   assign **quartiles** using `NTILE(4)` over total revenue.  */

select product_id, sum (quantity*unit_price) as revenue,
NTILE(4) over(order by sum (quantity*unit_price)desc) as quartile
from order_items
group by product_id;


