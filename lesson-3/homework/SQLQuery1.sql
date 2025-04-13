create database class3;
go
use class3;

drop table if exists Employees;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'Alice', 'Johnson', 'HR', 55000.00, '2020-03-15'),
(2, 'Bob', 'Smith', 'IT', 72000.00, '2019-06-01'),
(3, 'Carol', 'Williams', 'Finance', 68000.00, '2018-11-23'),
(4, 'David', 'Brown', 'Marketing', 60000.00, '2021-01-12'),
(5, 'Eve', 'Davis', 'Sales', 52000.00, '2022-09-05'),
(6, 'Frank', 'Garcia', 'IT', 75000.00, '2017-08-20'),
(7, 'Grace', 'Martinez', 'HR', 54000.00, '2020-02-17'),
(8, 'Henry', 'Lopez', 'Finance', 71000.00, '2019-05-10'),
(9, 'Isabel', 'Gonzalez', 'Sales', 50000.00, '2023-03-22'),
(10, 'Jack', 'Wilson', 'Marketing', 63000.00, '2021-10-30'),
(11, 'Karen', 'Young', 'IT', 70000.00, '2020-04-18'),
(12, 'Leo', 'Hill', 'Finance', 66000.00, '2019-12-30'),
(13, 'Mia', 'Scott', 'Sales', 51000.00, '2021-07-14'),
(14, 'Nate', 'Green', 'HR', 53000.00, '2018-05-22'),
(15, 'Olivia', 'Adams', 'Marketing', 62000.00, '2022-10-11'),
(16, 'Paul', 'Baker', 'IT', 80000.00, '2017-09-01'),
(17, 'Quinn', 'Nelson', 'Finance', 69000.00, '2020-06-08'),
(18, 'Rachel', 'Carter', 'Sales', 49500.00, '2023-02-05'),
(19, 'Steve', 'Mitchell', 'Marketing', 61000.00, '2021-03-19'),
(20, 'Tina', 'Perez', 'HR', 54500.00, '2019-01-10'),
(21, 'Uma', 'Robinson', 'Finance', 67500.00, '2022-11-16'),
(22, 'Victor', 'Turner', 'IT', 76500.00, '2023-05-30'),
(23, 'Wendy', 'Phillips', 'Sales', 50500.00, '2021-08-25'),
(24, 'Xavier', 'Campbell', 'Marketing', 63500.00, '2020-12-12'),
(25, 'Yara', 'Evans', 'HR', 56000.00, '2023-04-03'),
(26, 'Zane', 'Edwards', 'Finance', 70000.00, '2021-06-27'),
(27, 'Amber', 'Collins', 'IT', 78500.00, '2019-03-15'),
(28, 'Blake', 'Stewart', 'Sales', 52000.00, '2020-01-22'),
(29, 'Chloe', 'Sanchez', 'Marketing', 64500.00, '2022-07-09'),
(30, 'Derek', 'Reed', 'HR', 55800.00, '2021-09-18');

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status) VALUES
(101, 'John Carter', '2023-10-01', 250.00, 'Shipped'),
(102, 'Linda Ray', '2023-10-03', 180.50, 'Pending'),
(103, 'Michael Kent', '2023-09-15', 99.99, 'Delivered'),
(104, 'Sara Lee', '2023-11-10', 320.00, 'Cancelled'),
(105, 'Tom Hardy', '2023-12-05', 450.75, 'Delivered'),
(106, 'Emma Frost', '2024-01-01', 129.99, 'Shipped'),
(107, 'Bruce Wayne', '2024-02-20', 399.00, 'Pending'),
(108, 'Diana Prince', '2024-03-01', 275.49, 'Shipped'),
(109, 'Clark Kent', '2024-03-15', 150.25, 'Cancelled'),
(110, 'Peter Parker', '2024-04-01', 220.00, 'Delivered');


INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(201, 'Wireless Mouse', 'Electronics', 25.99, 150),
(202, 'Gaming Keyboard', 'Electronics', 79.99, 85),
(203, 'Office Chair', 'Furniture', 120.00, 40),
(204, 'LED Monitor 24"', 'Electronics', 140.50, 60),
(205, 'Standing Desk', 'Furniture', 300.00, 20),
(206, 'Bluetooth Speaker', 'Audio', 45.75, 90),
(207, 'Water Bottle', 'Accessories', 15.00, 200),
(208, 'Laptop Sleeve 15"', 'Accessories', 22.49, 180),
(209, 'USB-C Hub', 'Electronics', 34.99, 100),
(210, 'Noise Cancelling Headphones', 'Audio', 199.99, 35);

--task 1
select top 10 percent * from employees
order by salary desc;

--task 2
select department, avg(salary) as AverageSalary
from employees
group by department;

--task 3
select salary,
case
	when salary>80000 then 'High'
	when salary between 50000 and 80000 then 'medium'
	else
	'low'

end
from employees;

SELECT 
    Department,
    AVG(Salary) AS AverageSalary,
    CASE 
        WHEN AVG(Salary) > 80000 THEN 'High'
        WHEN AVG(Salary) BETWEEN 50000 AND 80000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM (
    SELECT TOP 10 PERCENT *
    FROM Employees
    ORDER BY Salary DESC) as topearners
GROUP BY Department
ORDER BY AverageSalary DESC
--OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;