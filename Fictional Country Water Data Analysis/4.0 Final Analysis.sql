USE md_water_services;

SELECT 
    v.location_id,
    loc.location_type,
    s.type_of_water_source,
    s.number_of_people_served,
    v.time_in_queue,
    p.results
FROM md_water_services.visits AS v
LEFT JOIN well_pollution AS p
ON p.source_id = v.source_id
INNER JOIN md_water_services.location AS loc
ON v.location_id = loc.location_id
INNER JOIN md_water_services.water_source AS s
ON v.source_id = s.source_id
WHERE v.visit_count = 1
LIMIT 500000;


-- create view from a bove AS "combined analysis table"
DROP VIEW IF EXISTS combined_analysis_table;

CREATE VIEW combined_analysis_table AS
		SELECT 
			v.location_id,
			loc.location_type,
            loc.town_name,
            loc.province_name,
			s.type_of_water_source,
			s.number_of_people_served,
			v.time_in_queue,
			p.results
		FROM md_water_services.visits AS v
		LEFT JOIN well_pollution AS p
		ON p.source_id = v.source_id
		INNER JOIN md_water_services.location AS loc
		ON v.location_id = loc.location_id
		INNER JOIN md_water_services.water_source AS s
		ON v.source_id = s.source_id
		WHERE v.visit_count = 1;
        
        
-- lets break down to a more simplified pivot table
WITH
	province_totals AS(
			SELECT 
				cat.province_name,
				SUM(cat.number_of_people_served) as total_ppl_served
			FROM 
				combined_analysis_table AS cat
			GROUP BY
				cat.province_name)
	SELECT 
		cat.province_name,
        SUM((CASE WHEN cat.type_of_water_source = "river" THEN cat.number_of_people_served ELSE 0 END)*100)/pt.total_ppl_served AS river,
        SUM((CASE WHEN cat.type_of_water_source = "well" THEN cat.number_of_people_served ELSE 0 END)*100)/pt.total_ppl_served AS well,
		SUM((CASE WHEN cat.type_of_water_source = "shared_tap" THEN cat.number_of_people_served ELSE 0 END)*100)/pt.total_ppl_served AS shared_tap,
        SUM((CASE WHEN cat.type_of_water_source = "tap_in_home" THEN cat.number_of_people_served ELSE 0 END)*100)/pt.total_ppl_served AS tap_in_home,
        SUM((CASE WHEN cat.type_of_water_source = "tap_in_home_broken" THEN cat.number_of_people_served ELSE 0 END)*100)/pt.total_ppl_served AS tap_in_home_broken	
    FROM 
		combined_analysis_table AS cat
	JOIN 
		province_totals AS pt
    ON
		pt.province_name=cat.province_name
	GROUP BY
		province_name;


-- town totals
DROP TEMPORARY TABLE IF EXISTS town_agg_water_access;
CREATE TEMPORARY TABLE town_agg_water_access
WITH
	town_totals AS(
			SELECT 
				cat.province_name,
                cat.town_name,
				SUM(cat.number_of_people_served) as total_ppl_served
			FROM 
				combined_analysis_table AS cat
			GROUP BY
				cat.province_name,
                cat.town_name)
	SELECT 
		cat.province_name,
        cat.town_name,
        ROUND(SUM((CASE WHEN cat.type_of_water_source = "river" THEN cat.number_of_people_served ELSE 0 END)*100)/tt.total_ppl_served) AS river,
        ROUND(SUM((CASE WHEN cat.type_of_water_source = "well" THEN cat.number_of_people_served ELSE 0 END)*100)/tt.total_ppl_served) AS well,
		ROUND(SUM((CASE WHEN cat.type_of_water_source = "shared_tap" THEN cat.number_of_people_served ELSE 0 END)*100)/tt.total_ppl_served) AS shared_tap,
        ROUND(SUM((CASE WHEN cat.type_of_water_source = "tap_in_home" THEN cat.number_of_people_served ELSE 0 END)*100)/tt.total_ppl_served) AS tap_in_home,
        ROUND(SUM((CASE WHEN cat.type_of_water_source = "tap_in_home_broken" THEN cat.number_of_people_served ELSE 0 END)*100)/tt.total_ppl_served) AS tap_in_home_broken	
    FROM 
		combined_analysis_table AS cat
	JOIN 
		town_totals AS tt
    ON
		tt.province_name=cat.province_name AND 	tt.town_name = cat.town_name
	GROUP BY
		province_name,
        town_name
    ORDER BY
		town_name;
        
