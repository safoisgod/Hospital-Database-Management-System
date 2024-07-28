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