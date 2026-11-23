WITH category_totals AS (
    SELECT
        dp.category_name,
        SUM(fo.quantity * fo.product_price) AS category_amount
    FROM {{ ref('fact_orders') }} fo
    JOIN {{ ref('dim_product') }} dp ON dp.product_id = fo.product_id
    GROUP BY dp.category_name
)
SELECT
    category_name,
    ROUND(category_amount, 2) AS category_total,
    ROUND(100.0 * category_amount / SUM(category_amount) OVER (), 2) AS total_percent
FROM category_totals
ORDER BY category_total DESC, category_name
