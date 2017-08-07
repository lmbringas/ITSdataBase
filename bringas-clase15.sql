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


-- 3 
SELECT name, SUM(amount) FROM category 
INNER JOIN film_category USING(category_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY name;

-- 4 
SELECT actor_id, first_name, last_name, SUM(amount) FROM actor 
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3;

-- Analyze view actor_info, explain the entire query and specially how the sub query works.
-- Be very specific, take some time and decompose each part and give an explanation for each. 
-- 5
-- Muestra cada actor con su correspondientes categorias en las peliculas en las cual actuo 
-- id nombre apellido Genero: Pelicula 

-- 6 
-- A materialized view is a replica of a target master from a single point in time. 
-- The master can be either a master table at a master site or a master materialized view at a materialized view site.
-- Whereas in multimaster replication tables are continuously updated by other master sites, materialized views are updated from one or more masters through individual batch updates,
-- known as a refreshes, from a single master site or master materialized view site
-- You can use materialized views to achieve one or more of the following goals:
--    *Ease Network Loads
--    *Create a Mass Deployment Environment
--    *Enable Data Subsetting
 --   *Enable Disconnected Computing
