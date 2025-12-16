select 
    customer_state,
    customer_city,
    count(*) as nb_customers_by_city_state
from {{ ref('interm__customers') }}
group by 
    customer_state,
    customer_city