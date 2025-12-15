



select
    distinct
    brand_id,
    brand_name
from 
    {{ ref('stg__brands') }}
where brand_id is NOT NULL
