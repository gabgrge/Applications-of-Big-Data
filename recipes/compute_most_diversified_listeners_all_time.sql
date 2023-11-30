-- Ranking of 10 Most Diversified Listeners All Time
SELECT
    usr,
    COUNT(DISTINCT artist) AS unique_artists_count
FROM listenings
GROUP BY usr
ORDER BY unique_artists_count DESC
LIMIT 1;
