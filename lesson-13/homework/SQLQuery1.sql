

declare @inputdate date='2025-06-03';


with cte as (
select datefromparts(year(@inputdate), month(@inputdate),1) as date,
datename(WEEKDAY, datefromparts(year(@inputdate), month(@inputdate),1)) as weekname,
datepart(WEEKDAY, datefromparts(year(@inputdate), month(@inputdate),1)) as weeknum,
1 as weeknumber
union all
select  dateadd(day,1,date),
		datename(weekday,dateadd(day,1,date)),
		datepart(weekday,dateadd(day,1,date)),
		case when datepart(weekday,dateadd(day,1,date))>weeknum then weeknumber else weeknumber+1 end
from cte
where date <EOMONTH(@inputdate)

)

select 
		max(case when weekname='Sunday' then day(date) end) as Sunday,
		max(case when weekname='Monday' then day(date) end) as Monday,
		max(case when weekname='Tuesday' then day(date) end) as Tuesday,
		max(case when weekname='Wednesday' then day(date) end) as Wednesday,
		max(case when weekname='Thursday' then day(date) end) as Thrusday,
		max(case when weekname='Friday' then day(date) end) as Friday,
		max(case when weekname='Saturday' then day(date) end) as Saturday
from cte
group by weeknumber