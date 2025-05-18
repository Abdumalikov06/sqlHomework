

with cte as(
select 1 as n , 1 as factorial
union all
select n+1, factorial*(n+1)
from cte 
where n<10)
select n, factorial from cte
order by n



