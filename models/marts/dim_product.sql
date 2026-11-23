SELECT 
    p.product_id AS product_id,
    p.product_name AS product_name,
    s.supplier_name AS supplier_name,
    s.contact_name AS contact_name,
    s.supplier_address AS supplier_address,
    s.supplier_city AS supplier_city,
    s.supplier_country AS supplier_country,
    c.category_name AS category_name
    FROM {{ref('stg_products')}} p
    JOIN {{ref('stg_suppliers')}} s ON p.supplier_id = s.supplier_id
    JOIN {{ref('stg_categories')}} c ON p.category_id = c.category_id