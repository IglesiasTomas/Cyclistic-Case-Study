-- Compare usage by hour of the day

SELECT
  EXTRACT(HOUR FROM started_at) AS hour,
  COUNTIF(member_casual = "member") AS member,
  COUNTIF(member_casual = "casual") AS casual,
  COUNT(*) AS total_rides
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY hour
ORDER BY hour;
