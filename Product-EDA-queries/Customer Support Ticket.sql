-- Goal: Customer Support needs a list of the 10 users who experience the most app_crash events.
SELECT 
  CONCAT(u.display_prefix,'-',CAST(u.user_id AS STRING)) AS customer_support_id,
  u.country,
  e.device_type,
  COUNT(e.event_type) AS total_crashes
FROM `product-analytics-494706.lumina_stream.users` AS u
INNER JOIN `product-analytics-494706.lumina_stream.events` AS e
  ON u.user_id = e.user_id
WHERE e.event_type = 'app_crash'
GROUP BY
  1,2,3
ORDER BY
  total_crashes DESC
LIMIT 10;