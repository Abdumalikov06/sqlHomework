drop table if exists orders
create table orders
(
--order_id int primary key
order_id int,
customer_name varchar(50),
order_date date);
insert into orders
values
(1,'apple','2022-05-15'),
(2,'banana','2025-06-15');
alter table orders
alter column order_id int not null;
alter table orders
add constraint pk_orders primary key (order_id);
select * from orders;