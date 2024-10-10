.mode json
SELECT albums.*, artists.name AS artist_name
FROM albums INNER JOIN artists
ON albums.artist_id = artists.id
LIMIT 60;