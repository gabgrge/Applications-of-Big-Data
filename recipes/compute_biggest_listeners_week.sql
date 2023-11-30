-- Ranking of 10 Biggest Listeners for Each Week
WITH ranked_listeners AS (
    SELECT
        EXTRACT(YEAR FROM datetime) AS year,
        EXTRACT(WEEK FROM datetime) AS week,
        usr as listener,
        COUNT(*) AS listenings,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM datetime), EXTRACT(WEEK FROM datetime) ORDER BY COUNT(*) DESC) AS listener_rank
    FROM listenings
    GROUP BY year, week, listener
)
SELECT
    year,
    week,
    listener,
    listenings
FROM ranked_listeners
WHERE listener_rank = 1
ORDER BY year, week, listenings DESC;