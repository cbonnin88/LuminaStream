CREATE OR REPLACE TABLE `lumina_stream.events_partitioned`
PARTITION BY DATE(timestamp)
CLUSTER BY event_type, device_type AS(

  SELECT
    user_id,
    device_id,
    device_type,
    event_type,
    CAST(timestamp AS TIMESTAMP) AS timestamp,
    content_id,
    session_id
  FROM `lumina_stream.events`
)