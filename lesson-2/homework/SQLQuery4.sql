create table student
(
id int primary key,
name varchar(50),
classes int,
tuition decimal(10,2),
total_tuition as (classes * tuition));

INSERT INTO student (id, name, classes, tuition)
VALUES 
    (1, 'Alice', 4, 250.00),
    (2, 'Bob', 3, 300.00),
    (3, 'Charlie', 5, 200.00);

select * from student;