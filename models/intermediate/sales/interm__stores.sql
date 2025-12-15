

select 
    distinct
    store_id,
    store_name,
    phone as store_phone,
    email as store_email,
    street as store_street,
    city as store_city,
    state as store_state,
    zip_code
from 
    {{ ref('stg__stores') }}
where store_id is not NULL
