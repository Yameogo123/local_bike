

select
    store.store_id as store_id,
    store.store_name as store_name,
    store.store_state as state,
    store.store_city as city,
    product.product_id as product_id,
    product.product_name as product_name
from
    {{ ref('stg__stocks') }} stock
left join {{ ref('interm__stores') }} store on store.store_id = stock.store_id
left join {{ ref('interm__products') }} product on product.product_id = stock.product_id