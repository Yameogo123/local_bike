select 
    cust.customer_id as customer_id,
    --cust.customer_name as customer_name,
    o.store_id as store_id,
    o.store_name as store_name,
    o.order_status as order_status,
    --order_item.product_name as product_name,
    count(o.customer_id) as number_of_orders,
    sum(order_item.quantity) as total_quantity,
    sum(order_item.price) as total_spent,
    sum(case when order_item.discount > 0 and order_item.discount is not null then 1 else 0 end) as total_discount
from {{ ref('interm__customers') }} cust
left join {{ ref('interm__orders') }} o on o.customer_id = cust.customer_id
left join {{ ref('interm__order_items') }} order_item on order_item.order_id = o.order_id
group by 
    cust.customer_id,
    --cust.customer_name,
    o.store_id,
    o.store_name,
    o.order_status
    --order_item.product_name

