CREATE TABLE film(
	film_id INTEGER NOT NULL AUTO_INCREMENT,
	title VARCHAR(255),
	desciption VARCHAR(255) ,
	release_year DATE,
	CONSTRAINT film_pk PRIMARY KEY (film_id) 
);

CREATE TABLE actor(
	actor_id INTEGER NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(32),
	last_name VARCHAR(32),
	CONSTRAINT actor_pk PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor(
	film_actor PRIMARY KEY,
	actor_id INTEGER NOT NULL ,
	film_id INTEGER NOT NULL 
);

ALTER TABLE film ADD last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE actor ADD last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ;
ALTER TABLE film_actor ADD CONSTRAINT fk_film_actor FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE film_actor ADD CONSTRAINT fk_actor_film FOREIGN KEY (actor_id) REFERENCES actor(actor_id);

INSERT INTO imdb.actor
(first_name, last_name, last_update)
VALUES('will', 'smith', CURRENT_TIMESTAMP);

INSERT INTO imdb.film
(title, desciption, release_year, last_update)
VALUES('Yo robot', 'Es una pelicula donde los robots se revelan', '2005-07-09', CURRENT_TIMESTAMP);

INSERT INTO imdb.film_actor
(actor_id, film_id)
VALUES(1, 1);

