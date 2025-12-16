
select 
    s.store_id,
    stf.staff_name,
    s.order_status,
    sum(number_of_orders) as number_of_orders,
    sum(total_quantity) as total_quantity,
    sum(total_spent) as total_spent,
    sum(total_discount) as total_discount
from {{ ref('mart__customers_orders') }} s
left join {{ ref('interm__staffs') }} stf on stf.store_id = s.store_id
group by
    store_id,
    stf.staff_name,
    order_status

