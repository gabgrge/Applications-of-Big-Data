-- Most Listened Track All Time
SELECT
    album,
    artist,
    COUNT(*) AS listenings
FROM listenings
GROUP BY album, artist
ORDER BY listenings DESC
LIMIT 1;