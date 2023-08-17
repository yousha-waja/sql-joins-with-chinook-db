/* SELECT count(*) as artistCount 
from artists;

select count(*) as genreCount 
from genres;

select count(*) as playlistCount 
from playlists;

SELECT artists.Name , albums.Title
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
where artists.Name = "Amy Winehouse"
ORDER by artists.ArtistId;


SELECT genres.Name, genres.GenreId,tracks.Name
FROM tracks
JOIN genres ON tracks.GenreId = genres.GenreId
WHERE genres.Name = "Rock"; */

/* SELECT  playlist_track.TrackId, tracks.Name, playlists.Name
FROM tracks
JOIN playlist_track ON tracks.TrackId = playlist_track.TrackId
JOIN playlists ON playlists.PlaylistId = playlist_track.PlaylistId
ORDER BY tracks.TrackId DESC; */


/* -- find artist's genres
SELECT artists.ArtistId , artists.Name, genres.Name 
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
JOIN genres ON genres.GenreId = tracks.GenreId; */

SELECT Tracks.Name, Tracks.NumberofTracks AS MAX_Number_of_Tracks
FROM (
    SELECT playlists.Name, COUNT(tracks.TrackId) as NumberofTracks
    FROM playlists
    JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
    JOIN tracks ON tracks.TrackId = playlist_track.TrackId
    GROUP BY playlists.Name
) as Tracks
ORDER BY Tracks.NumberofTracks
LIMIT 1;
