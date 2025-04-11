create table data_types_demo
(	
	id INT PRIMARY KEY,                          
    name VARCHAR(50),                            
    is_active smallint,
	yearly_salary bigint,
    salary DECIMAL(10, 2),
	col_char CHAR(50),            
    col_nchar NCHAR(50),           
    col_varchar VARCHAR(50),       
    col_nvarchar NVARCHAR(50),                      
    col_ntext NTEXT,               
    col_nvarchar_max NVARCHAR(MAX),
    birth_date DATE,
	work_time time,
    created_at DATETIME,                         
    description TEXT,                            
    rating FLOAT,                                
    unique_id UNIQUEIDENTIFIER                   
);
insert into data_types_demo(
    id, name, is_active, yearly_salary, salary,
    col_char, col_nchar, col_varchar, col_nvarchar,
    col_ntext, col_nvarchar_max,
    birth_date, work_time, created_at,
    description, rating, unique_id
)
VALUES (
    2,
    'Jane Doe',              
    1,                       
    120000,                  
    10000.50,                

    'char_fixed_length',    
    N'nchar_fixed_length',   
    'varchar_text',          
    N'nvarchar_text',        

    N'This is NTEXT data.',  
    N' Something new is coming here',

    '1992-08-15',            
    '09:30:00',              
    GETDATE(),               

    'This is a large text description stored in TEXT column.',
    4.95,                    
    NEWID()                  
);

select * from data_types_demo;