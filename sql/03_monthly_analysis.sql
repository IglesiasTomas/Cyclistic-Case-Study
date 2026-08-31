-- Compare monthly usage between members and casual riders

SELECT
  FORMAT_DATE("%b", started_at) AS month,
  EXTRACT(MONTH FROM started_at) AS month_num,
  COUNTIF(member_casual = "member") AS member,
  COUNTIF(member_casual = "casual") AS casual,
  COUNT(*) AS total_rides
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY month_num, month
ORDER BY month_num;
