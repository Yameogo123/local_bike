with customer_products as (

    select distinct
        customer_id,
        product_name
    from {{ ref('interm__order_items') }}

),

overlap as (

    select
        a.customer_id as customer1,
        b.customer_id as customer2,
        count(distinct a.product_name) as shared_products
    from customer_products a
    join customer_products b on a.product_name = b.product_name and a.customer_id < b.customer_id
    group by 
        a.customer_id,
        b.customer_id
),

product_counts as (

    select
        customer_id,
        count(distinct product_name) as total_products
    from customer_products
    group by
        customer_id

),

simi as (
    select
        o.customer1,
        o.customer2,
        o.shared_products as common_order_number,
        o.shared_products * 1.0 / (pc1.total_products + pc2.total_products - o.shared_products) as similarity,
        RANK() OVER (
            PARTITION BY o.customer1 
            ORDER BY o.shared_products * 1.0 / (pc1.total_products + pc2.total_products - o.shared_products)  
            DESC
        ) as rank
    from overlap o
    join product_counts pc1 on o.customer1 = pc1.customer_id
    join product_counts pc2 on o.customer2 = pc2.customer_id
)

select 
    a.customer1,
    a.customer2,
    a.similarity
    -- ,a.rank
from simi a 
where a.rank <= 5


