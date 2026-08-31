-- Compare usage by day of the week

SELECT
  FORMAT_DATE("%a", started_at) AS day,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_num,
  COUNTIF(member_casual = "member") AS member,
  COUNTIF(member_casual = "casual") AS casual,
  COUNT(*) AS total_rides
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY day_num, day
ORDER BY day_num;
