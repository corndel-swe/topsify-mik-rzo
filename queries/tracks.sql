.mode json
SELECT tracks.*, albums.name as album_name
FROM tracks inner join albums
on tracks.album_id = albums.id
LIMIT 200;