SELECT 
    customerid AS customer_id,
    customername AS customer_name,
    contactname AS contact_name,
    address AS customer_address,
    city AS customer_city,
    postalcode AS customer_postal_code,
    country AS customer_country
    FROM {{source('bronze','customers')}}