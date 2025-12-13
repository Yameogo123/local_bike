





select
    distinct
    category_id,
    category_name
from 
    {{ ref('stg__categories') }}
where category_id is not NULL

