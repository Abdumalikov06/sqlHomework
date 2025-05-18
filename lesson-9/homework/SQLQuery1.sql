CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');
select * from Employees

;with cte as(
select 
e.EmployeeID,e.ManagerID,e.JobTitle, 0 as depth
from Employees as e
where ManagerID is NULL

union all 

select m.EmployeeID,m.ManagerID, m.JobTitle,c.depth+1 as depth 

from Employees as m
inner join cte as c

on m.ManagerID=c.EmployeeID
)


select * from cte 
order by depth, EmployeeID


