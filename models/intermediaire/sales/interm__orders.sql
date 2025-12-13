


select
    order_id,
    customer_name,
    customer_street,
    customer_city,
    customer_state,
    order_status,
    order_date,
    required_date, 
    shipped_date,
    store_name,
    store_street,
    store_city,
    store_state,
    staff_id
from 
    {{ ref('stg__orders') }} o
left join {{ ref('interm__customers') }} c on c.customer_id = o.customer_id
left join {{ ref('interm__stores') }} s on s.store_id = o.store_id