-- START A SOLUTION
-- lets rank the water_sources by population size

SELECT
	type_of_water_source,
    SUM(number_of_people_served) AS popn_served,
    RANK() OVER(ORDER BY SUM(number_of_people_served) DESC) AS "rank"
FROM
	fict_md_water_services.water_source
GROUP BY type_of_water_source;

-- which shared taps or wells should be fixed first? We can use...
-- the same logic; the most used sources should really be fixed first.

-- So create a query to do this, and keep these requirements in mind:
-- 1. The sources within each type should be assigned a rank.
-- 2. Limit the results to only improvable sources.
-- 3. Think about how to partition, filter and order the results set.
-- 4. Order the results to see the top of the list.

SELECT 
	source_id,
    type_of_water_source,
    number_of_people_served,
    RANK() OVER(PARTITION BY type_of_water_source ORDER BY number_of_people_served DESC) AS priority_rank
FROM
	fict_md_water_services.water_source;
    
-- lets try using the DENSE_RANK and notice the difference

SELECT 
	source_id,
    type_of_water_source,
    number_of_people_served,
    DENSE_RANK() OVER(PARTITION BY type_of_water_source ORDER BY number_of_people_served DESC) AS priority_rank
FROM
	fict_md_water_services.water_source;
-- dense rank, ranks in order but doses not skip the rank number
-- it looks clean but we will not be able to represent the dat completely and in totality as we might be able to shown the actual priority rank

 