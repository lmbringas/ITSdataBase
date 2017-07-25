-- 1
SELECT CONCAT_WS(" ",customer.first_name,customer.last_name) FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE country.country = "Argentina";

-- 2
SELECT film.title, `language`.name,
case film.rating 
WHEN "G" THEN "G (General Audiences) – All Ages Are Admitted."
WHEN "PG" THEN "PG (Parental Guidance Suggested) – Some Material May Not Be Suitable For Children."
WHEN "PG-13" THEN "PG-13 (Parents Strongly Cautioned) – Some Material May Be Inappropriate For Children Under 13."
WHEN "R" THEN "R Restricted) – Under 17 Requires Accompanying Parent Or Adult Guardian."
WHEN "NC-17" THEN "NC-17 (Adults Only) – No One 17 and Under Admitted"
END AS "Rating"
FROM film 
INNER JOIN `language` USING(language_id) ;

-- 3
SELECT title, release_year FROM film 
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("  AsD Bde "));

-- 4 
SELECT film.title,
CONCAT_WS(" ", customer.first_name, customer.last_name) as full_name,
CASE WHEN rental.return_date IS NOT NULL THEN 'Yes'
ELSE 'No' END AS "Fue retornado",
MONTHNAME(rental.rental_date) as month FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May' OR MONTHNAME(rental.rental_date) LIKE 'June';

-- 5 
-- In many ways CAST and CONVERT are similar.   Both are used to convert data from one type to another.  
-- Thought their syntax is different, both functions are able to convert values from one formation to another.
-- Differences between CAST and CONVERT
-- CAST is part of the ANSI-SQL specification; whereas, CONVERT is not.  In fact, CONVERT is SQL implementation specific.
SELECT CAST(last_update AS DATE) as only_date FROM address;

SELECT CONVERT("2003-03-13", DATETIME);

-- 6 
