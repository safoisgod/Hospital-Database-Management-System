-- since we will be updating/ making changes, lets remove safe mode
SET SQL_SAFE_UPDATES = 0;

-- CREATE EMAIL WITH FIRST NAME AND LAST NAME
-- EMAIL = first_name.last_name@fakecountry.gov

-- let's use selectfuntion 
SELECT
employee_name,
REPLACE(employee_name," ",".") AS email_prefix
FROM fict_md_water_services.employee;

-- we have  been able to create the prefix of the email
-- however we prefere the prefix to be lower case
-- let's repeat the same formula but add a lower function

SELECT
employee_name,
LOWER(REPLACE(employee_name," ",".")) AS email_begin
FROM fict_md_water_services.employee;

-- now, let's add the site address to the prefix
SELECT
employee_name,
CONCAT(LOWER(REPLACE(employee_name," ",".")),"@fakecountry.gov") AS email_full
FROM fict_md_water_services.employee;

-- the purpose of this whole query is to add an email column to the original table
UPDATE fict_md_water_services.employee
SET email = CONCAT(LOWER(REPLACE(employee_name," ",".")),"@fakecountry.gov");

SELECT *
FROM fict_md_water_services.employee;
