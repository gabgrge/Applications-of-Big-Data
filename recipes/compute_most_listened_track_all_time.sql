-- Most Listened Track All Time
SELECT
    track AS most_listened_track_all_time,
    COUNT(*) AS listenings
FROM listenings
GROUP BY track
ORDER BY listenings DESC
LIMIT 1;