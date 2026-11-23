SELECT 
    shipperid AS shipper_id,
    shippername AS shipper_name,
    phone AS shipper_phone
    FROM {{source('bronze','shippers')}}