create database ecommerce_db;
use ecommerce_db;
create table customer(
customer_id int primary key,
name varchar(50),
city varchar(50)
);
create table products(
product_id int primary key,
product_name varchar(50),
price decimal(10,2)
);
create table orders (
order_id int primary key,
customer_id int,
product_id int,
amount decimal(10,2),
order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customer VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Bangalore'),
(4, 'Sneha', 'Lucknow');

INSERT INTO products VALUES
(101, 'Laptop', 50000),
(102, 'Phone', 20000),
(103, 'Headphones', 2000),
(104, 'Tablet', 30000);

INSERT INTO orders VALUES
(1, 1, 101, 50000, '2024-01-10'),
(2, 2, 102, 20000, '2024-01-12'),
(3, 1, 103, 2000, '2024-01-15'),
(4, 3, 104, 30000, '2024-01-18'),
(5, 4, 102, 20000, '2024-01-20'),
(6, 2, 101, 50000, '2024-01-22');

select * from products;
select * from customer;
SELECT * FROM orders
WHERE amount > 20000;


SELECT * FROM orders
ORDER BY amount DESC;


SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;


SELECT customer_id, AVG(amount) AS avg_spending
FROM orders
GROUP BY customer_id;


SELECT c.name, p.product_name, o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;


SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders WHERE amount > 30000
);



CREATE VIEW high_value_orders AS
SELECT * FROM orders
WHERE amount > 30000;


SELECT * FROM high_value_orders;

SELECT IFNULL(amount, 0) AS safe_amount
FROM orders;

CREATE INDEX idx_customer_id
ON orders(customer_id);




