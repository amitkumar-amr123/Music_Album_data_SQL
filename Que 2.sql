#Top 3 values of total invoice
SELECT total FROM music_database.invoice
order by total desc
limit 3
