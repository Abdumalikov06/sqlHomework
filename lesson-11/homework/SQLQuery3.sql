use class11;
CREATE TABLE WorkLog (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    WorkDate DATE,
    HoursWorked INT
);

INSERT INTO WorkLog VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);


create view vw_MonthlyWorkSummary  as 
SELECT 
    wk.EmployeeID, 
    wk.EmployeeName, 
    wo.Department, 
    SUM(wk.HoursWorked) AS TotalHoursWorked,
	sum(wo.hoursworked) as TotalHoursDepartment,
	avg(wl.hoursworked) as AvgHoursDepartment
FROM 
    WorkLog as wk
join
	worklog as wo
	on wk.Department=wo.Department
join
	worklog as wl
	on wo.Department=wl.Department
GROUP BY 
    wk.EmployeeID, wk.EmployeeName, wo.Department;



select * from vw_MonthlyWorkSummary 