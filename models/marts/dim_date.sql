SELECT 
        TO_CHAR(d, 'YYYYMMDD')::INT AS date_id, 
        d AS order_date, 
        EXTRACT(day FROM d)::INT AS day,
        EXTRACT(month FROM d)::INT AS month, 
        EXTRACT(year FROM d)::INT AS year,
        EXTRACT(isodow FROM d)::INT as day_of_week, 
        TRIM(TO_CHAR(d, 'Day')) AS day_name,
        EXTRACT(week FROM d)::INT AS week, 
        TRIM(TO_CHAR(d, 'Month')) AS month_name,
        EXTRACT(quarter FROM d)::INT AS quarter
    FROM GENERATE_SERIES(
        (SELECT min(order_date)::DATE FROM {{ref('stg_orders')}}),
        (SELECT MAX(order_date)::DATE FROM {{ref('stg_orders')}}),
        INTERVAL '1 day'
    ) AS gs(d)