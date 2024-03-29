#We want to find out the most popular music Genre for each country. We determine the
#most popular genre as the genre with the highest amount of purchases. Write a query
#that returns each country along with the top Genre. For countries where the maximum
#number of purchases is shared return all Genres

with popular_genre as 
(
	select count(invoice_line.quantity) as purchase, customer.country, genre.name, genre.genre_id,
	row_number() over (partition by customer.country order by count(invoice_line.quantity) desc) as rowno
	from invoice_line
    join invoice on invoice.invoice_id=invoice_line.invoice_id
    join customer on customer.customer_id=invoice.customer_id
    join track on track.track_id=invoice_line.track_id
    join genre on genre.genre_id=track.genre_id
    group by 2, 3, 4
    order by 1 desc
)
select * from popular_genre where rowno <= 1
