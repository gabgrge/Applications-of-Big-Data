-- Ranking of 10 Biggest Listeners All Time
SELECT
    usr as listener,
    COUNT(*) AS listenings
FROM listenings
GROUP BY listener
ORDER BY listenings DESC
LIMIT 10;