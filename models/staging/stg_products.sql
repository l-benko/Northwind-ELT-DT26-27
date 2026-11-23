SELECT 
    productid AS product_id,
    productname AS product_name,
    supplierid AS supplier_id,
    categoryid AS category_id,
    unit AS product_unit,
    price AS product_price
    FROM {{source('bronze','products')}}