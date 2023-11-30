-- Most Listened Track and Album for Each Week
SELECT
    EXTRACT(YEAR FROM datetime) AS year,
    EXTRACT(WEEK FROM datetime) AS week,
    track,
    artist,
    COUNT(*) AS listenings
FROM listenings
GROUP BY year, week, track, artist
ORDER BY year, week, listenings DESC