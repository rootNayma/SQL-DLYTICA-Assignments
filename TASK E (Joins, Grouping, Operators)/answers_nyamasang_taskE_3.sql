/* 3. **Set Ops: Overlapping Customers**
    - Split customers into two sets: those who bought `Electronics` and those who bought `Fitness`. Show:
      - `UNION` of both sets,
      - `INTERSECT` (bought both),
      - `EXCEPT` (bought Electronics but not Fitness). */


-- union
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'electronics'
)
union
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'fitness'
);









-- intersect 
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'electronics'
)
intersect
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'fitness'
);






-- except
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'electronics'
)
except
(
    select distinct o.customer_id
    from orders o
    join order_items oi on o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    where lower(p.category) = 'fitness'
);
