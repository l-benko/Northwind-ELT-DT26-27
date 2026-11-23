SELECT customer_id, customer_name, contact_name, customer_address, customer_city, customer_country
    FROM {{ref('stg_customers')}}