SELECT 
    employeeid AS employee_id,
    lastname AS last_name,
    firstname AS first_name,
    birthdate AS birth_date,
    photo,
    notes
    FROM {{source('bronze','employees')}}