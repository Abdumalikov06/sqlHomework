drop table if exists product
create table product
(
product_id int ,
product_name varchar(255),
price decimal(10,2));
alter table product
add unique(product_id,product_name);

insert into product
values
(1,'apple',2.333),
(2,'banana',3.111),
(3,'apple',2.4567);
select * from product