-- lets query for the towns with the most visits from the location table
SELECT 
	town_name,
    COUNT(address) AS records_per_town
FROM 
	fict_md_water_services.location
GROUP BY (town_name)
ORDER BY COUNT(address) DESC;

-- lets do same for the provinces
SELECT 
	province_name,
    COUNT(address) AS records_per_province
FROM 
	fict_md_water_services.location
GROUP BY (province_name)
ORDER BY COUNT(address) DESC;

-- lets Create a result set showing:
-- • province_name
-- • town_name
-- • An aggregated count of records for each town (consider naming this records_per_town).
-- • Ensure your data is grouped by both province_name and town_name.

SELECT 
    province_name,
    town_name,
    COUNT(address) as records_per_town
FROM 
	fict_md_water_services.location
GROUP BY province_name, town_name
ORDER BY province_name ASC, town_name DESC;

-- lets look at the number of records for each location type
SELECT
	location_type,
	COUNT(address)
FROM 
	fict_md_water_services.location
GROUP BY
	location_type;
 
 -- lets calculate the percentages to show a clearer data with a nested function
 SELECT
	location_type,
	ROUND((COUNT(address)/ (SELECT COUNT(address) FROM fict_md_water_services.location))*100) AS perc_of_sources
FROM 
	fict_md_water_services.location
GROUP BY
	location_type;
    
    