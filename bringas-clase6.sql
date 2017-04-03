-- 1
SELECT first_name,last_name
FROM actor a1
WHERE EXISTS (SELECT last_name FROM actor a2 WHERE a2.last_name = a1.last_name AND a1.actor_id <> a2.actor_id)
ORDER BY last_name;

-- 2
SELECT first_name, last_name 
FROM actor a1 , film_actor f
WHERE a1.actor_id NOT IN (SELECT a1.actor_id FROM film_actor);

-- 3
SELECT c1.first_name, c1.last_name 
FROM customer c1
WHERE NOT EXISTS (SELECT r.customer_id FROM rental r,customer c2 WHERE c2.customer_id = r.customer_id 
						AND  c2.customer_id<>c1.customer_id );

	
-- 5
SELECT DISTINCT first_name, last_name 
FROM actor, film_actor, film 
WHERE film_actor.actor_id = actor.actor_id 
AND film_actor.film_id = film.film_id
AND (film.title = 'BETRAYED REAR' OR film.title = 'CATCH AMISTAD');

-- 6
SELECT DISTINCT first_name, last_name
FROM actor, film_actor, film 
WHERE film_actor.actor_id = actor.actor_id 
AND film_actor.film_id = film.film_id
AND film.title = 'BETRAYED REAR' AND film.title <> 'CATCH AMISTAD';

-- 7 
SELECT first_name, last_name 
FROM actor
WHERE actor.actor_id in (SELECT actor.actor_id from film_actor, film 
WHERE film_actor.actor_id = actor.actor_id 
AND film_actor.film_id = film.film_id
AND film.title = 'BETRAYED REAR'  )
AND actor.actor_id in (SELECT actor.actor_id from film_actor, film 
WHERE film_actor.actor_id = actor.actor_id 
AND film_actor.film_id = film.film_id
AND film.title = 'CATCH AMISTAD' );

-- 8
