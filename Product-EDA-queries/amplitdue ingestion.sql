CREATE OR REPLACE TABLE `product-analytics-494706.lumina_stream.amplitude_ingestion` AS(

  SELECT
    e.*
  FROM `product-analytics-494706.lumina_stream.events` AS e
  JOIN `product-analytics-494706.lumina_stream.users` AS u
    ON e.user_id = u.user_id
  WHERE MOD(u.user_id,10) = 0
)