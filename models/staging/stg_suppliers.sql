SELECT 
    supplierid AS supplier_id,
    suppliername AS supplier_name,
    contactname AS contact_name,
    address AS supplier_address,
    city AS supplier_city,
    postalcode AS supplier_postal_code,
    country AS supplier_country,
    phone AS supplier_phone
    FROM {{source('bronze','suppliers')}}