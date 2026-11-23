SELECT order_month, order_total FROM dbt_reporting.rpt_monthly_sales ORDER BY order_month ASC;

SELECT category_name, category_total, total_percent FROM dbt_reporting.rpt_category_share ORDER BY total_percent DESC;

SELECT customer_country, order_count FROM dbt_reporting.rpt_customer_orders ORDER BY order_count DESC;

SELECT product_name, units_ordered, order_count FROM dbt_reporting.rpt_top_products ORDER BY units_ordered ASC;

SELECT day_of_week, day_name, order_count FROM dbt_reporting.rpt_weekday_orders ORDER BY day_of_week ASC;