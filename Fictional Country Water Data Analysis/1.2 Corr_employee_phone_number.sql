-- the employee phone number should be 12 characters
-- however it is 13 when we use the len function

SELECT
	employee_name,
	phone_number,
	LENGTH(phone_number) AS phone_number_length
FROM fict_md_water_services.employee;

-- the issue comes from a whitespace after the last digit
-- we can remove it by using TRIM function
SELECT
	employee_name,
	phone_number,
	LENGTH(phone_number) AS phone_number_length,
    TRIM(phone_number) AS trimmed_phone_number,
    LENGTH(TRIM(phone_number)) AS trimmed_phone_number_length
FROM fict_md_water_services.employee;

-- lets update the table now
UPDATE fict_md_water_services.employee
SET phone_number = TRIM(phone_number);

-- lets repeat the length function to check if the correction has been made
SELECT
	employee_name,
	phone_number,
	LENGTH(phone_number) AS phone_number_length
FROM fict_md_water_services.employee;
