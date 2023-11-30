-- Most Listened Albums for Each Week
WITH ranked_albums AS (
    SELECT
        EXTRACT(YEAR FROM datetime) AS year,
        EXTRACT(WEEK FROM datetime) AS week,
        album,
        artist,
        COUNT(*) AS listenings,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM datetime), EXTRACT(WEEK FROM datetime) ORDER BY COUNT(*) DESC) AS album_rank
    FROM listenings
    WHERE album IS NOT NULL
    GROUP BY year, week, album, artist
)
SELECT
    year,
    week,
    album,
    artist,
    listenings
FROM ranked_albums
WHERE album_rank <= 10
ORDER BY year, week, listenings DESC;