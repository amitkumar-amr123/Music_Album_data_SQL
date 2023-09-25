#Write a query that determines the customer that has spent the most on music for each
#country. Write a query that returns the country along with the top customer and how
#much they spent. For countries where the top amount spent is shared, provide all
#customers who spent this amount

with customer_with_country as (
	SELECT customer.customer_id, first_name, last_name, billing_country, sum(total) as total_spending,
    row_number() over(partition by billing_country order by sum(total) desc) as Rowno
    FROM music_database.invoice
    join customer on customer.customer_id=invoice.customer_id
    group by 1,2,3,4
    order by 4 asc, 5 desc
    )
select * from customer_with_country where Rowno <=1