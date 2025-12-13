


select
    product_id,
    product_name,
    brand.brand_name as brand_name,
    cat.category_name as category_name,
    model_year,
    list_price
from 
    {{ ref('stg__products') }} product
left join {{ ref('interm__brand') }} brand on brand.brand_id = product.brand_id
left join {{ ref('interm__categories') }} cat on cat.category_id = product.category_id
where product_id is not null
