-- to ananlyze the water_source table
-- These are the questions that I am curious about.
-- 1. How many people did we survey in total?
-- let's calculate the toal number of people served in as that will represent the people surveyed
SELECT 
	SUM(number_of_people_served) AS total_surveyed
FROM
	fict_md_water_services.water_source;

-- the second question
-- 2. How many wells, taps and rivers are there?
-- make sure it is sorted
SELECT
	type_of_water_source,
    COUNT(source_id) AS num_water_sources
FROM
	fict_md_water_services.water_source
GROUP BY type_of_water_source
ORDER BY COUNT(source_id) DESC;

-- thrid question
-- 3. How many people share particular types of water sources on average?
SELECT
	type_of_water_source,
    ROUND(AVG(number_of_people_served)) AS avg_ppl_per_source
FROM
	fict_md_water_services.water_source
GROUP BY type_of_water_source
ORDER BY AVG(number_of_people_served) DESC;
-- it practically not possible for 644 people to share a tap_in_home
-- makes no sense
-- we have already deduced that 6 people live in a household
-- if we are to divide the avg by the number of people in a household(644/6) ...
-- we can get the numner of taps that is meant to represent the 1 tap i.e 100
-- meaning 100 taps serve 644 people

-- forth question
-- 4. How many people are getting water from each type of source?
SELECT
	type_of_water_source,
    SUM(number_of_people_served) AS popn_served
FROM
	fict_md_water_services.water_source
GROUP BY type_of_water_source
ORDER BY SUM(number_of_people_served) DESC;

-- lets calculate the percentage from the above
SELECT
	type_of_water_source,
    ROUND((SUM(number_of_people_served)/(SELECT SUM(number_of_people_served) FROM fict_md_water_services.water_source))*100) AS perc_of_popn_served
FROM
	fict_md_water_services.water_source
GROUP BY type_of_water_source
ORDER BY SUM(number_of_people_served) DESC;
