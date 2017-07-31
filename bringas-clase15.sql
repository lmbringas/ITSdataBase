-- 1 
CREATE OR REPLACE VIEW list_of_customer AS
SELECT customer_id, CONCAT_WS(" ", first_name, last_name) AS 'Full name' , address, postal_code AS 'Zip code', city, country, store_id,
CASE active
	WHEN 1 THEN "Activo"
	WHEN 0 THEN "inactive"
ELSE 'inactive'
END AS "Status"
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
INNER JOIN store USING(store_id);

-- 2 

SELECT film_id, title, description, name, `length`, rental_rate, GROUP_CONCAT(actor.first_name, actor.last_name)  FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
GROUP BY 1, 4;

-- Create view sales_by_film_category, it should return 'category' and 'total_rental' columns.
-- 3 

