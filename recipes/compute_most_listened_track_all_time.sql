-- Most Listened Track All Time
SELECT
    track,
    artist,
    COUNT(*) AS listenings
FROM listenings
GROUP BY track, artist
ORDER BY listenings DESC
LIMIT 1;