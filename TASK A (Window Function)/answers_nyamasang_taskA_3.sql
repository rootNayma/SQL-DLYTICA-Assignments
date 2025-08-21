/*3. **Time Between Orders (per Customer)**
   - Show days since the **previous order** for each customer 
   using `LAG(order_date)` and `AGE()`. */

select customer_id, order_date,
lag(order_date) over (partition by customer_id order by order_date) as previous_order,
age(order_date, lag(order_date) over(partition by customer_id order by order_date)) as differences
from orders;



