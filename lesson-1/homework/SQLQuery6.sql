drop table if exists customer;
create table customer
(
customer_id int primary key,
name varchar(255),
--city varchar(255) not null default 'Unknown'
city varchar(255) not null
);

alter table customer
add constraint df_city
default 'unknown' for city;

insert into customer
values
(1,'john','andijan');
insert into customer(customer_id,name)
values
(2,'anna');
select * from customer;