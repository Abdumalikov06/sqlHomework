create database class6;
use class6;

create table employees(
employeeID int primary key,
name varchar(50),
DepartmentID varchar(50),
salary int);

insert into employees
values
(1	,'Alice',	101,	60000),
(2,	'Bob',	102,	70000),
(3,	'Charlie',	101,	65000),
(4,	'David',	103,	72000),
(5,	'Eva',	NULL,	68000);

select * from employees;

drop table if exists department
create table department (
DepartmentID int primary key,
DepartmentName varchar(50));

insert into department
values
(101,	'IT'),
(102,	'HR'),
(103,	'Finance'),
(104,	'Marketing');

select * from department

create table projectID(
projectid int primary key,
projectname varchar(50),
employeeid int foreign key references employees(employeeID))

insert into projectid
values 
(1,	'Alpha',	1),
(2,	'Beta',	2),
(3,	'Gamma',	1),
(4,	'Delta',	4),
(5,	'Omega',	NULL)

--task 1
select *
from employees as e
inner join department as d
on e.DepartmentID=d.DepartmentID
--task 2
select *
from employees as e
left  join department as d
on e.DepartmentID=d.DepartmentID
--task 3
select *
from employees as e
right join department as d
on e.DepartmentID=d.DepartmentID
--task 4
select *
from employees as e
full outer join department as d
on e.DepartmentID=d.DepartmentID
--task 5
select *,
	sum(salary) over(partition by departmentname) as total_salary
from employees as e
inner join department as d
on e.DepartmentID=d.DepartmentID
--task 6
select *
from employees as e
cross join department as d
--task 7
select *
from employees as e
left join projectID as p
on e.employeeID=p.employeeid
left outer join department as d
on d.DepartmentID=e.DepartmentID

