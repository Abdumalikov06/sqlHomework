use class3;



select distinct category from products as distinct_smth;

select * from products;

select category, max(price) as maxprice from products
group by category
select stock,
	iif(stock=0, 'out of stock',
	iif(stock between 1 and 10, 'low stock','instock'))
	as inventory_status
from products;


SELECT Category, ProductName, Price, Stock,
    IIF(Stock = 0, 'Out of Stock',
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')
    ) AS Inventory_Status
FROM products
WHERE (Category, Price) IN (
    SELECT Category, MAX(Price)
    FROM products
    GROUP BY Category
)
ORDER BY Price DESC
OFFSET 5 ROWS;
