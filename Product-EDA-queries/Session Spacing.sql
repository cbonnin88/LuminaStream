WITH session_tracking AS (

  SELECT
    user_id,
    timestamp,
    LAG(timestamp) OVER(PARTITION BY user_id ORDER BY timestamp) AS previous_session_time
  FROM `product-analytics-494706.lumina_stream.events`
  WHERE event_type = 'session_start'
)
SELECT
  user_id,
  ROUND(AVG(TIMESTAMP_DIFF(CAST(timestamp AS TIMESTAMP),CAST(previous_session_time AS TIMESTAMP), HOUR)),1) AS avg_hours_between_visits
FROM session_tracking
WHERE previous_session_time IS NOT NULL
GROUP BY
  user_id
ORDER BY
  avg_hours_between_visits ASC
LIMIT 10;