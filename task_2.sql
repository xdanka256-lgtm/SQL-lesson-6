CREATE TABLE customers (
  id    INTEGER PRIMARY KEY,
  name  TEXT    NOT NULL,
  email TEXT    NOT NULL
);

INSERT INTO customers VALUES
  (1,'Alice','alice@mail.com'),
  (2,'Bob','bob@mail.com'),
  (3,'Carol','carol@mail.com'),
  (4,'Dan','dan@mail.com'),
  (5,'Eva','eva@mail.com'),
  (6,'Frank','frank@mail.com');
  
 CREATE TABLE orders (
  id          INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  product_id  INTEGER NOT NULL,
  quantity    INTEGER NOT NULL,
  order_date  TEXT    NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (product_id)  REFERENCES products(id)
);

INSERT INTO orders VALUES
  (1,1,3,2,'2024-01-05'),
  (2,1,7,1,'2024-01-18'),
  (3,2,1,3,'2024-02-02'),
  (4,2,10,1,'2024-02-14'),
  (5,3,5,2,'2024-03-01'),
  (6,4,2,1,'2024-03-15'),
  (7,4,8,4,'2024-03-22'),
  (8,1,4,1,'2024-04-10'),
  (9,5,6,2,'2024-04-18');
  
  CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  price REAL NOT NULL,
  category TEXT NOT NULL
);

INSERT INTO products VALUES
  (1,'Wireless Mouse',29.99,'Electronics'),
  (2,'USB-C Hub',49.99,'Electronics'),
  (3,'Notebook',5.99,'Stationery'),
  (4,'Gel Pen Set',8.49,'Stationery'),
  (5,'Desk Lamp',34.99,'Furniture'),
  (6,'Whiteboard',59.99,'Furniture'),
  (7,'Coffee Mug',12.99,'Kitchen'),
  (8,'Water Bottle',18.99,'Kitchen'),
  (9,'Backpack',74.99,'Bags'),
  (10,'Tote Bag',22.99,'Bags'),
  (11,'Keyboard',89.99,'Electronics');
  
SELECT 
	c.name AS customer,
	p.product_name AS customer_order
FROM orders AS o 
JOIN customers AS c
ON o.customer_id = c.id
JOIN products AS p 
ON o.product_id = p.id;

SELECT 
	p.product_name AS product,
	p.price AS price,
	c.name AS customer
FROM products AS p
JOIN orders AS o
ON o.product_id = p.id
JOIN customers AS c
ON o.customer_id = c.id
WHERE category = 'Electronics';

SELECT
	c.name AS customer,
	p.product_name AS product,
	o.quantity AS quantity
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = o.customer_id
LEFT JOIN products AS p 
ON o.product_id = p.id;

SELECT 
	p.product_name AS product,
	COUNT(o.id) AS quantity
FROM orders AS o 
JOIN products AS p 
ON o.product_id = p.id
GROUP BY product_name;

SELECT 
	c.name AS customer,
	SUM(p.price * o.quantity) AS spent
FROM customers AS c
JOIN orders AS o 
ON c.id = o.customer_id
JOIN products AS p 
ON o.product_id = p.id
GROUP BY c.id, c.name
ORDER BY spent DESC 
LIMIT 1;
