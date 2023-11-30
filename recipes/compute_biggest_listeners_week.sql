-- Ranking of 10 Biggest Listeners for Each Week
SELECT
    'top_10_listeners_weekly' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
WHERE EXTRACT(WEEK FROM datetime) = EXTRACT(WEEK FROM CURRENT_DATE)
GROUP BY usr
ORDER BY result_value DESC
LIMIT 10;