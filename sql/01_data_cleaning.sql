-- Remove duplicate rides and incomplete station records

SELECT *
FROM (
  SELECT *
  FROM `excellent-tide-500319-i2.cyclistic.trip_data`
  QUALIFY ROW_NUMBER() OVER (
    PARTITION BY ride_id
  ) = 1
)
WHERE start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND LENGTH(ride_id) = 16;


-- Calculate ride duration and remove rides lasting 60 seconds or less

SELECT *,
       DATETIME_DIFF(ended_at, started_at, SECOND) AS duration
FROM `excellent-tide-500319-i2.cyclistic.trip_data_cleaned`
WHERE DATETIME_DIFF(ended_at, started_at, SECOND) > 60;
