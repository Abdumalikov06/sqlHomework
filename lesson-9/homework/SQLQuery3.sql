WITH FibonacciCTE AS (
    SELECT 1 AS n, 1 AS prev, 1 AS cur
    UNION ALL
    SELECT n + 1,
           cur AS prev,
           prev + cur AS curr
    FROM FibonacciCTE
    where n<=9
)
SELECT n, prev AS fibo
FROM FibonacciCTE
ORDER BY n
OPTION (MAXRECURSION 10);
