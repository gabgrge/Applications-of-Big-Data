-- Ranking of 10 Biggest Listeners All Time
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'top_10_listeners_all_time' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
GROUP BY usr
ORDER BY result_value DESC
LIMIT 10;