


select
    order_id,
    c.customer_id,
    customer_name,
    customer_street,
    customer_city,
    customer_state,
    order_status,
    order_date,
    required_date, 
    shipped_date,
    o.store_id as store_id,
    store_name,
    store_street,
    store_city,
    store_state,
    cast(staff_id as string) as staff_id
from 
    {{ ref('stg__orders') }} o
left join {{ ref('interm__customers') }} c on c.customer_id = o.customer_id
left join {{ ref('interm__stores') }} s on s.store_id = o.store_id