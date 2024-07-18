-- ANALYSING QUEUES

-- Ok, these are some of the things I think are worth looking at:
-- 1. How long did the survey take?
SELECT
	DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS diff_date
FROM
	fict_md_water_services.visits;

-- 2. What is the average total queue time for water?
SELECT
	ROUND(AVG(time_in_queue)) AS avg_time_queue
FROM
	fict_md_water_services.visits
WHERE
	time_in_queue<>0;
    
    
-- 3. What is the average queue time on different days?
SELECT
	DISTINCT DAYNAME(time_of_record) AS day_of_week,
    ROUND(AVG(time_in_queue)) AS avg_queue_time
FROM
	fict_md_water_services.visits
WHERE
	time_in_queue<>0
GROUP BY 
	DAYNAME(time_of_record);    

-- 4. How can we communicate this information efficiently?
-- lets look as the average queue time for each hour of the day
-- also look at what time during the day people collect water... 
-- Try to order the results in a meaningful way.

SELECT 
	HOUR(time_of_record) AS hour_of_day,
    ROUND(AVG(time_in_queue)) AS avg_queue_time
FROM
	fict_md_water_services.visits
WHERE
	time_in_queue<>0
GROUP BY 
	HOUR(time_of_record);   
    
-- in a more meaningful way (date time format)
SELECT 
	TIME_FORMAT(TIME(time_of_record), "%H:00") AS hour_of_day,
    ROUND(AVG(time_in_queue)) AS avg_queue_time
FROM
	fict_md_water_services.visits
WHERE
	time_in_queue<>0
GROUP BY 
	TIME_FORMAT(TIME(time_of_record), "%H:00");   
    
-- query from ALX
-- hourly check by day(column)
-- check for only sunday
SELECT
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
	DAYNAME(time_of_record),
	CASE
		WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
		ELSE NULL
	END AS Sunday
FROM
	fict_md_water_services.visits
WHERE
time_in_queue != 0; -- this exludes other sources with 0 queue times.


-- the above with all days included
SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Sunday,
-- Monday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Monday,
-- Tuesday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Tuesday,
-- Wednesday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Wednesday,
-- Thursay
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Thursday,
-- Friday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Friday,
-- Saturday
	ROUND(AVG(
		CASE
		WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
		ELSE NULL
	END
		),0) AS Saturday
FROM
	fict_md_water_services.visits
WHERE
	time_in_queue != 0 -- this excludes other sources with 0 queue times
GROUP BY
	hour_of_day
ORDER BY
	hour_of_day;

-- done    