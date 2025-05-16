create database class8;
use class8;

create table groupings(
stepnum int,
status varchar(50))

insert into groupings
values
(1,'passed'),
(2,'passed'),
(3,'passed'),
(4,'passed'),
(5,'failed'),
(6,'failed'),
(7,'failed'),
(8,'failed'),
(9,'failed'),
(10,'passed'),
(11,'passed'),
(12,'passed');

select * from groupings

select
	min(stepnum) as min_step_number,
	max(stepnum) as max_step_number,
	status,
	count(*) as consecutive_number
	from
(select*, 
		ROW_NUMBER() over(order by stepnum) -
		row_number () over (partition by status order by stepnum) as rn from groupings) as sub
group by status,rn
order by min_step_number


