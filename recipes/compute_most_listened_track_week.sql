-- Most Listened Track for Each Week

WITH ranked_tracks AS (
    SELECT
        EXTRACT(YEAR FROM datetime) AS year,
        EXTRACT(WEEK FROM datetime) AS week,
        track,
        artist,
        COUNT(*) AS listenings,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM datetime), EXTRACT(WEEK FROM datetime) ORDER BY COUNT(*) DESC) AS track_rank
    FROM listenings
    GROUP BY year, week, track, artist
)
SELECT
    year,
    week,
    track,
    artist,
    listenings
FROM ranked_tracks
WHERE track_rank <= 10
ORDER BY year, week, listenings DESC;
