-- we want to know the number of employees living in each town
-- we can use COUNT and GROUPBY for this analysis

SELECT
	town_name,
    COUNT(employee_name) AS employee_count
FROM fict_md_water_services.employee
GROUP BY(town_name);

-- lets extract the data of the highest perfoming employess
-- we can extract that data from the VISITS table using COUNT and GROUP BY

SELECT 
    assigned_employee_id,
    COUNT(visit_count) AS total_visit
FROM fict_md_water_services.visits
GROUP BY (assigned_employee_id)
ORDER BY COUNT(visit_count) DESC
LIMIT 3;

-- ids (1, 30, 34)

-- now we can get details of these employees from the EMPLOYEE table
SELECT
	employee_name,
    phone_number,
    email
FROM fict_md_water_services.employee
WHERE assigned_employee_id IN (1,30,34)
-- this data can be sent to the Presido