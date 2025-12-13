

select 
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
from 
    {{ ref('stg__order_items') }}

