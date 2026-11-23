{{ config(
    indexes=[
        {'columns': ['product_id']},
        {'columns': ['customer_id']},
        {'columns': ['employee_id']},
        {'columns': ['shipper_id']},
        {'columns': ['date_id']},
        {'columns': ['time_id']}
    ]
) }}


SELECT 
    o.order_id AS order_id,
    TO_CHAR(o.order_date, 'YYYYMMDD')::INT AS date_id,
    TO_CHAR(o.order_date, 'HH24MISS')::INT AS time_id,
    dp.product_id AS product_id,
    dc.customer_id AS customer_id,
    de.employee_id AS employee_id,
    ds.shipper_id AS shipper_id,
    od.quantity AS quantity,
    p.product_unit AS product_unit,
    p.product_price AS product_price
    FROM {{ref('stg_orders')}} o
    JOIN {{ref('stg_orderdetails')}} od ON o.order_id = od.order_id
    JOIN {{ref('stg_products')}} p ON od.product_id = p.product_id
    JOIN {{ref('dim_product')}} dp ON od.product_id = dp.product_id
    JOIN {{ref('dim_customer')}} dc ON o.customer_id = dc.customer_id
    JOIN {{ref('dim_employee')}} de ON o.employee_id = de.employee_id
    JOIN {{ref('dim_shipper')}} ds ON o.shipper_id = ds.shipper_id
