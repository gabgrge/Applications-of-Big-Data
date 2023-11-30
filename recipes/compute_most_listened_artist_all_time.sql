-- Most Listened Artist All Time
SELECT
    artist,
    COUNT(*) AS listenings
FROM listenings
WHERE artist IS NOT NULL
GROUP BY artist
ORDER BY listenings DESC
LIMIT 1;