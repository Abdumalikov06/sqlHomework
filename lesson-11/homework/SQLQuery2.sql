CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB1 VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB2 VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);

select * from Orders_DB1
select * from Orders_DB2

DECLARE @MissingOrders TABLE (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    MissingQuantity INT  
);


INSERT INTO @MissingOrders (OrderID, CustomerName, Product, MissingQuantity)
SELECT 
    o1.OrderID,
    o1.CustomerName,
    o1.Product,
    o1.Quantity AS MissingQuantity
FROM 
    Orders_DB1 o1
LEFT JOIN 
    Orders_DB2 o2 ON o1.OrderID = o2.OrderID
WHERE 
    o2.OrderID IS NULL;

SELECT * FROM @MissingOrders;