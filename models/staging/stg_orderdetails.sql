SELECT 
    orderdetailid AS order_detail_id,
    orderid AS order_id,
    productid AS product_id,
    quantity
    FROM {{source('bronze','orderdetails')}}