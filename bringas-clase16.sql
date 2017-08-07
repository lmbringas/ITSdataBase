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
   ADD CONSTRAINT myCheckAge CHECK(age > 16) ; -- this doesnt work
 ALTER TABLE employees
   ADD CONSTRAINT myCheckAgee CHECK(age <70 ); -- same 
   
ALTER TABLE employees CONSTRAINT CheckAge CHECK(age BETWEEN 16 and 70); -- get error 
-- i dont wanna write a trigger 
insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`, age) values 
(009,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President', 15);


