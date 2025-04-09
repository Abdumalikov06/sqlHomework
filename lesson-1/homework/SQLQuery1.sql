drop table if exists student
create table student
(
id int,
name varchar(255),
age int
);
insert into student
values
(1,'john',13),
(2,'jack',24);
select * from student
alter table student
alter column id int not null;
