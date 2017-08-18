call test_mysql_loop();
SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

-- 1 
SELECT COUNT(*) FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN store USING(store_id)
WHERE store_id = 2
AND (film_id = 3  OR title LIKE "Coma Head");


CREATE FUNCTION GetCountFilm(p_storeId INTEGER, p_filmId INTEGER, p_title VARCHAR(20)) RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE total INTEGER;
    SET total = (SELECT COUNT(film_id) FROM film
		INNER JOIN inventory USING(film_id)
		INNER JOIN store USING(store_id)
		WHERE store_id = p_storeId
			AND film_id = p_filmId 
			AND title LIKE p_title);
    RETURN (total);
  END
  


SELECT GetCountFilm(2,0,"Coma Head");

-- 2 
-- Write a stored procedure that returns a list of customer first and last names separated by ";", 
-- that live in a certain country. You pass the country it gives you the list of people living there.
SELECT GROUP_CONCAT(first_name, " " ,last_name SEPARATOR "; ") FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id);
	
CALL GetListCustomer("Argentina", @p_customerList);
SELECT @p_customerList;

CREATE DEFINER=`root`@`%` PROCEDURE `sakila`.`GetListCustomer`(
    IN  p_countryName VARCHAR(24),
    OUT p_customerList  TEXT
)
BEGIN
   SELECT GROUP_CONCAT(first_name, " " ,last_name SEPARATOR "; ") INTO p_customerList FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
	WHERE country = p_countryName;
END

set @List = "";
CALL GetListCustomer("Argentina", @List);
SELECT @List;


-- 3 
-- es una funcion que le pasas el id de inventory y retorna true si existe
SELECT inventory_in_stock(2);


-- es un procedure tiene como entrada id de un film y un id de un tienda y out que va ser la cantidad de row que devolvio
-- el select sin contar limit 
CALL film_in_stock(1,1,@outr);
SELECT @outr