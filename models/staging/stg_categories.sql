SELECT 
    categoryid AS category_id,
    categoryname AS category_name,
    description
    FROM {{source('bronze', 'categories')}}