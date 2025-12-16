

select 
    ord_item.order_id,
    ord_item.item_id,
    o.customer_id,
    prod.category_id as category_id,
    prod.product_id as product_id,
    prod.product_name as product_name,
    ord_item.quantity as quantity,
    ord_item.discount as discount,
    ord_item.quantity * ord_item.list_price * (1- ord_item.discount) as price
from 
    {{ ref('stg__order_items') }} ord_item
left join {{ ref('stg__products') }} prod on prod.product_id = ord_item.product_id
left join {{ ref('interm__orders') }} o on o.order_id = ord_item.order_id