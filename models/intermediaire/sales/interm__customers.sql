





select
    distinct
    customer_id,
    first_name + ' ' + last_name as customer_name,
    phone as customer_phone, 
    email as customer_email,
    street as customer_street,
    city as customer_city,
    state as customer_state
from 
    {{ ref('stg__customers') }}
where 
    customer_id is not NULL

