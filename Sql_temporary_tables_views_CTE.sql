USE sakila;

#Temporary Tables, Views, CTEs
#Creating a Customer Summary Report

#1. Create a View
CREATE VIEW customer_rental_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS email_address,
    COUNT(r.rental_id) AS rental_count
FROM
    customer c
LEFT JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email;


#2. Create a Temporary Table
CREATE TEMPORARY TABLE customer_payment_summary AS
SELECT
    p.customer_id,
    SUM(p.amount) AS total_amount_spent,
    COUNT(p.payment_id) AS total_payments
FROM
    payment p
GROUP BY
    p.customer_id;


#3. Create a CTE and the Customer Summary Report
CREATE VIEW customer_rental_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email AS email_address,
    COUNT(r.rental_id) AS rental_count
FROM
    customer c
LEFT JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id, customer_name, email_address;

