-- Finding the Number of Rides by Time and Membership Type:

SELECT
  EXTRACT(HOUR FROM started_at) AS time_of_day,
  member_casual,
  COUNT(ride_id) AS hourly_trips
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY member_casual, time_of_day
ORDER BY member_casual, time_of_day;


-- Finding the Number of Rides by Day of the Week and Membership Type:

SELECT
  member_casual,
  day_of_week,
  COUNT(ride_id) AS daily_trips
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY day_of_week,member_casual
ORDER BY member_casual;


-- Finding The Number of Rides by Month and Membership Type:

SELECT
  month,
  member_casual,
  COUNT(ride_id) AS monthly_trips
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY month, member_casual
ORDER BY member_casual, monthly_trips;


-- Finding Average Ride Duration by Time of Day and Membership Type:

SELECT
  EXTRACT(HOUR FROM started_at) AS time_of_day,
  member_casual,
  AVG(ride_length) AS average_ride_duration_by_hour
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY time_of_day, member_casual
ORDER BY member_casual, time_of_day;


-- Finding Average Ride Duration by Day of the Week and Membership Type:

SELECT
  member_casual,
  day_of_week,
  AVG(ride_length) AS average_ride_duration_by_day
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY day_of_week,member_casual
ORDER BY member_casual, day_of_week;
Finding Average Ride Duration by Month and Membership Type:
SELECT
  month,
  member_casual,
  AVG(ride_length) AS average_ride_duration_by_month
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY month, member_casual
ORDER BY member_casual;


-- Finding the Location of and Number of Rides Started from Each Station:

SELECT  
  start_station_name,
  member_casual,
  AVG(start_lat) AS avg_start_lat,
  AVG(start_lng) AS avg_start_lng,
  COUNT(ride_id) AS trips_from_station
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY start_station_name, member_casual
ORDER BY member_casual


-- Finding the Location of and Number of Rides Ending at Each Station:
  
SELECT  
  end_station_name,
  member_casual,
  AVG(end_lat) AS avg_end_lat,
  AVG(end_lng) AS avg_end_lng,
  COUNT(ride_id) AS trips_to_station
FROM `direct-branch-396018.Cyclistic.2022_tripdata_clean`
GROUP BY end_station_name, member_casual
ORDER BY member_casual

