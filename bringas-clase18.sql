CALL GetAllProducts(); 
CALL GetOfficeByCountry('USA');
CALL GetOfficeByCountry('France');
CALL CountOrderByStatus('Shipped',@total);
SELECT @total;
CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;
CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;
SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
