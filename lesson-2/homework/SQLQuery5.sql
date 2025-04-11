create table workers
(
id int primary key,
name varchar(50));

bulk insert workers
from 'D:\MAAB\sql\sqlHomework\sqlHomework\lesson-2\homework\worker.csv'
with(
	firstrow=2,
	fieldterminator=',',
	rowterminator='\n');

select * from workers;