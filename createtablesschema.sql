---------------------table1:customer-----------------
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address TEXT,
    email TEXT,
    phone_number VARCHAR(20)
);

-------------table2:suppliers----------------
CREATE TABLE suppliers(
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_name VARCHAR(50),
    address TEXT,
    phone_number VARCHAR(50),
    email TEXT
);

-------------table3:orders-------------------
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-------------table4:shipments-------------
CREATE TABLE shipments(
    shipment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATE,
    carrier VARCHAR(20),
    tracking_number TEXT,
    delivery_date DATE,
    shipment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

----------------table5:payment-------------
CREATE TABLE payment(
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

---------------table6:products------------------
CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

------------table7:order_items----------------
CREATE TABLE order_items(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    price_at_purchase DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--------------------table8:reviews-------------------
CREATE TABLE reviews(
    review_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT,
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);