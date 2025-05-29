use class11
DECLARE @temp_table TABLE (
    DatabaseName nvarchar(255),
    SchemaName nvarchar(255),
    ColumnName nvarchar(255),
    DataType nvarchar(255)
);

-- Table for storing all database Names
DECLARE @Databases TABLE (
    database_id INT IDENTITY(1,1),
    name NVARCHAR(255)
);

-- Get all non-system databases
INSERT INTO @Databases (name)
SELECT [name]
FROM sys.databases
WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb')
ORDER BY database_id;

DECLARE @i INT = 1;
DECLARE @NumberOfDatabases INT;
DECLARE @DatabaseName NVARCHAR(255);

SELECT @NumberOfDatabases = COUNT(*) FROM @Databases;


while @i < @NumberOfDatabases
begin
	SELECT @DatabaseName = name FROM @Databases WHERE database_id = @i;
	  DECLARE @sql_query nvarchar(max) = '
    SELECT
        TABLE_CATALOG AS [DatabaseName],
        TABLE_SCHEMA AS [SchemaName],
        COLUMN_NAME AS [ColumnName],
        CONCAT(DATA_TYPE,
            ''('' +
            IIF(CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) = ''-1'', ''max'', CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR))
            + '')'') AS DataType
    FROM ' + QUOTENAME(@DatabaseName) + '.INFORMATION_SCHEMA.COLUMNS;';
	 INSERT INTO @temp_table
    EXEC sp_executesql @sql_query;
	 SET @i = @i + 1;

	

end

SELECT * FROM @temp_table;