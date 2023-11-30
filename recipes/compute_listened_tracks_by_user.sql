-- Cross Tabulation of Listened Tracks by Listener and by Artist
SELECT
    usr,
    artist,
    COUNT(*) AS listened_track
FROM listenings
GROUP BY usr, artist