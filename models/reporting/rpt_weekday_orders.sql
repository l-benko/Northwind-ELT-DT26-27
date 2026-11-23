SELECT
    d.day_of_week,
    d.day_name,
    COUNT(DISTINCT f.order_id) AS order_count
FROM {{ ref('fact_orders') }} AS f
JOIN {{ ref('dim_date') }} AS d ON d.date_id = f.date_id
GROUP BY d.day_of_week, d.day_name
ORDER BY d.day_of_week