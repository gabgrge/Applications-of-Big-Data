-- Ranking of 10 Most Diversified Listeners All Time
SELECT
    usr as listener,
    COUNT(DISTINCT artist) AS listened_artists
FROM listenings
WHERE artist IS NOT NULL
GROUP BY listener
ORDER BY listened_artists DESC
LIMIT 10;
