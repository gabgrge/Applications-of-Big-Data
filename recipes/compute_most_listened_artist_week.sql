-- Most Listened Artist for Each Week
WITH ranked_artists AS (
    SELECT
        EXTRACT(YEAR FROM datetime) AS year,
        EXTRACT(WEEK FROM datetime) AS week,
        artist,
        COUNT(*) AS listenings,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM datetime), EXTRACT(WEEK FROM datetime) ORDER BY COUNT(*) DESC) AS artist_rank
    FROM listenings
    WHERE artist IS NOT NULL
    GROUP BY year, week, artist
)
SELECT
    year,
    week,
    artist,
    listenings
FROM ranked_artists
WHERE artist_rank = 1
ORDER BY year, week, listenings DESC;