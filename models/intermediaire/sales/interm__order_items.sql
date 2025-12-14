

select 
    order_id,
    item_id,
    prod.product_name as product_name,
    quantity * list_price * (1-discount) as price
from 
    {{ ref('stg__order_items') }} ord_item
left join {{ ref('stg__products') }} prod as prod.product_id = ord_item.product_id
