SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
						FROM payment
						WHERE amount BETWEEN 3 AND 4);

SELECT DISTINCT first_name 
FROM customer, payment
WHERE customer.customer_id = payment.customer_id
AND payment.amount = 0.99
AND first_name LIKE ('W%')
ORDER BY first_name;

SELECT first_name 
FROM customer
WHERE customer_id IN (SELECT customer_id 
						FROM payment 
						WHERE amount = 0.99)
AND first_name LIKE ('W%')
ORDER BY first_name;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount = 0.99)
AND customer_id NOT IN (SELECT customer_id FROM payment WHERE amount = 1.99)
AND first_name LIKE ('W%');

SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT * FROM customer c2 WHERE c1.first_name=c2.first_name);

-- buscar gente mismo nombre
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT * FROM customer c2 WHERE c1.first_name=c2.first_name AND c1.customer_id <> c2.customer_id)
ORDER BY c1.first_name;

SELECT title, `length`
FROM film f1
WHERE NOT EXISTS (SELECT * FROM film f2 WHERE f2.`length` > f1.`length` )

SELECT title, `length` , film_id
FROM film 
WHERE `length` >= ALL (SELECT `length` FROM film); 

UPDATE film SET `length` = 200 WHERE film_id = 182;

SELECT title, `length` , film_id
FROM film f1
WHERE `length` >= ALL (SELECT `length` FROM film f2 WHERE f2.film_id <> f1.film_id);
