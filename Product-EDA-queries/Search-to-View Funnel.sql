WITH user_milestones AS (

  SELECT
    user_id,
    MAX(CASE WHEN event_type = 'search_content' THEN 1 ELSE 0 END) AS used_search,
    MAX(CASE WHEN event_type ='view_channel' THEN 1 ELSE 0 END) AS watched_content
  FROM `product-analytics-494706.lumina_stream.events`
  GROUP BY
    user_id
)
SELECT
  SUM(used_search) AS total_searchers,
  SUM(watched_content) AS total_watchers,
  ROUND(SAFE_DIVIDE(SUM(watched_content), SUM(used_search))* 100,2) AS search_to_watch_conversion_rate
FROM user_milestones
WHERE used_search = 1;