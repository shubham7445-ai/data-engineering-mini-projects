-- Create tables for Sales Analytics project

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into customers
INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Anita Sharma', 'West'),
(2, 'Rahul Verma', 'North'),
(3, 'Neha Patil', 'West'),
(4, 'Amit Singh', 'South'),
(5, 'Pooja Desai', 'East');

-- Insert sample data into products
INSERT INTO products (product_id, product_name, category) VALUES
(101, 'Wireless Mouse', 'Electronics'),
(102, 'Laptop Bag', 'Accessories'),
(103, 'USB Keyboard', 'Electronics'),
(104, 'Notebook', 'Stationery'),
(105, 'Gel Pen', 'Stationery');

-- Insert sample data into orders
INSERT INTO orders (order_id, order_date, customer_id, product_id, quantity, unit_price) VALUES
(1001, '2024-01-05', 1, 101, 2, 800),
(1002, '2024-01-07', 2, 102, 1, 1200),
(1003, '2024-02-10', 3, 103, 3, 600),
(1004, '2024-02-15', 4, 104, 5, 50),
(1005, '2024-03-01', 5, 105, 10, 20),
(1006, '2024-03-08', 1, 102, 1, 1200),
(1007, '2024-03-10', 3, 101, 1, 800),
(1008, '2024-04-01', 2, 104, 3, 50),
(1009, '2024-04-05', 4, 105, 6, 20),
(1010, '2024-04-12', 5, 103, 2, 600);
