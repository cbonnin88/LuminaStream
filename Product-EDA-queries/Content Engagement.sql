-- Goal: What content drives the most engagement, and how much traffic is just general app navigation?

SELECT
  COALESCE(content_id, 'General App Navigation') AS content_name,
  COUNT(*) AS total_interactions,
  COUNT(DISTINCT user_id) AS unique_viewers  
FROM `product-analytics-494706.lumina_stream.events`
GROUP BY
  content_name
ORDER BY
  total_interactions DESC;