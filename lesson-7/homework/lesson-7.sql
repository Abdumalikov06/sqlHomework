use class7;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);


-- Insert into Customers
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice Smith'),
(2, 'Bob Johnson'),
(3, 'Carol Lee');

-- Insert into Products
INSERT INTO Products (ProductID, ProductName, Category) VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Desk Chair', 'Furniture'),
(103, 'Notebook', 'Stationery');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2025-05-01'),
(1002, 2, '2025-05-02'),
(1003, 1, '2025-05-03');

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1001, 101, 1, 999.99),
(2, 1001, 103, 3, 2.50),
(3, 1002, 102, 2, 85.00),
(4, 1003, 103, 10, 2.30);


--task1 

select cus.CustomerID,cus.CustomerName,ord.OrderID, ord.OrderDate 
from
Customers as cus
left join Orders as ord
on cus.CustomerID = ord.CustomerID

--task 2

select cus.CustomerID, cus.CustomerName
from
Customers as cus
left join Orders as ord
on cus.CustomerID = ord.CustomerID
where ord.OrderID is null;

--task 3


select ord.OrderID, pd.ProductName, od.Quantity
from orders as ord
join OrderDetails  as od
on ord.OrderID = od.OrderID
join Products as pd
on pd.ProductID = od.ProductID

--task 4
select cus.CustomerID, cus.CustomerName,count(distinct od.OrderID) as countnum
from Customers as cus
left join Orders as ord
on cus.CustomerID=ord.CustomerID
left join OrderDetails as od
on ord.OrderID=od.OrderID
group by cus.CustomerID, cus.CustomerName
having count(distinct od.OrderID)>1;

--task 5

SELECT od.OrderID, od.ProductID, pd.ProductName, od.Price
FROM OrderDetails od
JOIN Products pd ON od.ProductID = pd.ProductID
WHERE od.Price = (
    SELECT MAX(od2.Price)
    FROM OrderDetails od2
    WHERE od2.OrderID = od.OrderID
);

--task 6
select * from Customers as cus
join Orders as ord
on cus.CustomerID = ord.CustomerID
where ord.OrderDate=(
	select max(ord.OrderDate) 
	from Orders as ord
	where ord.CustomerID=cus.CustomerID)

--task 7
select c.CustomerName,pd.ProductName, pd.Category
from customers as c
join orders as o
on c.CustomerID=o.CustomerID
join OrderDetails as od
on od.OrderID=o.OrderID
join Products as pd
on pd.ProductID=od.ProductID
where category = 'Electronics'

--task 8
SELECT DISTINCT c.CustomerID, c.CustomerName, p.ProductName, p.Category
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = 'Stationery';

--task 9
select cs.CustomerID, cs.CustomerName, sum(od.quantity* od.price) as total_spent
from Customers as cs
join Orders as ord
on cs.CustomerID=ord.CustomerID
join OrderDetails as od
on od.OrderID=ord.OrderID
group by cs.CustomerID,cs.CustomerName;


