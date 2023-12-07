-- Most Listened Album All Time
SELECT
    album,
    artist,
    COUNT(*) AS listenings
FROM listenings
WHERE album IS NOT NULL
GROUP BY album, artist
ORDER BY listenings DESC
LIMIT 1;