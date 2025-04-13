use class3;
;

select * from orders;



select
case
	when status='Shipped' or status = 'Delivered' then 'completed'
	when status='pending' then 'Pending'
	when status = 'cancelled' then 'Cancelled'
end as OrderStatus,
count(*) as totalorders,
sum(totalamount) as totalrevenue
from orders
	where orderdate between '2023-01-01' and '2023-12-31'
group by case
	when status='Shipped' or status = 'Delivered' then 'completed'
	when status='pending' then 'Pending'
	when status = 'cancelled' then 'Cancelled'
	end
--having sum(totalamount)>5000
order by totalrevenue desc
;
