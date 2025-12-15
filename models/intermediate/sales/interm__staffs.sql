


select 
    staff.staff_id as staff_id,
    concat(staff.first_name, ' ', staff.last_name) as staff_name,
    staff.email as staff_email,
    staff.phone as staff_phone,
    staff.active as staff_active,
    concat(store.store_name, ', ', store.store_city, ' (', store.store_state, ')') as staff_store_adresss,
    concat(manager.first_name, ' ', manager.last_name) as manager_name,
    manager.email as manager_email,
    manager.phone as manager_phone,
    manager.active as manager_active,
    concat(store2.store_name, ', ', store2.store_city, ' (', store2.store_state, ')') as manager_store_adresss
from 
    {{ ref('stg__staffs') }} staff
left join {{ ref('stg__staffs') }} manager on manager.manager_id = cast(staff.staff_id as string) 
left join {{ ref('interm__stores') }} store on store.store_id = staff.store_id
left join {{ ref('interm__stores') }} store2 on store2.store_id = manager.store_id
