-- Add 3 new artists to the artist table using INSERT
INSERT INTO artist (name)
VALUES ('LIZZO'), ('mARC'), ('SIMON AND GARFUNKEL');

-- Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name LIMIT 5;

-- List all employee first and last names only that live in Calgary.
SELECT last_name, first_name FROM employee
WHERE city = 'Calgary';

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee
WHERE last_name = 'Edwards';

SELECT * FROM employee
WHERE reports_to = '2';

-- Count how many people live in Lethbridge.
SELECT COUNT (*) FROM employee 
WHERE city = 'Lethbridge';

-- Count how many orders were made from the USA.
SELECT COUNT (*) FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.
SELECT * FROM invoice
ORDER BY total DESC;

-- Find the smallest order total amount.
SELECT * FROM invoice
ORDER BY total ASC;

-- Find all orders bigger than $5.
SELECT * FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.
SELECT COUNT (*) FROM invoice
WHERE total < 5;

-- Get the total sum of the orders.
SELECT SUM(total) FROM invoice;

-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice
JOIN invoice_line
ON invoice_line.invoice_id = invoice.invoice_id
WHERE unit_price >.99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT invoice_date, first_name, last_name, total, customer.customer_id, invoice.customer_id
FROM customer
JOIN invoice
ON customer.customer_id = invoice.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
--Had serious trouble with this Q
CREATE TABLE orders (
 first_name 
 last_name 
 PRIMARY KEY employee_id
 FOREIGN KEY support_rep_id REFERENCES customers);

-- Get the album title and the artist name from all albums.
SELECT title, name, album.artist_id, artist.artist_id
FROM album
JOIN artist
ON album.artist_id = artist.artist_id;

--EXTRA CREDIT
