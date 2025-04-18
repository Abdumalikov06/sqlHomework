create database class5;
go
use class5;
drop table if exists employees;
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('jack', 'HR', 60000, '2020-09-15'),
    ('Carl', 'HR', 60000, '2018-05-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');


--task 1

select *,
	ROW_NUMBER() over(order by salary desc) as unique_rank
from Employees
order by EmployeeID;

--task 2
SELECT *
FROM (
    SELECT 
        EmployeeID,
        Name,
        Department,
        Salary,
        DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
) AS RankedSalaries
WHERE SalaryRank IN (
    SELECT SalaryRank
    FROM (
        SELECT 
            DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
        FROM Employees
    ) AS Ranks
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
)
ORDER BY SalaryRank, Salary DESC;

--task 3
select * from
	(select *,
		dense_rank() over(partition by department order by salary desc) as sal
	from employees) as top_sal
where sal <=2
order by department, salary desc;

--task 4

select * from
	(select *,
		dense_rank() over(partition by department order by salary asc) as sal
	from employees) as top_sal
where sal =1
order by department, salary desc;

--task 5

select *,
	sum(Salary) over(partition by department order by employeeid) as sum_sal
from employees;

--task 6

--1st way
select *,
	sum(salary) over(partition by department) as sum_department
from Employees;

--2nd way
select distinct department,
	sum(salary) over(partition by department) as sum_department
from Employees;

--3rd way with group by
select department, sum(salary) 
from Employees
group by Department;

--task 7
select *,
	avg(salary) over(partition by department) as sum_department
from Employees;

select distinct department,
	avg(salary) over(partition by department) as avg_department
from Employees;

--task 8

select *,
	avg(salary) over(partition by department) as avg_department,
	salary-avg(salary) over(partition by department) as diff_of_salaries
from Employees;

--task 9
select *, 
	sum(salary) over(order by salary rows between 1 preceding and 1 following ) as sum_of_3
from employees;

--task 10

--answer
SELECT SUM(Salary) AS TotalSalary
FROM (
    SELECT Top 3 Salary
    FROM Employees
    ORDER BY HireDate DESC )
	AS last3;


select top 3 * 
from employees 
order by hiredate desc;

select top 3 *,
	sum(salary) over(order by hiredate desc) as last3
from employees;

--task 11
select *,
	cast(avg(salary) over(order by hiredate  )as decimal(10,2)) as avg_of_all
from employees;

--task 12

select *,
	max(salary) over(order by hiredate rows between 2 preceding and 2 following) as Max_between_5
from employees;

--task 13

select *,
	cast(100*salary/sum(salary) over(partition by department) as decimal (10,2)) as percentage_contribution
from Employees;
