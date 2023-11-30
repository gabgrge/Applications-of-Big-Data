-- Ranking
SELECT
    usr,
    COUNT(DISTINCT artist) AS unique_artists_count
FROM listenings
GROUP BY usr
ORDER BY unique_artists_count DESC
LIMIT 1;
