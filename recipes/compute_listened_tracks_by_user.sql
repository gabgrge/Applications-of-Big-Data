-- Cross Tabulation of Listened Tracks by Listener and by Artist
SELECT
    usr,
    artist,
    COUNT(*) AS listened_tracks
FROM listenings
WHERE artist IS NOT NULL
GROUP BY usr, artist
ORDER BY usr, listened_tracks DESC