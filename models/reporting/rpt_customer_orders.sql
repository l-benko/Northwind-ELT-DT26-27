SELECT
    c.customer_country,
    COUNT(DISTINCT f.order_id) AS order_count
FROM {{ ref('fact_orders') }} AS f
JOIN {{ ref('dim_customer') }} AS c ON c.customer_id = f.customer_id
GROUP BY c.customer_country
ORDER BY order_count DESC, c.customer_country