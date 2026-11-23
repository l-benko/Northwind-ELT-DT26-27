SELECT
    DATE_TRUNC('month', d.order_date)::DATE AS order_month,
    COUNT(DISTINCT f.order_id) AS order_count,
    SUM(f.quantity) AS units_ordered,
    ROUND(SUM(f.quantity * f.product_price)::NUMERIC, 2) AS order_total
FROM {{ ref('fact_orders') }} AS f
JOIN {{ ref('dim_date') }} AS d ON d.date_id = f.date_id
GROUP BY DATE_TRUNC('month', d.order_date)::DATE
ORDER BY order_month
