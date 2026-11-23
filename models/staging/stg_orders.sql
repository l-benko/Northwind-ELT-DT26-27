SELECT 
    orderid AS order_id,
    customerid AS customer_id,
    employeeid AS employee_id,
    orderdate AS order_date,
    shipperid AS shipper_id
    FROM {{source('bronze','orders')}}