SELECT f.title, f.special_feactures, f.rental_rate, c.name
FROM film f, film_category fc, category c
WHERE f.film_id = fc.film_id 
AND fc.category_id = c.category_id
ORDER BY f.rental_rate DESC, f.special_features ASC;

SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id > f2.film_id
ORDER BY 1;

-- ejercicio 1
SELECT title, special_features FROM film 
WHERE rating = 'PG-13';

-- ejercicio 2
SELECT DISTINCT f1.`length`
FROM film f1;

-- ejercicio 3
SELECT title, rental_rate, replacement_cost 
FROM film 
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- ejercicio 4
SELECT title, c.name, rating 
FROM film , film_category fc, category c  
WHERE fc.category_id = c.category_id 
AND film.film_id = fc.film_id
AND film.special_features LIKE '%Behind the Scenes';

-- ejercicio 5 
SELECT first_name, last_name 
FROM actor,film f, film_actor fa 
WHERE f.film_id = fa.film_id 
AND fa.actor_id = actor.actor_id
AND f.title = 'ZOOLANDER FICTION';

-- 6 
SELECT country, city, address 
FROM country, city , address, store
WHERE store.store_id = 1
AND store.address_id = address.address_id
AND city.city_id = address.city_id
AND country.country_id = city.country_id 
ORDER BY country.country, city.city;

-- 7
SELECT f1.title, f1.rating, f2.title
FROM film f1, film f2
WHERE f1.rating = f2.rating 
AND f1.film_id > f2.film_id;

-- 8
 


