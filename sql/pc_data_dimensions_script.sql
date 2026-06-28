CREATE SCHEMA dwh_pc_data;

CREATE SCHEMA stg_pc_data;

-- 1. dim_customer

CREATE TABLE If NOT EXISTS dwh_pc_data.dim_customer (

customer_id INTEGER PRIMARY KEY,
name VARCHAR,
surname VARCHAR,
number VARCHAR, 
email VARCHAR, 
credit_score INTEGER

);

--2. dim_location

CREATE TABLE dwh_pc_data.dim_location (

location_id INTEGER PRIMARY KEY,
continent VARCHAR, 
"country/state" VARCHAR,
"city/province" VARCHAR, 

);

--3. dim_payment

CREATE TABLE dwh_pc_data.dim_payment (

payment_id INTEGER PRIMARY KEY,
payment_type VARCHAR

);

--4. dim_shipping_priority

CREATE TABLE dwh_pc_data.dim_shipping_priority (

priority_id INTEGER PRIMARY KEY,
priority_type VARCHAR,

); 

DROP TABLE dwh_pc_data.dim_shipping_priority;

--4. dim_shipping_priority

CREATE TABLE dwh_pc_data.dim_shipping_priority (

priority_id INTEGER PRIMARY KEY,
priority_type VARCHAR,
);


--5. dim_sales

CREATE TABLE dwh_pc_data.dim_sales (

sales_id INTEGER PRIMARY KEY,
sales_person_name VARCHAR,
sales_person_department VARCHAR

);

--6 dim_specifications

CREATE TABLE dwh_pc_data.dim_specifications (

specifications_id INTEGER PRIMARY KEY,
make VARCHAR,
model VARCHAR,
storage_capacity VARCHAR,
storage_type VARCHAR,
RAM VARCHAR

);

--7 dim_shop

CREATE TABLE dwh_pc_data.dim_shop (

shop_id INTEGER PRIMARY KEY,
name VARCHAR,
age VARCHAR

);

--8 dim_fact_table

CREATE TABLE dwh_pc_data.dim_fact_table (

fact_id           INTEGER PRIMARY KEY,
customer_id       INTEGER REFERENCES dwh_pc_data.dim_customer(customer_id),
location_id       INTEGER REFERENCES dwh_pc_data.dim_location(location_id),
payment_id        INTEGER REFERENCES dwh_pc_data.dim_payment(payment_id),
priority_id       INTEGER REFERENCES dwh_pc_data.dim_shipping_priority(priority_id),
specifications_id INTEGER REFERENCES dwh_pc_data.dim_specifications(specifications_id),
shop_id           INTEGER REFERENCES dwh_pc_data.dim_shop(shop_id),
sales_id          INTEGER REFERENCES dwh_pc_data.dim_sales(sales_id),
cost_price               DECIMAL(10,2),
cost_of_repairs          DECIMAL(10,2),
discount_amount          DECIMAL(10,2),
finance_amount           DECIMAL(10,2),
pc_market_price          DECIMAL(10,2),
purchase_price           DECIMAL(10,2),
total_sales_per_employee DECIMAL(10,2)
);
