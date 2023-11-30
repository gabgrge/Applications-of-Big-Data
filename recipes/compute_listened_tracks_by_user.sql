-- Cross Tabulation of Listened Tracks by Listener and by Artist
SELECT
    usr,
    artist,
    COUNT(*) AS listened_tracks
FROM listenings
GROUP BY usr, artist