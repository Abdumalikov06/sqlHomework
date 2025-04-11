drop table if exists test_identity;
create table test_identity
(
id int primary key identity(1,1),
name varchar(100),
test_date date,
created_at datetime default getdate(),
company varchar(50));

insert into test_identity(name,test_date,company)
values
('john','2022-12-22','Registan'),
('alex','2023-12-23','Longbridge'),
('mark','2024-11-12','facebook');

--truncate table test_identity;
delete from test_identity where id=2;

select * from test_identity;