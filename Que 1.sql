#countries have most invoice
SELECT count(*) as c, billing_country
FROM music_database.invoice
GROUP by billing_country
order by c desc
limit 3


