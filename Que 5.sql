#Let's invite the artists who have written the most rock music in our dataset. Write a
#query that returns the Artist name and total track count of the top 10 rock bands

SELECT artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
FROM music_database.artist
join album2 on album2.artist_id=artist.artist_id
join track on album2.album_id=track.album_id
join genre on genre.genre_id=track.genre_id
where genre.name like 'Rock'
group by artist.artist_id, artist.name
order by number_of_songs desc
limit 10;