-- Top 20 stations by combined start and end activity

WITH start_info AS (
  SELECT
    start_station_name,
    COUNT(*) AS users1
  FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
  GROUP BY start_station_name
),

end_info AS (
  SELECT
    end_station_name,
    ANY_VALUE(end_lat) AS end_lat,
    ANY_VALUE(end_lng) AS end_lng,
    COUNT(*) AS users2
  FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
  GROUP BY end_station_name
)

SELECT
  start_info.start_station_name AS station_name,
  end_info.end_lat,
  end_info.end_lng,
  users1 + COALESCE(users2, 0) AS users
FROM end_info
RIGHT JOIN start_info
  ON end_info.end_station_name = start_info.start_station_name
WHERE users1 + COALESCE(users2, 0) > 1
ORDER BY users DESC
LIMIT 20;


-- Top 20 end stations used by casual riders

SELECT
  end_station_name,
  COUNTIF(member_casual = "casual") AS users,
  ANY_VALUE(end_lat) AS end_lat,
  ANY_VALUE(end_lng) AS end_lng
FROM `excellent-tide-500319-i2.cyclistic.trip_data_clean`
GROUP BY end_station_name
ORDER BY users DESC
LIMIT 20;
