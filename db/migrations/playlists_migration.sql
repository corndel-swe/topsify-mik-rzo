DROP TABLE IF EXISTS playlist_tracks;
DROP TABLE IF EXISTS playlists;

CREATE TABLE playlists(
    id integer PRIMARY KEY AUTOINCREMENT,
    user_id integer NOT NULL,
    name text NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlist_tracks(
    playlist_id integer,
    track_id text,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id)
)
