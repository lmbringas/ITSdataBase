CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);


insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 

(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),

(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),

(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
    
SELECT 
    *
FROM
    employees_audit;
    
SELECT 
    *
FROM
    employees;

-- 1 
insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800', NULL,'1',NULL,'President');
-- you get an error SQL Error [1048] [23000]: Column 'email' cannot be null

-- 2 cuando le sumas la clave primaria se pisa y por el constraint va tirar error
 UPDATE employees set employeeNumber = employeeNumber - 20;
 UPDATE employees set employeeNumber = employeeNumber + 20;
 
 -- 3
 ALTER TABLE employees ADD age INT;
 ALTER TABLE employees
   ADD CONSTRAINT myCheckAge CHECK(age > 16) ; -- no funciona
 ALTER TABLE employees
   ADD CONSTRAINT myCheckAgee CHECK(age <70 ); -- tampoco funciona
   
ALTER TABLE employees CONSTRAINT CheckAge CHECK(age BETWEEN 16 and 70); -- get error 
-- no quiero escribir un trigger
insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`, age) values 
(009,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President', 15);

-- 5
ALTER TABLE employees_audit ADD lastUpdate DATETIME DEFAULT NULL;
ALTER TABLE employees_audit ADD lastUpdateUser VARCHAR(32) DEFAULT  "";
DELIMITER $$
CREATE TRIGGER employee_lastUpdate 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
    employeeNumber = OLD.employeeNumber,
    lastname = OLD.lastname,
    lastUpdateUser = SELECT CURRENT_USER()
    lastUpdate = NOW();
     
END$$
DELIMITER ;
DESCRIBE employees_audit;
-- 6  
-- ins_film inserta un nuevo film_text
-- upd_film hace un update a un film_text ya existente
-- del_film elimina un el film_text
