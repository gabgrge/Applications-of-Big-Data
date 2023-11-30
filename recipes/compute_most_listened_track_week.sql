-- Most Listened Track and Album for Each Week
SELECT
    EXTRACT(YEAR FROM datetime) as year,
    EXTRACT(WEEK FROM datetime) as week,
    track,
    artist,
    COUNT(*) AS listenings
FROM listenings
WHERE EXTRACT(WEEK FROM datetime) = EXTRACT(WEEK FROM CURRENT_DATE)
GROUP BY track, artist
ORDER BY listenings DESC
LIMIT 1;