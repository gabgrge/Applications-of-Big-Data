-- Most Listened Track and Album for Each Week

WITH ranked_listenings AS (
    SELECT
        EXTRACT(YEAR FROM datetime) AS year,
        EXTRACT(WEEK FROM datetime) AS week,
        track,
        artist,
        COUNT(*) AS listenings,
        ROW_NUMBER() OVER (PARTITION BY year, week ORDER BY COUNT(*) DESC) AS rank
    FROM listenings
    GROUP BY year, week, track, artist
)

SELECT
    year,
    week,
    track,
    artist,
    listenings
FROM ranked_listenings
WHERE rank <= 10
ORDER BY year, week, rank;
