
{% docs interm__customers %}

this is the description

### Key Fields:
- **customer_id**: User identifier.
- **customer_name**: `first_name` and `last_name` concatenation
- **customer_phone**: Telephone
- **customer_email**: Email
- **customer_street**: Street
- **customer_city**: City
- **customer_state**: State

{% enddocs %}


{% docs intermediate_models %}

# Intermediate Models Documentation

## Purpose
Intermediate models serve as the bridge between staging and mart layers in the data warehouse. They perform essential transformations and join operations to create denormalized, business-ready datasets.

## Common Transformations:
1. **Data Cleaning**: Standardizing formats, handling nulls
2. **Joins**: Combining related tables for complete business entities
3. **Calculations**: Computing derived metrics (e.g., calculated prices)
4. **Renaming**: Standardizing column names across the data warehouse
5. **Aggregations**: Basic summarization where appropriate

## Naming Convention:
- `interm__` prefix indicates intermediate layer models
- Follows source table names for traceability
- Uses plural form for consistency

## Usage Guidelines:
- Intermediate models should be used as sources for mart models
- Avoid direct querying from reporting tools
- Each intermediate model should have clear business purpose
- Document all transformations and assumptions

{% enddocs %}



{% docs interm__order_items %}

Intermediate table containing order item details with calculated price.

### Key Fields:
- **order_id**: Order identifier
- **item_id**: Item identifier within the order
- **customer_id**: Customer who placed the order
- **product_name**: Name of the ordered product
- **quantity**: Number of units ordered
- **price**: Calculated price (quantity x list_price x (1 - discount))

### Transformation Notes:
- Price is calculated by multiplying quantity by list_price and applying discount
- Contains denormalized product name for easier analysis
- Links to customers, orders, and products

{% enddocs %}

{% docs interm__orders %}

Intermediate table containing enriched order information with customer and store details.

### Key Fields:
- **order_id**: Order identifier
- **customer_id**: Customer identifier
- **customer_name**: Full customer name
- **customer_street**: Customer street address
- **customer_city**: Customer city
- **customer_state**: Customer state
- **order_status**: Status of the order
- **order_date**: Date when order was placed
- **required_date**: Date when order is required
- **shipped_date**: Date when order was shipped
- **store_name**: Name of the store processing the order
- **store_street**: Store street address
- **store_city**: Store city
- **store_state**: Store state
- **staff_id**: Staff member handling the order

### Transformation Notes:
- Combines order data with customer and store information
- Includes complete customer and store addresses
- Contains order timeline dates for tracking

{% enddocs %}

{% docs interm__staffs %}

Intermediate table containing staff information with manager and store details.

### Key Fields:
- **staff_id**: Staff identifier
- **staff_name**: Full staff name (first + last)
- **staff_email**: Staff email address
- **staff_phone**: Staff phone number
- **staff_active**: Staff active status
- **staff_store_address**: Formatted store address for staff's store
- **manager_name**: Full manager name (first + last)
- **manager_email**: Manager email address
- **manager_phone**: Manager phone number
- **manager_active**: Manager active status
- **manager_store_address**: Formatted store address for manager's store

### Transformation Notes:
- Concatenates first and last names for staff and managers
- Creates formatted store addresses for easy readability
- Includes self-join to manager information
- Contains both staff and manager contact details

{% enddocs %}

{% docs interm__stores %}

Intermediate table containing store contact and location information.

### Key Fields:
- **store_id**: Store identifier
- **store_name**: Store name
- **store_phone**: Store phone number
- **store_email**: Store email address
- **store_street**: Store street address
- **store_city**: Store city
- **store_state**: Store state
- **zip_code**: Store ZIP code

### Transformation Notes:
- Standardizes store address field names
- Contains complete contact information for stores

{% enddocs %}

{% docs interm__brands %}

Intermediate table containing product brand information.

### Key Fields:
- **brand_id**: Brand identifier
- **brand_name**: Brand name

### Transformation Notes:
- Simple dimension table for product brands
- Used for product categorization and filtering

{% enddocs %}

{% docs interm__categories %}

Intermediate table containing product category information.

### Key Fields:
- **category_id**: Category identifier
- **category_name**: Category name

### Transformation Notes:
- Simple dimension table for product categories
- Used for product categorization and filtering

{% enddocs %}

{% docs interm__products %}

Intermediate table containing enriched product information with brand and category details.

### Key Fields:
- **product_id**: Product identifier
- **product_name**: Product name
- **brand_name**: Brand name
- **category_name**: Category name
- **model_year**: Product model year
- **list_price**: Product list price

### Transformation Notes:
- Denormalizes brand and category names for easier querying
- Combines product data with brand and category information
- Contains product pricing and model information

{% enddocs %}