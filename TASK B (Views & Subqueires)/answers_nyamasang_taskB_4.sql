/* 4. **Customers Without Delivered Orders**
   - Using `NOT EXISTS`, 
   list customers who have **no orders** with status `delivered`. */



select c.customer_id, c.full_name
from customers c
where not exists (
  select *
  from orders o
  where o.customer_id = c.customer_id
    and o.status = 'delivered'
);


select * from customers;