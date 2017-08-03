select * FROM customers;
CREATE INDEX postalCode ON customers(postalCode);

SELECT * FROM products;

ALTER TABLE products  
ADD FULLTEXT(productLine);

SELECT  productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

SELECT productName, productline
FROM products
WHERE MATCH(productline) 
AGAINST('Classic,Vintage' IN NATURAL LANGUAGE MODE);


ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('1932,Ford');

SELECT productName, productline FROM products where productName LIKE "%1932%";

-- 1
SELECT * from address 
WHERE postal_code IN (SELECT postal_code from address AS ad WHERE ad.postal_code like "%515%");

CREATE INDEX address_code ON address(postal_code);

-- 2 last_name deberia ser mas performante por que tiene un indice
SELECT first_name FROM actor WHERE first_name LIKE "%grace%";
SELECT last_name FROM actor WHERE last_name LIKE "%crowe%";

-- 3 
ALTER TABLE film_text
ADD FULLTEXT(description);


SELECT description
FROM film_text
WHERE description like '%Epic%';

SELECT description
FROM film_text
WHERE MATCH(description) AGAINST('Epic');