-- let's find out whic of the towns has a higher ratio of of poeple with broken taps

SELECT
	province_name,
    town_name,
	ROUND(tap_in_home_broken/(tap_in_home_broken+tap_in_home)*100) AS pct_of_broken_traps
FROM
	town_agg_water_access;


-- Project Progress 
DROP TABLE IF EXISTS Project_progress;
CREATE TABLE Project_progress (
		Project_id SERIAL PRIMARY KEY,
		/* Project_id −− Unique key for sources in case we visit the same

		source more than once in the future.

		*/
		source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
		/* source_id −− Each of the sources we want to improve should exist,

		and should refer to the source table. This ensures data integrity.

		*/
		Address VARCHAR(50), /* Street address */
		Town VARCHAR(30),
		Province VARCHAR(30),
		Source_type VARCHAR(50),
		Improvement VARCHAR(50), /* What the engineers should do at that place */
		Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
		/* Source_status −− We want to limit the type of information engineers can give us, so we
		limit Source_status.
		− By DEFAULT all projects are in the "Backlog" which is like a TODO list.
		− CHECK() ensures only those three options will be accepted. This helps to maintain clean data.
		*/
		Date_of_completion DATE, /* Engineers will add this the day the source has been upgraded. */
		Comments TEXT /* Engineers can leave comments. We use a TEXT type that has no limit on char length */
		);
        
-- same thing without comments
DROP TABLE IF EXISTS Project_progress;
CREATE TABLE Project_progress (
		Project_id SERIAL PRIMARY KEY,
		source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
		Address VARCHAR(50),
		Town VARCHAR(30),
		Province VARCHAR(30),
		Source_type VARCHAR(50),
		Improvement VARCHAR(50),
		Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
		Date_of_completion DATE,
		Comments TEXT
		);
	
-- Project_progress_query
SELECT
	location.address,
	location.town_name,
	location.province_name,
	water_source.source_id,
	water_source.type_of_water_source,
	well_pollution.results,
    visits.time_in_queue,
    CASE 
		WHEN well_pollution.results LIKE "%Chem%" THEN  "Install RO filter"
        WHEN well_pollution.results LIKE "%Bio%" THEN "Install UV and RO filter"
        WHEN water_source.type_of_water_source = "river" THEN  "Drill well"
        WHEN water_source.type_of_water_source = "shared_tap" THEN  CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")
        WHEN water_source.type_of_water_source = "tap_in_home_broken" THEN  "Diagnose Infrastructure"
	ELSE NULL 
    END AS "Improvements"
FROM
	water_source
LEFT JOIN
	well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
	visits ON water_source.source_id = visits.source_id
INNER JOIN
	location ON location.location_id = visits.location_id
WHERE visits.visit_count = 1 
    AND (water_source.type_of_water_source = "shared_tap" AND visits.time_in_queue >= 30) 
    OR well_pollution.results<>"clean"
    OR  (water_source.type_of_water_source IN( "river","tap_in_home_broken"));
    
    
-- insert into project progress
-- Project_progress_query
INSERT INTO project_progress(address,town,province,source_id,Source_type,improvement)
SELECT
	location.address,
	location.town_name,
	location.province_name,
	water_source.source_id,
	water_source.type_of_water_source,
    CASE 
		WHEN well_pollution.results LIKE "%Chem%" THEN  "Install RO filter"
        WHEN well_pollution.results LIKE "%Bio%" THEN "Install UV and RO filter"
        WHEN water_source.type_of_water_source = "river" THEN  "Drill well"
        WHEN water_source.type_of_water_source = "shared_tap" THEN  CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")
        WHEN water_source.type_of_water_source = "tap_in_home_broken" THEN  "Diagnose Infrastructure"
	ELSE NULL 
    END AS "Improvements"
FROM
	water_source
LEFT JOIN
	well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
	visits ON water_source.source_id = visits.source_id
INNER JOIN
	location ON location.location_id = visits.location_id
WHERE visits.visit_count = 1 
    AND (water_source.type_of_water_source = "shared_tap" AND visits.time_in_queue >= 30) 
    OR well_pollution.results<>"clean"
    OR  (water_source.type_of_water_source IN( "river","tap_in_home_broken"))