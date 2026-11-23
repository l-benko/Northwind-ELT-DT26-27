SELECT
    p.product_name,
    SUM(f.quantity) AS units_ordered,
    COUNT(DISTINCT f.order_id) AS order_count
FROM {{ ref('fact_orders') }} AS f
JOIN {{ ref('dim_product') }} AS p ON p.product_id = f.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_ordered DESC, p.product_name
LIMIT 10