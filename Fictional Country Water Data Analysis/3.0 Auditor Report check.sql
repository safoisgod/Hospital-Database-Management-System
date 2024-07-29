USE fict_md_water_services;
-- let's create a new table for our auditor's report import table from

DROP TABLE IF EXISTS `auditor_report`;
CREATE TABLE `auditor_report` (
`location_id` VARCHAR(32),
`type_of_water_source` VARCHAR(64),
`true_water_source_score` int DEFAULT NULL,
`statements` VARCHAR(255)
);


-- let's view the auditor_report table
SELECT *
FROM 
	fict_md_water_services.auditor_report;


-- lets combine the data from the visit table to the auditors table
SELECT
	a.location_id as audit_location,
    a.true_water_source_score,
    v.location_id as visit_location,
    v.record_id
FROM 
	fict_md_water_services.auditor_report as a
JOIN
	fict_md_water_services.visits as v
ON
	a.location_id = v.location_id;

-- now we can add the water quality from our water_quality table 

SELECT
	a.location_id,
    a.true_water_source_score as auditor_score,
    v.record_id,
    q.subjective_quality_score as surveyor_score
FROM 
	fict_md_water_services.auditor_report as a
JOIN
	fict_md_water_services.visits as v
ON
	a.location_id = v.location_id
JOIN
	fict_md_water_services.water_quality as q
ON
	v.record_id = q.record_id;

-- lets check if the auditor's score and the surveyor's score are the same
-- we were given two options, using the "=" operator or subtracting the two values to obtain zer

SELECT
	a.location_id,
    a.true_water_source_score as auditor_score,
    v.record_id,
    q.subjective_quality_score as surveyor_score
FROM 
	fict_md_water_services.auditor_report as a
JOIN
	fict_md_water_services.visits as v
ON
	a.location_id = v.location_id
JOIN
	fict_md_water_services.water_quality as q
ON
	v.record_id = q.record_id
WHERE 
	-- a.true_water_source_score = q.subjective_quality_score;
-- after checking we get the same vaules but we can correct that by removing duplicates 
-- let's filter by the visit_count
    a.true_water_source_score - q.subjective_quality_score = 0 AND v.visit_count = 1;

-- we find out that 1518 results were return
-- for a total of 1620 we can tell that the surveyors had 1518/1620 =94%

-- this means 102 incorrect data
-- let's check that out
SELECT
	a.location_id,
    q.subjective_quality_score as surveyor_score,
    a.true_water_source_score as auditor_score,
    v.record_id,
    e.employee_name
FROM 
	fict_md_water_services.auditor_report as a
JOIN
	fict_md_water_services.visits as v
ON
	a.location_id = v.location_id
JOIN
	fict_md_water_services.water_quality as q
ON
	v.record_id = q.record_id
JOIN
	employee as e
ON
	v.assigned_employee_id = e.assigned_employee_id

WHERE 
    a.true_water_source_score - q.subjective_quality_score != 0 AND v.visit_count = 1;
    
-- this looks very long 
-- we can create a CTE from this table and then call it "Incorrect Record"



WITH incorrect_records AS
			(SELECT
				a.location_id,
				q.subjective_quality_score as surveyor_score,
				a.true_water_source_score as auditor_score,
				v.record_id,
				e.employee_name
			FROM 
				fict_md_water_services.auditor_report as a
			JOIN
				fict_md_water_services.visits as v
			ON
				a.location_id = v.location_id
			JOIN
				fict_md_water_services.water_quality as q
			ON
				v.record_id = q.record_id
			JOIN
				employee as e
			ON
				v.assigned_employee_id = e.assigned_employee_id

			WHERE 
				a.true_water_source_score - q.subjective_quality_score != 0 AND v.visit_count = 1)
	-- lets query this table
    -- we can select distinct employees from the CTE
    -- we can also select the wrong report count
		SELECT
			employee_name,
            COUNT(auditor_score) as error_count
		FROM incorrect_records
        GROUP BY
			employee_name;
        
        -- Creat err_count CTE
        WITH err_count AS(SELECT DISTINCT
							employee_name,
                            COUNT(auditor_score) as error_count
							FROM incorrect_records
							GROUP BY
								employee_name)
					SELECT *
                    FROM err_count;

-- we can see that the query doesnt work as incorrect isn't a table
-- as such we should create a VIEW for easy query
DROP VIEW IF EXISTS incorrect_records;
CREATE VIEW incorrect_records AS
			(SELECT
				a.location_id,
				q.subjective_quality_score as surveyor_score,
				a.true_water_source_score as auditor_score,
				v.record_id,
				e.employee_name,
                a.statements
			FROM 
				fict_md_water_services.auditor_report as a
			JOIN
				fict_md_water_services.visits as v
			ON
				a.location_id = v.location_id
			JOIN
				fict_md_water_services.water_quality as q
			ON
				v.record_id = q.record_id
			JOIN
				employee as e
			ON
				v.assigned_employee_id = e.assigned_employee_id

			WHERE 
				a.true_water_source_score - q.subjective_quality_score != 0 AND v.visit_count = 1);
	
    
WITH error_count AS (SELECT
					employee_name,
					COUNT(employee_name) AS number_of_mistakes
					FROM
					incorrect_records
					GROUP BY
					employee_name),
 
   suspect_list AS (SELECT
					employee_name,
					number_of_mistakes
					FROM
					error_count
					WHERE number_of_mistakes > (SELECT AVG(number_of_mistakes) AS avg_number_of_mistakes 
					FROM error_count))
				SELECT
					employee_name,
                    location_id,
                    statements
                FROM incorrect_records
                WHERE employee_name IN (SELECT
					employee_name FROM suspect_list);

-- check for cash
SELECT * 
FROM incorrect_records
WHERE statements LIKE "%cash%";

-- check if any one outside out susoects is also involved in bribery
SELECT * 
FROM incorrect_records
WHERE statements = "_%cash%_";
