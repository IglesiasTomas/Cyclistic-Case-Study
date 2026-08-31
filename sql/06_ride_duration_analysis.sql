-- Compare average ride duration between members and casual riders

SELECT
  member_casual,
  AVG(duration) AS avg_ride_duration_seconds
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY member_casual;
