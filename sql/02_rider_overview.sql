-- Compare total number of rides by rider type

SELECT
  member_casual,
  COUNT(*) AS ride_count
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY member_casual;
