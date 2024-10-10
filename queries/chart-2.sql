.mode json
SELECT
artists.name AS artist_name,
albums.name AS album_name,
AVG(features.danceability) AS average_danceability,
AVG(features.energy) AS average_energy,
AVG(features.speechiness) AS average_speechiness,
AVG(features.acousticness) AS average_acousticness,
AVG(features.liveness) AS average_liveness
FROM artists
INNER JOIN albums
ON artists.id = albums.artist_id
INNER JOIN tracks
ON albums.id = tracks.album_id
INNER JOIN features
ON tracks.id = features.track_id
GROUP BY albums.id;
