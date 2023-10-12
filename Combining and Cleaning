-- Combining 12 monthly data sets:

DROP TABLE IF EXISTS `direct-branch-396018.Cyclistic.2022_tripdata`;
CREATE TABLE IF NOT EXISTS `direct-branch-396018.Cyclistic.2022_tripdata` AS (
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_01_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_02_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_03_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_04_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_05_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_06_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_07_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_08_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_09_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_10_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_11_tripdata`
  UNION ALL
  Select *
  FROM `direct-branch-396018.Cyclistic.2022_12_tripdata`);


-- Checking for Duplicates:

SELECT
  COUNT(DISTINCT(ride_id))
FROM `direct-branch-396018.Cyclistic.2022_tripdata`


-- Checking Ride IDs for consistency:

SELECT
  COUNT(ride_id)
FROM `direct-branch-396018.Cyclistic.2022_tripdata`
WHERE
  LENGTH(ride_id) != 16


-- Checking for Null Values:

SELECT
  COUNT(*) - COUNT(ride_id) ride_id,
  COUNT(*) - COUNT(rideable_type) rideable_type,
  COUNT(*) - COUNT(started_at) started_at,
  COUNT(*) - COUNT(ended_at) ended_at,
  COUNT(*) - COUNT(start_station_name) start_station_name,
  COUNT(*) - COUNT(start_station_id) start_station_id,
  COUNT(*) - COUNT(end_station_name) end_station_name,
  COUNT(*) - COUNT(end_station_id) end_station_id,
  COUNT(*) - COUNT(start_lat) start_lat,
  COUNT(*) - COUNT(start_lng) start_lng,
  COUNT(*) - COUNT(end_lat) end_lat,
  COUNT(*) - COUNT(end_lng) end_lng,
  COUNT(*) - COUNT(member_casual) member_casual
FROM `direct-branch-396018.Cyclistic.2022_tripdata`


-- Dropping All Rows with Null Values:

DROP TABLE IF EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_no_null`;
CREATE TABLE IF NOT EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_no_null` AS (
Select *
FROM `direct-branch-396018.Cyclistic.2022_tripdata`
WHERE
  start_station_name IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL)


-- Adding Ride Length Column:

DROP TABLE IF EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_no_null_ride_length`;
CREATE TABLE IF NOT EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_no_null_ride_length` AS (
Select
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,
  (EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_length
FROM `direct-branch-396018.Cyclistic.2022_tripdata_no_null`)


-- Adding Day of Week and Month Columns and Dropping Short or Long Rides:

DROP TABLE IF EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_clean`;
CREATE TABLE IF NOT EXISTS `direct-branch-396018.Cyclistic.2022_tripdata_clean` AS (
Select
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,
  ride_length,
  CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'SUN'
    WHEN 2 THEN 'MON'
    WHEN 3 THEN 'TUES'
    WHEN 4 THEN 'WED'
    WHEN 5 THEN 'THURS'
    WHEN 6 THEN 'FRI'
    WHEN 7 THEN 'SAT'
  END AS day_of_week,
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'JAN'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'APR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AUG'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DEC'
    END AS month
FROM `direct-branch-396018.Cyclistic.2022_tripdata_no_null_ride_length`
WHERE ride_length < 600 AND ride_length > 1)

