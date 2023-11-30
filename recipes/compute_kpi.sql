-- Create the kpi_results table
CREATE TABLE kpi_results (
    kpi_name TEXT,
    result_value DECIMAL
);

-- Most Listened Track and Album All Time
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'most_listened_track_all_time' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
GROUP BY track
ORDER BY result_value DESC
LIMIT 1;

-- Most Listened Track and Album for Each Week
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'most_listened_track_weekly' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
WHERE EXTRACT(WEEK FROM datetime) = WEEK(CURRENT_DATE())
GROUP BY track
ORDER BY result_value DESC
LIMIT 1;

-- Cross Tabulation of Listened Tracks by Listener and by Artist
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'cross_tabulation_tracks_by_listener_and_artist' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
GROUP BY usr, artist;

-- Ranking of 10 Biggest Listeners All Time
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'top_10_listeners_all_time' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
GROUP BY usr
ORDER BY result_value DESC
LIMIT 10;

-- Ranking of 10 Biggest Listeners for Each Week
INSERT INTO kpi_results (kpi_name, result_value)
SELECT
    'top_10_listeners_weekly' AS kpi_name,
    COUNT(*) AS result_value
FROM listenings
WHERE EXTRACT(WEEK FROM datetime) = WEEK(CURRENT_DATE())
GROUP BY usr
ORDER BY result_value DESC
LIMIT 10;
