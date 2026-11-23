\set ON_ERROR_STOP on
\encoding UTF8

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE IF NOT EXISTS bronze.categories (
    categoryid INT,
    categoryname VARCHAR(25),
    description VARCHAR(255),
    _source_file TEXT DEFAULT 'categories.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.products (
    productid INT,
    productname VARCHAR(50),
    supplierid INT,
    categoryid INT,
    unit VARCHAR(25),
    price DECIMAL(10,2),
    _source_file TEXT DEFAULT 'products.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.suppliers (
    supplierid INT,
    suppliername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(20),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(15),
    _source_file TEXT DEFAULT 'suppliers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.orderdetails (
    orderdetailid INT,
    orderid INT,
    productid INT,
    quantity INT,
    _source_file TEXT DEFAULT 'orderdetails.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.orders (
    orderid INT,
    customerid INT,
    employeeid INT,
    orderdate TIMESTAMP,
    shipperid INT,
    _source_file TEXT DEFAULT 'orders.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.shippers (
    shipperid INT,
    shippername VARCHAR(25),
    phone VARCHAR(15),
    _source_file TEXT DEFAULT 'shippers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.employees (
    employeeid INT,
    lastname VARCHAR(15),
    firstname VARCHAR(15),
    birthdate TIMESTAMP,
    photo VARCHAR(25),
    notes TEXT,
    _source_file TEXT DEFAULT 'employees.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS bronze.customers (
    customerid INT,
    customername VARCHAR(50),
    contactname VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(20),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    _source_file TEXT DEFAULT 'customers.csv',
    _loaded_at TIMESTAMPTZ DEFAULT now()
);

-- psql -h localhost -U postgres -d northwind_dbt -f ingestion.sql

BEGIN;

TRUNCATE bronze.products, bronze.categories, bronze.suppliers, bronze.orderdetails, bronze.orders, bronze.shippers,
bronze.employees, bronze.customers;

\COPY bronze.products (productid, productname, supplierid, categoryid, unit, price) FROM 'data/products.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')
\COPY bronze.categories (categoryid, categoryname, description) FROM 'data/categories.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')
\COPY bronze.suppliers (supplierid, suppliername, contactname, address, city, postalcode, country, phone) FROM 'data/suppliers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')
\COPY bronze.shippers (shipperid, shippername, phone) FROM 'data/shippers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')
\COPY bronze.employees (employeeid, lastname, firstname, birthdate, photo, notes) FROM 'data/employees.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')
\COPY bronze.customers (customerid, customername, contactname, address, city, postalcode, country) FROM 'data/customers.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ';')

COMMIT;