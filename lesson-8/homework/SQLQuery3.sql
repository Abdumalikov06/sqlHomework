use class8;
CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);

INSERT INTO EMPLOYEES_N (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE)
VALUES
(1, 'John', '1975-06-15'),
(2, 'Jane', '1976-03-22'),
(3, 'Alex', '1977-11-01'),
-- 1978 skipped
(4, 'Sara', '1979-08-19'),
(5, 'Tom', '1980-12-05'),
-- 1981 skipped
(6, 'Lily', '1982-04-12'),
(7, 'Mark', '1983-09-30'),
(8, 'Nina', '1984-01-17'),
(9, 'Paul', '1985-10-10'),
-- 1986 to 1989 skipped
(10, 'Emma', '1990-05-25'),
-- 1991 to 1996 skipped
(11, 'Jake', '1997-02-14');
-- 1998 to 2025 skipped


SELECT 
    MIN(m.Year) AS StartYear,
    MAX(m.Year) AS EndYear,
    CAST(MIN(m.Year) AS VARCHAR) + ' - ' + CAST(MAX(m.Year) AS VARCHAR) AS Years
FROM (
    SELECT 
        y.Year,
        y.Year - ROW_NUMBER() OVER (ORDER BY y.Year) AS grp
    FROM (
        SELECT DISTINCT 1974 + number AS Year
        FROM master.dbo.spt_values
        WHERE type = 'P' AND number BETWEEN 1 AND YEAR(GETDATE()) - 1974
        EXCEPT
        SELECT DISTINCT YEAR(HIRE_DATE) FROM EMPLOYEES_N
    ) AS y
) AS m
GROUP BY m.grp
ORDER BY StartYear;






